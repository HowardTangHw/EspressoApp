import 'package:espresso/models/favorite_list.dart';
import 'package:flutter/material.dart';
import '../util/constants.dart' as constants;
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

class Tag {
  final int count;
  final IconData icon;

  Tag({
    required this.count,
    required this.icon,
  });
}

class FavoriteListItem extends StatelessWidget {
  const FavoriteListItem({super.key, required this.item, this.index});
  final Items item;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return listItem(context, constraints.maxWidth);
          },
        ),
      ),
    );
  }

  Widget listItem(BuildContext context, double maxWidth) {
    final List<Tag> tags = [
      Tag(count: item.forksCount ?? 0, icon: Icons.fork_right),
      Tag(count: item.watchersCount ?? 0, icon: Icons.visibility),
      Tag(count: item.stargazersCount ?? 0, icon: Icons.star),
      Tag(count: item.openIssuesCount ?? 0, icon: Icons.bug_report),
    ];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: FancyShimmerImage(
            imageUrl: item.owner!.avatarUrl!,
            width: 100.0,
            height: 100.0,
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ...tags.map(
                    (tagItem) => Container(
                        margin: const EdgeInsets.only(right: 4.0),
                        padding:
                            const EdgeInsets.only(top: 10, bottom: 8, right: 8),
                        child: Row(
                          children: [
                            Icon(
                              tagItem.icon,
                              size: 16,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              '${tagItem.count}',
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth - 108),
                child: Text(
                  index != null ? '$index. ${item.name}' : '${item.name}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: 4.0),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth - 100),
                child: Text(
                  'description: ${item.description}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: 4.0),
              if (item.language != null && item.language!.isNotEmpty)
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxWidth - 100),
                  child: Text(
                    'language: ${item.language}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              Container(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: item.topics!
                      .take(3)
                      .map((topic) => Container(
                            margin: const EdgeInsets.only(right: 4.0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: constants.Colors.secondary,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              topic,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
