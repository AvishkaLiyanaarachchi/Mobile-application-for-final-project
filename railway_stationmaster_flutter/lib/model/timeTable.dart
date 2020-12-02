// To parse this JSON data, do
//
//     final timetable = timetableFromMap(jsonString);

import 'dart:convert';

List<Timetable> timetableFromMap(String str) => List<Timetable>.from(json.decode(str).map((x) => Timetable.fromMap(x)));

String timetableToMap(List<Timetable> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Timetable {
  Timetable({
    this.timeTableId,
    this.destination,
    this.trainType,
    this.arrivalTime,
    this.depatureTime,
  });

  int timeTableId;
  String destination;
  String trainType;
  String arrivalTime;
  String depatureTime;

  factory Timetable.fromMap(Map<String, dynamic> json) => Timetable(
    timeTableId: json["timeTableId"] is String ? int.parse(json["timeTableId"] ):json["timeTableId"],
    destination: json["destination"],
    trainType: json["train_type"],
    arrivalTime: json["arrival_time"],
    depatureTime: json["depature_time"],
  );

  Map<String, dynamic> toMap() => {
    "timeTableId": timeTableId,
    "destination": destination,
    "train_type": trainTypeValues.reverse[trainType],
    "arrival_time": arrivalTime,
    "depature_time": depatureTime,
  };
}

enum TrainType { EXPRESS, NORMAL, TRAIN_TYPE_NORMAL }

final trainTypeValues = EnumValues({
  "Express": TrainType.EXPRESS,
  "normal": TrainType.NORMAL,
  "Normal": TrainType.TRAIN_TYPE_NORMAL
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
