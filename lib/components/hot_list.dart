import 'package:flutter/material.dart';
import 'package:fquery/fquery.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../util/request.dart';
import '../models/hots.dart';

Future<Hots> getHotList() async {
  final res = await DioClient()
      .get('/search/repositories?q=stars:>10000&sort=stars&order=desc');
  final obj = Hots.fromJson(res.data);
  print('obj:$obj');
  return obj;
}

class HotList extends HookWidget {
  const HotList({super.key});

  @override
  Widget build(BuildContext context) {
    final hotList = useQuery(['Hots'], getHotList);
    print('hotList:$hotList');
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
