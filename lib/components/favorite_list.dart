import 'package:flutter/material.dart';
import 'package:espresso/hooks/favorite_list.dart' as fv;
import './favorite_list_item.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:espresso/models/favorite_list.dart';

// 传统的使用了infinite_scroll_pagination组件
// 如果想要看到hooks的版本和fquery版本请查看favorite_list_hooks
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

  @override
  Widget build(BuildContext context) => RefreshIndicator(
      onRefresh: () => Future.sync(
            () => _pagingController.refresh(),
          ),
      child: PagedListView<int, Items>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Items>(
          itemBuilder: (context, item, index) =>
              FavoriteListItem(item: item, index: index + 1),
        ),
      ));

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
