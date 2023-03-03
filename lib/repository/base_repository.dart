// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:knocksence_flutter_webapp/utils/my_sharepreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseRepository {
  // final _authBaseUrl = 'https://knockoff.xyz/api/v1/';

  // For post request
  // Future<http.Response> postHttp({
  //   required var data,
  //   required String api,
  //   String? token,
  //   Map<String, String>? headers,
  //   String? baseUrl,
  // }) async {
  //   // SharedPreferences myPrefs = await SharedPreferences.getInstance();
  //   // String? authToken =
  //   //     MySharedPreferences.instance.getStringValue("authToken", "", myPrefs);
  //   // log(api, name: 'postHttp');
  //   // log(data.toString(), name: 'postHttp');

  //   return http.post(
  //     Uri.parse(baseUrl.toString()  + api),

  //     body: json.encode(data),
  //   );
  // }

  // For get request
  Future<http.Response> getHttp({

    required String api,
    String? token,
    Map<String, String>? headers,
    String? baseUrl,
    bool addContentType = true,
  }) async {
    // SharedPreferences myPrefs = await SharedPreferences.getInstance();
    // String? authToken =
    //     MySharedPreferences.instance.getStringValue("authToken", "", myPrefs);
    // log(api, name: 'getHttp');
    // log((baseUrl ?? _authBaseUrl) + api, name: 'getHttp Path');

    return http.get(
      Uri.parse((baseUrl ?? '') + api),
      // headers: headers ??
      //     (addContentType
      //         ? {
      //             'Content-Type': 'application/json',
      //             'Authorization': 'Token $authToken'
      //           }
      //         : {'Authorization': 'Token $authToken'}),
    );
  }

 Future<http.Response> getHttp1({

    required String api,
    String? token,
    Map<String, String>? headers,
    String? baseUrl,
    bool addContentType = true,
  }) async {
    // SharedPreferences myPrefs = await SharedPreferences.getInstance();
    // String? authToken =
    //     MySharedPreferences.instance.getStringValue("authToken", "", myPrefs);
    // log(api, name: 'getHttp');
    // log((baseUrl ?? _authBaseUrl) + api, name: 'getHttp Path');


    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    String? authToken =
        MySharedPreferences.instance.getStringValue("token", "", myPrefs);

    log("Token1__________________$authToken");

    return http.get(
      Uri.parse((baseUrl ?? '') + api),
      headers:  {
                  'Content-Type': 'application/json',
                  'Authorization': 'Token $authToken'
                }
              
    );
  }

}
