import 'timeTable.dart';
import 'package:http/http.dart' as http;
//import 'dart:developer' as developer;

Future<List<Timetable>> fetchTimetable() async{

  String url = "http://10.0.2.2:80/RailwayAPI/railwayAPI.php/timeTableDetails";
  final response = await http.get(url);
  //developer.log(response.body);
  return timetableFromMap(response.body);

}