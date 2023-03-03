import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class BaseProvider with ChangeNotifier {
  static String? authToken;

  final baseUrl = 'https://knocksense-prod.cartoonmango.com/api/v1/';
  // SharedPreferences? myPrefs;

  Future<Map<String, dynamic>> postPublicApi(
      String path, Map<String, dynamic> body,
      {Map<String, dynamic> headers = const {}}) async {
    if (kDebugMode) log('[POST] $path\n$body');

    // myPrefs = await SharedPreferences.getInstance();
    // authToken =
    //     MySharedPreferences.instance.getStringValue("authToken", "", myPrefs!);

    final http.Response response = await http.post(
      Uri.parse(baseUrl + path),
      // Uri.parse(''),
      body: jsonEncode(body),
      headers: {
        'Authorization': 'Token $authToken',
        'Content-Type': 'application/json',
        ...headers
      },
    );
    if (response.statusCode != 200) {
      throw HttpException(
          'An error has occured, statusCode: ${response.statusCode}, body: ${response.body}');
    }
    if (kDebugMode) log(response.body);
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> getPublicApi(
    String path,
  ) async {
    if (kDebugMode) log('[GET] $path');

    final http.Response response = await http.get(
      Uri.parse(''),
      headers: {'Authorization': 'Token $authToken'},
    );
    if (response.statusCode != 200) {
      throw HttpException(
          'An error has occured, statusCode: ${response.statusCode}, body: ${response.body}');
    }
    if (kDebugMode) log(response.body);
    return jsonDecode(response.body);
  }
}
