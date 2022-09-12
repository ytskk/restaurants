import 'package:flutter/material.dart';
import 'package:restaurants/constants/constants.dart';

enum TabItem { restaurantsList, map, favorites, profile }

class HomeNavigationBuilder extends StatefulWidget {
  const HomeNavigationBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final Widget Function(BuildContext, TabItem) builder;

  @override
  _HomeNavigationBuilderState createState() => _HomeNavigationBuilderState();
}

class _HomeNavigationBuilderState extends State<HomeNavigationBuilder> {
  TabItem _currentTab = TabItem.restaurantsList;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: widget.builder(context, _currentTab),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab.index,
        onTap: (index) => setState(() => _currentTab = TabItem.values[index]),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.restaurant_menu_rounded,
            ),
            label: AppStrings.navigationRestaurantsListTitle,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
            ),
            label: AppStrings.navigationMapTitle,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_rounded,
            ),
            label: AppStrings.navigationFavoritesTitle,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            label: AppStrings.navigationProfileTitle,
          ),
        ],
      ),
    );
  }
}
