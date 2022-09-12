part of 'favorites_cubit.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();
}

class FavoritesInitial extends FavoritesState {
  const FavoritesInitial();

  @override
  List<Object> get props => [];
}

class FavoritesLoadInProgress extends FavoritesState {
  const FavoritesLoadInProgress();

  @override
  List<Object> get props => [];
}

class FavoritesLoadSuccess extends FavoritesState {
  const FavoritesLoadSuccess(this.restaurants);

  final List<RestaurantModel> restaurants;

  @override
  List<Object> get props => [restaurants];
}

class FavoritesLoadFailure extends FavoritesState {
  const FavoritesLoadFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
