import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_tutorials/bloc_with_get_request/bloc/restaurant_bloc.dart';
import 'package:flutter_block_tutorials/bloc_with_get_request/bloc/restaurant_event.dart';
import 'package:flutter_block_tutorials/bloc_with_get_request/bloc/restaurant_state.dart';
import 'package:flutter_block_tutorials/bloc_with_get_request/data/model/api_result_model.dart';
// own import
import 'about_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RestaurantBloc? _restaurantBloc;
  Size? size;
  @override
  void initState() {
    super.initState();
    _restaurantBloc = BlocProvider.of<RestaurantBloc>(context);
    _restaurantBloc!.add(FetchRestaurantEvent());
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              appBar: AppBar(
                title:const Text("Api-Get"),
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                    icon:const Icon(Icons.refresh),
                    onPressed: () {
                      _restaurantBloc!.add(FetchRestaurantEvent());
                    },
                  ),
                  IconButton(
                    icon:const Icon(Icons.info),
                    onPressed: () {
                      navigateToAboutPage(context);
                    },
                  )
                ],
              ),
              body: BlocListener<RestaurantBloc, RestaurantState>(
                listener: (context, state) {
                  if (state is RestaurantFailState) {
                    SnackBar(
                      content: Text(state.message),
                      duration: const Duration(
                          milliseconds:
                              300), // Use milliseconds instead of microseconds for better visibility
                    );
                  }
                },
                child: BlocBuilder<RestaurantBloc, RestaurantState>(
                  builder: (context, state) {
                    if (state is RestaurantLoadingState) {
                      return _buildLoading();
                    } else if (state is RestaurantSuccessState) {
                      return buildArticleList(state.restaurantModel);
                    } else if (state is RestaurantFailState) {
                      return _buildErrorUi(state.message);
                    }
                    return Container();
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child:CircularProgressIndicator(),
    );
  }

  Widget _buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style:const TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget buildArticleList(RestaurantModel restaurantModel) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 30),
      itemCount: restaurantModel.data!.length,
      itemBuilder: (context, int index) =>
          buildCustomItem(context, index, restaurantModel.data!.toList()),
    );
  }

  void navigateToAboutPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AboutPage();
    }));
  }

  Widget buildCustomItem(BuildContext context, int index, List<Datum> data) {
    return Container(
        padding:
            EdgeInsets.only(left: size!.width * 0.1, right: size!.width * 0.1),
        // height: 500,
        width: size!.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, right: 8.0, left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data[index].name.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan[700]),
                  ),
                  Text(
                    "最低\$${data[index].lowestPrice}外送",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan[700]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(data[index].description.toString(),
                  style: TextStyle(fontSize: 15, color: Colors.cyan[700])),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, right: 8.0, left: 8.0),
              child: Text(data[index].address.toString(),
                  style: TextStyle(fontSize: 15, color: Colors.cyan[700])),
            ),
          ],
        ));
  }
}
