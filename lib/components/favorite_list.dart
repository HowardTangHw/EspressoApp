import 'package:flutter/material.dart';
import '../hooks/favorite_list.dart' as fv;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../models/favorite_list.dart';

// 传统的使用了infinite_scroll_pagination组件
// 如果想要看到hooks的版本和fquery版本请查看favorite_list_hooks
// TODO: 把listItem抽出去
// TODO: 下拉刷新
class FavoriteList extends StatefulWidget {
  const FavoriteList({super.key});

  @override
  FavoriteListState createState() => FavoriteListState();
}

class FavoriteListState extends State<FavoriteList> {
  static const _pageSize = 50;

  final PagingController<int, Items> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems =
          await fv.getFavoriteList(page: pageKey, pageSize: _pageSize);
      final isLastPage = newItems.items!.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems.items!);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems.items!, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

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
  Widget build(BuildContext context) => PagedListView<int, Items>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Items>(
          itemBuilder: (context, item, index) => listItem(
            item,
          ),
        ),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
