import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing/constant/name_constant.dart';
import 'package:testing/cubit/display_cubit/display_state.dart';
import 'package:testing/helper/api.dart';
import 'package:testing/model/products_model.dart';

class DisplayCubit extends Cubit<DisplayState> {
  DisplayCubit() : super(StateInitial());
  List<ProductsModel> allData = [];
  Future getAllProducts() async {
    emit(StateLoading());
    try {
      // allData.clear();
      late List<dynamic> apiData;
      if (allData.isEmpty) {
        apiData = await Api().getProduct(
          uri: AppApi.base,
        );
        for (int i = 0; i < apiData.length; i++) {
          allData.add(
            ProductsModel.jsoncode(apiData[i]),
          );
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          for (var item in allData) {
            if (prefs.getBool(item.id.toString()) == null) {
              prefs.setBool(item.id.toString(), item.favorite);
            } else {
              item.favorite = prefs.getBool(item.id.toString())!;
            }
          }
        }
      }

      emit(StateSuccessful(data: allData));
    } catch (e) {
      emit(StateFailed(errerMessage: e.toString()));
    }
  }

  Future getCategoryProducts({required String? category}) async {
    emit(StateLoading());
    try {
      List<ProductsModel> categoryData = [];
      List<dynamic> data = await Api().getProduct(
        uri: '${AppApi.base}category/$category',
      );

      for (int i = 0; i < data.length; i++) {
        categoryData.add(
          ProductsModel.jsoncode(data[i]),
        );
      }
      emit(StateSuccessful(data: categoryData));
    } catch (e) {
      emit(StateFailed(errerMessage: 'Error : $e'));
    }
  }

  getFavoriteProducts() {
    List<ProductsModel> data = [];
    for (ProductsModel item in allData) {
      if (item.favorite) {
        data.add(item);
      }
    }
    emit(StateSuccessful(data: data));
  }
}
