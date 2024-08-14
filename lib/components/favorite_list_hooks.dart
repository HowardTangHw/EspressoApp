import 'package:flutter/material.dart';
import 'package:espresso/hooks/favorite_list.dart' as fv;
import 'package:espresso/models/favorite_list.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fquery/fquery.dart';

class FavoriteListHooks extends HookWidget {
  const FavoriteListHooks({super.key});

  Widget listItem(Items item) {
    return Builder(builder: (context) {
      return Row(
        children: [
          Image(
            image: NetworkImage(item.owner!.avatarUrl!),
            width: 100.0,
          ),
          Text('id:${item.id}'),
          Text(' name:${item.name}')
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final page = useState(1);
    final items = useInfiniteQuery<FavoriteList, Error, int>(
      ['infinity'],
      (page) => fv.getFavoriteList(page: page),
      initialPageParam: 1,
      getNextPageParam: ((lastPage, allPages, lastPageParam, allPageParam) {
        ++page.value;
        return allPages.length < (lastPage.totalCount ?? 0) ? page.value : null;
      }),
    );

    useEffect(() {
      scrollController.addListener(() {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          items.fetchNextPage();
        }
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            // Subtract 1 pixels to stop fetching the next page automatically
            scrollController.position.maxScrollExtent - 1,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
          );
        }
      });
      return null;
    }, []);
    return SafeArea(
      child: Builder(
        builder: (context) {
          if (items.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (items.isError) return Text(items.error.toString());
          final contents = (items.data?.pages.expand((page) {
                if (page.items != null) {
                  return page.items!;
                }
                return [];
              }).toList() ??
              []);
          if (contents.isEmpty) return const Text('no data');
          return Column(
            children: [
              if (items.isFetchingPreviousPage)
                const SizedBox(
                  height: 100,
                  width: double.maxFinite,
                  child: CircularProgressIndicator(),
                ),
              Expanded(
                child: ListView.builder(
                    controller: scrollController,
                    itemCount: contents.length,
                    itemBuilder: ((context, index) {
                      return listItem(contents[index]);
                    })),
              ),
              if (items.isFetchingNextPage) const CircularProgressIndicator()
            ],
          );
        },
      ),
    );
  }
}
