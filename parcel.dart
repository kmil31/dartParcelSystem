import 'dart:core';

class Parcel {
  String ParcelName;
  DateTime date;
  String get getParcelName => ParcelName;

  set setParcelName(String ParcelName) => this.ParcelName = ParcelName;

  Parcel(String pName, var date) {
    this.ParcelName = pName;
    this.date = date;
  }

  Parcel.fromFile(this.ParcelName, this.date);

  factory Parcel.fromJson(dynamic json) {
    return Parcel(json['ParcelName'] as String, DateTime.parse(json['date']));
  } // creates a Parcel Object from json string

  Map toJson() => {
        'ParcelName': ParcelName,
        'date': date.toString(),
      }; //formats an Object to json string
}
