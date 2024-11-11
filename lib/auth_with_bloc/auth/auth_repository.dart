import 'dart:convert';

import 'package:flutter_block_tutorials/auth_with_bloc/auth/exception.dart';
import 'package:flutter_block_tutorials/auth_with_bloc/auth/login/login_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<String> attemptAutoLogin() async {
    await Future.delayed(Duration(seconds: 1));
    throw Exception('not signed in');
  }

  // Future<String> login({
  //   required String username,
  //   required String password,
  // }) async {
  //   print('attempting login');
  //   await Future.delayed(Duration(seconds: 3));
  //   return 'abc';
  // }

  Future<LoginResponseModel> login(String username, String password) async {
    // print('$mainUrl/auth/login');
    // try {
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

  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    await Future.delayed(Duration(seconds: 2));
  }

  Future<String> confirmSignUp({
    required String username,
    required String confirmationCode,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    return 'abc';
  }

  Future<void> signOut() async {
    await Future.delayed(Duration(seconds: 2));
  }
}
