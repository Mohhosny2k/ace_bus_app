import 'package:flutter/material.dart';

class BusModel {
  bool average;
  bool cheapest;
  num clockTransferHour;
  num endClock;
  bool fastest;
  num firstClock;
  String fromDistance;//
  String fromLocation;//
  String nameCompany;//
  int numberPerson;
  int price;
  bool recommanded;
  String toDistance;//
  dynamic toLocation;//
 String  todayData;//
  String  id;//
  String  textOne;//

  BusModel({
    required this.average,
    required this.cheapest,
    required this.clockTransferHour,
    required this.endClock,
    required this.fastest,
    required this.firstClock,
    required this.fromDistance,
    required this.fromLocation,
    required this.nameCompany,
    required this.numberPerson,
    required this.price,
    required this.recommanded,
    required this.toDistance,
    required this.toLocation,
    required this.todayData,
    required this.id,
    required this.textOne,
  });

  factory BusModel.fromJson(String id, Map data) {
    return BusModel(
        average: data['average'],
        cheapest: data['cheapest'],
        clockTransferHour: data['clockTransferHour'],
        endClock: data['endClock'],
        fastest: data['fastest'],
        firstClock: data['firstClock'],
        fromDistance: data['fromDistance'],
        fromLocation: data['fromLocation'],
        nameCompany: data['nameCompany'],
        numberPerson: data['numberPerson'],
        price: data['price'],
        recommanded: data['recommanded'],
        toDistance: data['toDistance'],
        toLocation: data[' toLocation'],
        todayData: data['todayData'],
        textOne: data['textOne'],
        id: id);
  }
}


//    "average": false,
//         "cheapest": true,
//         "clockTransferHour": 4,
//         "endClock": 5,
//         "fastest": false,
//         "firstClock": 1,
//         "fromDistance": "Prophet's Mosque",
//         "fromLocation": "Madina",
//         "nameCompany": "FlixBus",
//         "numberPerson": 1,
//         "price": 125,
//         "recommanded": true,
//         "toDistance": "Jamarat Bridge",
//         "toLocation": "Makkah",
//         "todayData": "1-6-2022"
//     },