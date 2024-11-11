import 'package:equatable/equatable.dart';
import 'package:flutter_block_tutorials/bloc_with_get_request/data/model/api_result_model.dart';

abstract class RestaurantState extends Equatable {
  @override
  List<Object> get props => [];
}

class RestaurantLoadingState extends RestaurantState {}

class RestaurantSuccessState extends RestaurantState {
  final RestaurantModel restaurantModel;

  RestaurantSuccessState({required this.restaurantModel});

  @override
  // TODO: implement props
  List<Object> get props => [restaurantModel];
}

class RestaurantFailState extends RestaurantState {
  final String message;

  RestaurantFailState({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
