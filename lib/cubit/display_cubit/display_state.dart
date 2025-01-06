import 'package:testing/model/products_model.dart';

abstract class DisplayState {}

class StateInitial extends DisplayState {}

class StateLoading extends DisplayState {}

class StateSuccessful extends DisplayState {
  final List<ProductsModel> data;
  StateSuccessful({required this.data});
}

class StateFailed extends DisplayState {
  final String errerMessage;

  StateFailed({required this.errerMessage});
}
