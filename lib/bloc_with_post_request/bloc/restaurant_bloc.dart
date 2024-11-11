import 'package:bloc/bloc.dart';
import 'package:flutter_block_tutorials/bloc_with_post_request/data/model/api_result_model.dart';
import 'package:flutter_block_tutorials/bloc_with_post_request/data/repository/restaurant_repository.dart';

import 'restaurant_event.dart';
import 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantRepository restaurantRepository;

  RestaurantBloc({required this.restaurantRepository})
      : super(RestaurantLoadingState());

  RestaurantState get initialState => RestaurantLoadingState();

  Stream<RestaurantState> mapEventToState(RestaurantEvent event) async* {
    if (event is FetchRestaurantEvent) {
      yield RestaurantLoadingState();
      try {
        RestaurantModel restaurantModel =
            await restaurantRepository.getRestaurantData();
        print("Bloc Success");
        yield RestaurantSuccessState(restaurantModel: restaurantModel);
      } catch (e) {
        print(await restaurantRepository.getRestaurantData());
        yield RestaurantFailState(message: "???");
      }
    }
  }
}
