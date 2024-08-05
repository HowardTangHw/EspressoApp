import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RepoDetailPage extends StatelessWidget {
  const RepoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('detail page'),
              systemOverlayStyle: const SystemUiOverlayStyle(
                // Status bar color
                statusBarColor: Colors.red,

                // Status bar brightness (optional)
                statusBarIconBrightness:
                    Brightness.dark, // For Android (dark icons)
                statusBarBrightness: Brightness.light, // For iOS (dark icons)
              ),
            ),
            body: SafeArea(
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
