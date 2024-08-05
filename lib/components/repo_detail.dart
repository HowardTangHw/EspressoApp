import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RepoDetailPage extends StatelessWidget {
  const RepoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
                leading: Text(''), middle: Text('Detail Page')),
            child: SafeArea(
              bottom: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: const Text('Edit'),
                    leading: const Icon(Icons.edit),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  ListTile(
                    title: const Text('Copy'),
                    leading: const Icon(Icons.content_copy),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  ListTile(
                    title: const Text('Cut'),
                    leading: const Icon(Icons.content_cut),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  ListTile(
                    title: const Text('Move'),
                    leading: const Icon(Icons.folder_open),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  ListTile(
                    title: const Text('Delete'),
                    leading: const Icon(Icons.delete),
                    onTap: () => Navigator.of(context).pop(),
                  )
                ],
              ),
            )));
  }
}
