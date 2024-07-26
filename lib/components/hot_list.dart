import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../hooks/hots.dart';

class HotList extends HookWidget {
  const HotList({super.key});

  @override
  Widget build(BuildContext context) {
    final hotList = useGetHotList();
    return Builder(
      builder: (context) {
        if (hotList.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (hotList.isError) {
          return Center(child: Text(hotList.error!.toString()));
        }

        return ListView.builder(
          itemCount: hotList.data?.items!.length,
          itemBuilder: (context, index) {
            // final hot = hotList.data.items[index];;
            return Row(
              children: [
                Image(
                  image: NetworkImage(
                      hotList.data!.items![index].owner!.avatarUrl!),
                  width: 100.0,
                ),
                Text('id:${hotList.data!.items![index].id}'),
                Text(' name:${hotList.data!.items![index].name}')
              ],
            );
          },
        );
      },
    );
  }
}
