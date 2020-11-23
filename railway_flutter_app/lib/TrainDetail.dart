// To parse this JSON data, do
//
//     final traindetail = traindetailFromMap(jsonString);

import 'dart:convert';

List<Traindetail> traindetailFromMap(String str) => List<Traindetail>.from(json.decode(str).map((x) => Traindetail.fromMap(x)));

String traindetailToMap(List<Traindetail> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Traindetail {
  Traindetail({
    this.trainId,
    this.trainName,
    this.trainNumber,
    this.destination,
    this.tblTimeTableTimeTableId,
    this.availabilitySeat,
    this.classType,
  });

  int trainId;
  String trainName;
  String trainNumber;
  String destination;
  int tblTimeTableTimeTableId;
  String availabilitySeat;
  String classType;

  factory Traindetail.fromMap(Map<String, dynamic> json) => Traindetail(
    trainId:  json["trainId"] is String ?int.parse(json["trainId"]):json["trainId"],
    trainName: json["train_name"],
    trainNumber: json["train_number"],
    destination: json["destination"],
    tblTimeTableTimeTableId: json["tbl_timeTable_timeTableId"] is String ?int.parse(json["tbl_timeTable_timeTableId"]):json["tbl_timeTable_timeTableId"],
    availabilitySeat: json["availability_seat"],
    classType: json["class_type"],
  );

  Map<String, dynamic> toMap() => {
    "trainId": trainId,
    "train_name": trainName,
    "train_number": trainNumber,
    "destination": destination,
    "tbl_timeTable_timeTableId": tblTimeTableTimeTableId,
    "availability_seat": availabilitySeat,
    "class_type": classTypeValues.reverse[classType],
  };
}

enum ClassType { B, A, C }

final classTypeValues = EnumValues({
  "A": ClassType.A,
  "B": ClassType.B,
  "C": ClassType.C
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
