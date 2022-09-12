import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurants/shared/home_navigation/home_navigation.dart';

part 'home_navigation_state.dart';

class HomeNavigationCubit extends Cubit<HomeNavigationState> {
  HomeNavigationCubit() : super(const HomeNavigationState());

  void changeIndex(TabItem tabItem) {
    emit(state.copyWith(currentIndex: tabItem));
  }
}
