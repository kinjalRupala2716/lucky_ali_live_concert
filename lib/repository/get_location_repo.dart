import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:developer';
import 'package:knocksence_flutter_webapp/repository/base_repository.dart';
import 'package:http/http.dart' as http;
import 'package:knocksence_flutter_webapp/utils/my_sharepreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetLocationRepo extends BaseRepository {
  // static const baseURL = "https://knockoff.xyz/api/v1/";

  static const baseURL = "https://knocksense-prod.cartoonmango.com/api/v1/";
  //Get Api
  static const getLocation = "users/locality";
  static const getLocationBasedEvent = "event/web-events";
  static const getEvetDetails = "event/detail/";
  static const verifyOrderId = "event/orders/";
  static const getSearchApi =
      "event/web-events?";

  //Post Api
  static const signin = "users/sign-in";
  static const otpVerify = "users/verify-otp";
  static const bookTicket = "event/";

  static const ticketPayment = "event/";

  Future<dynamic> getLocationApi() async {
    const api = getLocation;
    final response = await getHttp(
      baseUrl: baseURL,
      api: api,
    );
    developer.log(response.body, name: 'response of get location');
    developer.log(baseURL + api, name: 'api of get location');
    return json.decode(response.body);
  }

  Future<dynamic> getLocationBasedEventsApi(int id) async {
    final api = "$getLocationBasedEvent?location_id=$id";
    final response = await getHttp(
      baseUrl: baseURL,
      api: api,
    );
    developer.log(response.body, name: 'response of get location based events');
    developer.log(baseURL + api, name: 'api of get location based events');
    return json.decode(response.body);
  }

  Future<dynamic> getAllEventsApi() async {
    const api = getLocationBasedEvent;
    final response = await getHttp(
      baseUrl: baseURL,
      api: api,
    );
    developer.log(response.body, name: 'response of get all events');
    developer.log(baseURL + api, name: 'api of get all events');
    return json.decode(response.body);
  }

  Future<dynamic> getEvetDetailApi(int id) async {
    final api = "$getEvetDetails$id";
    final response = await getHttp(
      baseUrl: baseURL,
      api: api,
    );
    // developer.log(response.body, name: 'response of get Event Details');
    developer.log(baseURL + api, name: 'api of get search Event');
    return json.decode(response.body);
  }

  Future<dynamic> getSearchBasedEventApi(int id, String day) async {
    final api = "$getSearchApi+location_id=$id&search=$day";
    final response = await getHttp(
      baseUrl: baseURL,
      api: api,
    );
    // developer.log(response.body, name: 'response of get Event Details');
    developer.log(baseURL + api, name: 'api of get search Event');
    return json.decode(response.body);
  }

  Future<dynamic> verifyOrderIdApi(String id) async {
    final api = '$verifyOrderId$id';
    final response = await getHttp1(
      baseUrl: baseURL,
      api: api,
    );
    developer.log(response.body, name: 'response of get location');
    developer.log(baseURL + api, name: 'api of get location');
    return json.decode(response.body);
  }

  Future<dynamic> signInApi(Map data) async {
    const api = signin;
    final response = await _postHttp(
      data: data,
      // base: baseURL,
      api: api,
    );
    // developer.log(response.body, name: 'response of get Event Details');
    developer.log(baseURL + api, name: 'api of get search Event');
    return json.decode(response.body);
  }

  Future<dynamic> otpVerifyApi(Map data) async {
    const api = otpVerify;
    final response = await _postHttp(
      data: data,
      // base: baseURL,
      api: api,
    );
    // developer.log(response.body, name: 'response of get Event Details');
    developer.log(baseURL + api, name: 'api of otp verification');
    return json.decode(response.body);
  }

  Future<dynamic> bookTicketApi(Map<String, dynamic> data, int id) async {
    // SharedPreferences myPrefs = await SharedPreferences.getInstance();
    // String? authToken =
    //     MySharedPreferences.instance.getStringValue("authToken", "", myPrefs);
    // const api = bookTicket;
    final response = await postHttp1(
      data: data,

      // base: baseURL,
      api: "$bookTicket$id/book-ticket",
    );
    developer.log(response.statusCode.toString(), name: 'response of code');
    developer.log(response.body.toString(), name: 'response of body');
    // developer.log(baseURL + api, name: 'api of book ticket api');
    return json.decode(response.body);
  }

  Future<dynamic> ticketPaymentApi(Map<String, dynamic> data, int id) async {
    // SharedPreferences myPrefs = await SharedPreferences.getInstance();
    // String? authToken =
    //     MySharedPreferences.instance.getStringValue("authToken", "", myPrefs);
    // const api = bookTicket;
    final response = await postHttp1(
      data: data,

      // base: baseURL,
      api: "$bookTicket$id/ticket-payment",
    );
    developer.log(response.statusCode.toString(), name: 'response of code');
    developer.log(response.body.toString(), name: 'response of body');
    // developer.log(baseURL + api, name: 'api of book ticket api');
    return json.decode(response.body);
  }

  Future<dynamic> checkoutApi(int id) async {
    // SharedPreferences myPrefs = await SharedPreferences.getInstance();
    // String? authToken =
    //     MySharedPreferences.instance.getStringValue("authToken", "", myPrefs);
    // const api = bookTicket;
    final response = await postHttp1(
      data: null,

      // base: baseURL,
      api: "$bookTicket$id/book-ticket",
    );
    developer.log(response.statusCode.toString(), name: 'response of code');
    developer.log(response.body.toString(), name: 'response of body');
    // developer.log(baseURL + api, name: 'api of book ticket api');
    return json.decode(response.body);
  }

  Future<http.Response> _postHttp({
    required Map data,
    required String api,
  }) async {
    return http.post(
      Uri.parse(baseURL + api),
      headers: {
        'Content-Type': 'application/json',
        // 'Authorization': "Token $authToken"
        // 'Authorization':
        //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzA5MDE2MDE1LCJqdGkiOiI0MzVlZWZjMTAwMjM0Y2U4ODMwNjJlN2YyM2MyNzAwYSIsInVzZXJfaWQiOjUwMTQyfQ.kFmZoQDqdt5HRSloFKn6kgado1LB253MKBzdIvj1GNQ"
      },
      body: json.encode(data),
    );
  }

  // For post request
  Future<http.Response> postHttp1({
    required var data,
    required String api,
    Map<String, String>? headers,
    String? baseUrl,
  }) async {
    log(api, name: 'postHttp');
    log(data.toString(), name: 'postHttp');

    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    String? authToken =
        MySharedPreferences.instance.getStringValue("token", "", myPrefs);

    log("Token1__________________$authToken");

    return http.post(
      Uri.parse(baseURL + api),
      headers: headers ??
          {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $authToken'
          },
      body: json.encode(data),
    );
  }
}
