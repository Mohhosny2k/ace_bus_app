import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'bus_model.dart';
import 'bus_state.dart';

//import 'package:shared_preferences/shared_preferences.dart';
final String domainAddress = 'https://acs-bus-default-rtdb.firebaseio.com';

class BusController extends Cubit<BusState> {
  BusController() : super(BusInitialState()) {
    getBuss();
    getRecommanded();
    getCheapest();
    getFastest();
    searchOneSix();
    searchTwoSix();
    searchThreeSix();
  }
  List<BusModel> _allBus = [];
  List<BusModel> get alllBuss => _allBus;

  List<BusModel> _recommenbus = [];
  List<BusModel> get recommmanded => _recommenbus;

  List<BusModel> _cheapestBus = [];
  List<BusModel> get chebus => _cheapestBus;

  List<BusModel> _fastestBus = [];
  List<BusModel> get fasbus => _fastestBus;

  List<BusModel> _oneSix = [];
  List<BusModel> get one => _oneSix;

  List<BusModel> _twoSix = [];
  List<BusModel> get two => _twoSix;

  List<BusModel> _threeSix = [];
  List<BusModel> get three => _threeSix;

  Future<void> getBuss() async {
    emit(GetTravelLoadingState());
    try {
      http.Response res = await http.get(Uri.parse('$domainAddress/bus.json'));
      Map data = json.decode(res.body);

      if (res.statusCode == 200) {
        _allBus.clear();
        data.forEach((key, value) {
          BusModel bus = BusModel.fromJson(key, value);
          emit(GetTravelSuccessState());
          print('donebus');
        });
      } else {
        print('errorbus1');
        emit(GetTravelErrorState());
      }
    } catch (e) {
      print(e);
      print('errorbus');
      emit(GetTravelErrorState());
    }
  }

  Future<void> getRecommanded() async {
    emit(GetRecommandedLoadingState());
    try {
      http.Response res = await http.get(Uri.parse('$domainAddress/bus.json'));
      Map data = json.decode(res.body);
      if (res.statusCode == 200) {
        _recommenbus.clear();
        _recommenbus.clear();
        data.forEach((key, value) {
          if (value['recommanded'] == true) {
            _recommenbus.add(BusModel.fromJson(key, value));
          }
        });
        emit(GetRecommandedSucessState());
        print('bone recommanded');
      } else {
        print('error recommanded1');
        emit(GetRecommandedErrorState());
      }
    } catch (e) {
      print(e);
      print('error recommanded');
      emit(GetRecommandedErrorState());
    }
  }

  Future<void> getCheapest() async {
    emit(GetCheapestLoadingState());
    try {
      http.Response res = await http.get(Uri.parse('$domainAddress/bus.json'));
      Map data = json.decode(res.body);
      if (res.statusCode == 200) {
        _cheapestBus.clear();
        _cheapestBus.clear();
        data.forEach((key, value) {
          if (value['cheapest'] == true) {
            _cheapestBus.add(BusModel.fromJson(key, value));
          }
        });
        emit(GetCheapestSucessState());
        print('bone cheapest');
      } else {
        emit(GetCheapestErrorState());
        print('error cheapest1');
      }
    } catch (e) {
      print(e);
      print('error cheapest');
      emit(GetCheapestErrorState());
    }
  }

  Future<void> getFastest() async {
    emit(GetFastestLoadingState());
    try {
      http.Response res = await http.get(Uri.parse('$domainAddress/bus.json'));
      Map data = json.decode(res.body);
      if (res.statusCode == 200) {
        _fastestBus.clear();
        _fastestBus.clear();
        data.forEach((key, value) {
          if (value['fastest'] == true) {
            _fastestBus.add(BusModel.fromJson(key, value));
          }
        });
        emit(GetFastestSucessState());
        print('done fast');
      } else {
        emit(GetFastestErrorState());
        print('error fast1');
      }
    } catch (e) {
      print(e);
      print('error fast');
      emit(GetFastestErrorState());
    }
  }

  ///
  Future<void> searchOneSix() async {
    emit(GetSearchOneSixLoadingState());
    try {
      http.Response res = await http.get(Uri.parse('$domainAddress/bus.json'));
      Map data = json.decode(res.body);
      if (res.statusCode == 200) {
        _oneSix.clear();
        _oneSix.clear();
        data.forEach((key, value) {
          if (value['todayData'] == '1-6-2022') {
            _oneSix.add(BusModel.fromJson(key, value));
          }
        });
        emit(GetSearchOneSixSucessState());
        print('doneone');
        String Date2 = '1-6-2022';
      } else {
        print('heeeerrrrrrrrrrrr2');
        emit(GetSearchOneSixErrorState());
      }
    } catch (e) {
      print(e);
      emit(GetSearchOneSixErrorState());
    }
  }

  Future<void> searchTwoSix() async {
    emit(GetSearchTwoSixLoadingState());
    try {
      http.Response res = await http.get(Uri.parse('$domainAddress/bus.json'));
      Map data = json.decode(res.body);
      if (res.statusCode == 200) {
        _twoSix.clear();
        _twoSix.clear();
        data.forEach((key, value) {
          if (value['todayData'] == '2-6-2022') {
            _twoSix.add(BusModel.fromJson(key, value));
          }
        });
        emit(GetSearchTwoSixSucessState());
        print('donetwo');
         String Date2 = '2-6-2022';
      } else {
        emit(GetSearchTwoSixErrorState());
      }
    } catch (e) {
      emit(GetSearchTwoSixErrorState());
    }
  }

  Future<void> searchThreeSix() async {
    emit(GetSearchThreeSixLoadingState());
    try {
      http.Response res = await http.get(Uri.parse('$domainAddress/bus.json'));
      Map data = json.decode(res.body);
      if (res.statusCode == 200) {
        _threeSix.clear();
        _threeSix.clear();
        data.forEach((key, value) {
          if (value['todayData'] == '3-6-2022') {
            _threeSix.add(BusModel.fromJson(key, value));
          }
        });
        emit(GetSearchThreeSixSucessState());
        print('donethree');
         String Date2 = '3-6-2022';
      } else {
        emit(GetSearchThreeSixErrorState());
      }
    } catch (e) {
      emit(GetSearchThreeSixErrorState());
    }
  }
}
