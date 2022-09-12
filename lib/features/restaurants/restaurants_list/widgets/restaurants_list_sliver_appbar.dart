import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:restaurants/shared/shared.dart';

class RestaurantsListSliverAppBar extends StatelessWidget {
  const RestaurantsListSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      backgroundColor: theme.colorScheme.background,
      // pinned: true,
      floating: true,
      snap: true,
      toolbarHeight: 56 + 32.0,
      title: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Hero(
          tag: 'restaurants_list_search_field',
          child: CustomTextField.outlined(
            placeholder: 'Поиск',
            prefix: const Icon(Icons.search),
            readOnly: true,
            onTap: () {
              log('message');
            },
          ),
        ),
      ),
    );
  }
}
