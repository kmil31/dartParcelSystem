import 'dart:core';

class Parcel {
  String ParcelName;
  DateTime date;
 String get getParcelName => ParcelName;

 set setParcelName(String ParcelName) => this.ParcelName = ParcelName;

  Parcel(String pName) {
    this.ParcelName = pName;
    this.date = new DateTime.now();
  }

  Parcel.fromFile(this.ParcelName, this.date);

  factory Parcel.fromJson(dynamic json) {
    return Parcel(json['ParcelName'] as String);
  }     // creates a Parcel Object from json string

  Map toJson() => {
        'ParcelName': ParcelName,
        'date': date.toString(),
      };   //formats an Object to json string
}
