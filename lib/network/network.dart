import 'dart:convert';
import '../model/model.dart';
import 'package:http/http.dart';


class Network {
  Future<Apartment> getApartment() async {
    var finalUrl = "https://sigmatenant.ml/mobile/json";
    final response = await get(Uri.encodeFull(finalUrl)) ;
    if(response.statusCode ==200){
      return Apartment.fromJson(json.decode(response.body));
    }else
      print("Json not Found");
  }
}