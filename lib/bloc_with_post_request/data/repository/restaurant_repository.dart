import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/api_result_model.dart';

class RestaurantRepository {
  Future<RestaurantModel> getRestaurantData() async {
    final response = await http.get(Uri.parse(
        'https://virtserver.swaggerhub.com/moontai0724/cmrdb-6th-hackathon/0.1.0/restaurants'));

    if (response.statusCode == 200) {
      final String responseBody = utf8.decode(response.bodyBytes);
      final dynamic jsonData = json.decode(responseBody);

      return RestaurantModel.fromJson(jsonData);
    } else {
      print("EEEE");
      throw Exception();
    }
  }
}
