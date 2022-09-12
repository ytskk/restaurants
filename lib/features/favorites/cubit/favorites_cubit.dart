import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurants/features/features.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this._restaurantsRepository) : super(const FavoritesInitial());

  final RestaurantsRepositoryInterface _restaurantsRepository;

  Future<List<RestaurantModel>> getFavorites() async {
    emit(const FavoritesLoadInProgress());

    try {
      final List<RestaurantModel> favorites =
          await _restaurantsRepository.getFavorites();
      emit(FavoritesLoadSuccess(favorites));

      return favorites;
    } catch (e) {
      emit(FavoritesLoadFailure(e.toString()));
      return [];
    }
  }
}
