import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing/cubit/favorite_cubit/favorite_state.dart';
import 'package:testing/model/products_model.dart';

class FavoriteCubite extends Cubit<FavoriteState> {
  FavoriteCubite() : super(StateChangeFavorite());
  refresh() {
    emit(StateChangeFavorite());
  }

  changeSelectFavorite({required ProductsModel data}) async {
    data.favorite = !data.favorite;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(data.id.toString(), data.favorite);
    emit(StateChangeFavorite());
  }
}
