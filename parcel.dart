import 'dart:core';

class Parcel {
  String ParcelName;
  DateTime date;

  Parcel(String pName) {
    this.ParcelName = pName;
    this.date = new DateTime.now();
  }
}
