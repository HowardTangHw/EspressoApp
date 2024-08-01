import 'package:flutter/material.dart';

class FavoriteListItemTag extends StatelessWidget {
  const FavoriteListItemTag(
      {super.key,
      this.icon,
      this.text,
      this.margin,
      this.padding,
      this.decoration,
      this.textStyle});
  final dynamic icon;
  final dynamic text;
  final BoxDecoration? decoration;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return tagItem();
  }

  Widget tagItem() {
    return Container(
        margin: margin ?? const EdgeInsets.only(right: 4.0),
        padding: padding ?? const EdgeInsets.only(bottom: 8, right: 8),
        decoration: decoration,
        child: Wrap(
          children: [
            if (icon != null)
              Icon(
                icon,
                size: 16,
              ),
            if (icon != null && text != null) const SizedBox(width: 2),
            if (text != null)
              Text(
                text is String ? text : text.toString(),
                style: textStyle ??
                    const TextStyle(
                      fontSize: 12,
                    ),
              ),
          ],
        ));
  }
}
