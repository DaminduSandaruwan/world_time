
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location; //Location name for the UI
  String time; // time in that location
  String flag; //url to asset flag icon
  String url;  //location url for api endpoint
  bool isDaytime; // true or false if daytime or not

  WorldTime({this.location,this.flag,this.url});


  Future<void> getTime() async{

    try{
      //make request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //print(datetime);
      //print(offset);

      //create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //print(now);

      //set time property
      isDaytime= now.hour>6 && now.hour<20 ? true : false;
      time=DateFormat.jm().format(now);
    }
    catch(e){
      print('Caught Error : $e');
      time = 'Could not get time data';
    }




  }

}

