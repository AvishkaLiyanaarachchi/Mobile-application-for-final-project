class trainDetail2 {

  int trainId;
  String trainName;
  String trainNumber;
  String destination;
  int tblTimeTableTimeTableId;
  String availabilitySeat;
  String classType;

  trainDetail2({
    this.trainId,
    this.trainName,
    this.trainNumber,
    this.destination,
    this.tblTimeTableTimeTableId,
    this.availabilitySeat,
    this.classType,
  });

  factory trainDetail2.fromJson(Map<String, dynamic> json) {
    return trainDetail2(
      trainId: json["trainId"],
      trainName: json["train_name"],
      trainNumber: json["train_number"],
      destination: json["destination"],
      tblTimeTableTimeTableId: json["tbl_timeTable_timeTableId"],
      availabilitySeat: json["availability_seat"],
      classType: json["class_type"],

    );
  }
}
