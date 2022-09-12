part of 'home_navigation_cubit.dart';

class HomeNavigationState extends Equatable {
  const HomeNavigationState({
    this.currentIndex = TabItem.restaurantsList,
  });

  final TabItem currentIndex;

  // copy with
  HomeNavigationState copyWith({
    TabItem? currentIndex,
  }) {
    return HomeNavigationState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
