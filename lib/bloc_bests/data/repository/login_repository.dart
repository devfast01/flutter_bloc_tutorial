import 'dart:async';
import 'package:flutter_block_tutorials/auth_with_bloc/auth/exception.dart';
import 'package:flutter_block_tutorials/bloc_bests/data/model/login_response_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginRepository {
  Future<LoginResponseModel> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('http://192.168.100.1:5000/api/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': '',
      },
      body: jsonEncode(<String, dynamic>{
        'username': username,
        'password': password,
        'device': {'id': '2231f43s44', 'name': 'bloc_example'}
      }),
    );
    final String responseBody = utf8.decode(response.bodyBytes);
    final dynamic jsonData = json.decode(responseBody);

    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(jsonData);
    } else {
      throw const ServerException(message: 'Server error.');
    }
  }
}
