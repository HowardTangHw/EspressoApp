import 'package:flutter/material.dart';
import '../hooks/favorite_list.dart' as fv;
import '../models/favorite_list.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fquery/fquery.dart';

//
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
    final items = useInfiniteQuery<FavoriteList, Error, int>(
      ['infinity'],
      (page) => fv.getFavoriteList(page: page),
      initialPageParam: 1,
      getNextPageParam: ((lastPage, allPages, lastPageParam, allPageParam) {
        return allPages.length < (lastPage.totalCount ?? 0)
            ? lastPage.page + 1
            : null;
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
          final contents =
              items.data?.pages.map((page) => page.items).toList() ?? [];
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
                      return listItem(contents[index] as Items);
                    })),
              ),
              if (items.isFetchingNextPage)
                const SizedBox(
                  height: 100,
                  width: double.maxFinite,
                  child: CircularProgressIndicator(),
                ),
            ],
          );
        },
      ),
    );
  }
}
