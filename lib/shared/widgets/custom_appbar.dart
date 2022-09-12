import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppbar({
    Key? key,
    this.title,
  }) : super(key: key);

  final Widget? title;

  static const double _height = 56.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final _title = title == null
        ? null
        : DefaultTextStyle(
            style: theme.textTheme.titleMedium!,
            child: title!,
          );

    return AppBar(
      title: _title,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_height);
}
