import 'dart:developer' as developer;
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:knocksence_flutter_webapp/models/event_detail_model.dart';
import 'package:knocksence_flutter_webapp/models/get_location_model.dart';
import 'package:knocksence_flutter_webapp/models/locationbased_event_model.dart';
import 'package:knocksence_flutter_webapp/models/ticket_detail_model.dart';
import 'package:knocksence_flutter_webapp/models/verify_orderId_model.dart';
import 'package:knocksence_flutter_webapp/providers/base_provider.dart';
import 'package:knocksence_flutter_webapp/repository/get_location_repo.dart';

class GetLocactionProvider extends BaseProvider {
  final GetLocationRepo _getLocationRepo = GetLocationRepo();

  List<GetLocationModel> getLocationList = [];
  List<LocationBasedEventModel> locationBasedEventsList = [];
  EventDetailModel? eventDetailModel;
  List<EventDetailModel> eventDetailList = [];

  List<LocationBasedEventModel> searchList = [];

  VerifyIdModel? verifyIdModel;
  // TicketDetailModel? ticketDetailModel;

  List<TicketDetailModel> ticketList = [];

  Future getLocation() async {
    var responseData = await _getLocationRepo.getLocationApi();

    if (responseData['code'] == 900) {
      // developer.log(responseData.toString(), name: 'Response of get Location');
      getLocationList = responseData["data"].map<GetLocationModel>((location) {
        return GetLocationModel.fromJson(location);
      }).toList();
      // developer.log(getLocationList.toString(), name: "list of location");

      notifyListeners();
    } else {
      // developer.log(responseData.toString(), name: 'Error of get Location ');
    }
  }

  Future getLocationBasedEvents(int id) async {
    var responseData = await _getLocationRepo.getLocationBasedEventsApi(id);

    if (responseData['code'] == 900) {
      // developer.log(responseData.toString(),
      //     name: 'Response of get LocationBasedEvents');
      locationBasedEventsList = responseData["data"]["event_list"]
          .map<LocationBasedEventModel>((location) {
        return LocationBasedEventModel.fromJson(location);
      }).toList();
      developer.log(locationBasedEventsList.toString(),
          name: "list of locationBasedEvents");

      notifyListeners();
    } else {
      developer.log(responseData.toString(),
          name: 'Error of get LocationBasedEvents ');
    }
  }

  Future getAllEvents() async {
    var responseData = await _getLocationRepo.getAllEventsApi();

    if (responseData['code'] == 900) {
      developer.log(responseData.toString(),
          name: 'Response of get All Events');
      locationBasedEventsList = responseData["data"]["event_list"]
          .map<LocationBasedEventModel>((location) {
        return LocationBasedEventModel.fromJson(location);
      }).toList();
      developer.log(locationBasedEventsList.toString(),
          name: "list of all Events");

      notifyListeners();
    } else {
      developer.log(responseData.toString(), name: 'Error of get all Events ');
    }
  }

  Future<dynamic> getSearchEvetDetail(int id, String day) async {
    try {
      Map<String, dynamic> responseData =
          await _getLocationRepo.getSearchBasedEventApi(id, day);
      if (responseData['code'] == 900) {
        // eventDetailModel = EventDetailModel.fromJson(responseData["data"]);
        searchList = responseData["data"]["event_list"]
            .map<LocationBasedEventModel>((location) {
          return LocationBasedEventModel.fromJson(location);
        }).toList();

        log("EvtDeatails__________________$eventDetailModel");

        notifyListeners();
        return eventDetailModel;
      } else {
        developer.log(responseData.toString(), name: 'logging');
      }
    } catch (e) {
      developer.log("$e", name: "connection failed");
    }
  }

  Future<dynamic> getEvetDetail(int id) async {
    try {
      Map<String, dynamic> responseData =
          await _getLocationRepo.getEvetDetailApi(id);
      if (responseData['error'] == false) {
        eventDetailModel = EventDetailModel.fromJson(responseData["data"]);

        log("EvtDeatails__________________$eventDetailModel");

        notifyListeners();
        return eventDetailModel;
      } else {
        developer.log(responseData.toString(), name: 'logging');
      }
    } catch (e) {
      developer.log("$e", name: "connection failed");
    }
  }

  Future<dynamic> verifyOrderIdProvider(
    String id,
    BuildContext context,
  ) async {
    try {
      Map<String, dynamic> responseData =
          await _getLocationRepo.verifyOrderIdApi(id);
      if (responseData['code'] == 900) {
        verifyIdModel = VerifyIdModel.fromJson(responseData['data']);
        log("verifyIdModel__________________$verifyIdModel");

        developer.log(responseData.toString(), name: 'verifyIdModel');

        // ignore: use_build_context_synchronously

        notifyListeners();
        return verifyIdModel;
      } else {
        developer.log(responseData.toString(), name: 'verifyIdModel');
      }
    } catch (e) {
      developer.log("$e", name: "connection failed");
    }
  }

  Future<dynamic> signInProvider(Map data) async {
    try {
      Map<String, dynamic> responseData =
          await _getLocationRepo.signInApi(data);

      developer.log(responseData.toString());
      return responseData;
    } catch (e) {
      developer.log("$e", name: "connection failed");
    }
  }

  Future<dynamic> otpVerifyProvider(Map data) async {
    try {
      Map<String, dynamic> responseData =
          await _getLocationRepo.otpVerifyApi(data);

      developer.log(responseData.toString());
      return responseData;
    } catch (e) {
      developer.log("$e", name: "connection failed");
    }
  }

  Future<dynamic> bookTicketProvider(Map<String, dynamic> data, int id) async {
    try {
      Map<String, dynamic> responseData =
          await _getLocationRepo.bookTicketApi(data, id);

      // if (responseData['code'] == 900) {
      //   developer.log(responseData.toString(), name: "bookTicketProvider-----");
      //   ticketDetailModel = TicketDetailModel.fromJson(responseData);
      //   // ticketList = tempList;

      // }
      notifyListeners();

      return responseData;
    } catch (e) {
      developer.log("$e", name: "connection failed");
    }
  }

  Future<dynamic> checkoutProvider(int id) async {
    try {
      Map<String, dynamic> responseData =
          await _getLocationRepo.checkoutApi(id);

      if (responseData['code'] == 900) {
        developer.log(responseData.toString(), name: "checkoutProvider-----");
        ticketList = responseData['data']['Attendee_data'].map((json) {
          return TicketDetailModel.fromJson(json);
        }).toList();

        notifyListeners();
      }

      developer.log(ticketList.toString(), name: "ticketList-----");

      return responseData;
    } catch (e) {
      developer.log("$e", name: "connection failed");
    }
  }

  Future<dynamic> ticketPaymentProvider(
      Map<String, dynamic> data, int id) async {
    try {
      Map<String, dynamic> responseData =
          await _getLocationRepo.ticketPaymentApi(data, id);

      if (responseData['code'] == 900) {
        developer.log("TicketPaymentProvider-----");
      }
      notifyListeners();

      return responseData;
    } catch (e) {
      developer.log("$e", name: "connection failed");
    }
  }
}
