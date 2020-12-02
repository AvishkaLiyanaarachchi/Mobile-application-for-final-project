import 'package:railwaystationmasterflutter/model/trains.dart';
import 'package:http/http.dart' as http;

//Inside the class parse JSON from server using API url
Future<List<Traindetail>> fetchTrainDetails()async{

  String url = "http://10.0.2.2:80/RailwayAPI/railwayAPI.php/trainDetails";
  final response = await http.get(url);
  return traindetailFromMap(response.body);
}