import "dart:convert";

import "package:http/http.dart";
import 'package:intl/intl.dart';

 class WorldTime {
     String? location;
late String time;
     String? flag;
     String? url;
late bool isDayTime=false;
     int? index;
     late String locatonIndex;
     


  WorldTime({this.location,this.flag,this.url,this.index});

  void setUrl()
  {
    switch (location?.toLowerCase()) {
      case 'london':
        locatonIndex = 'https://mocki.io/v1/648e132c-7a4e-4ca8-baba-98d3c7570c90';
        break;

      case 'athens':
        locatonIndex = 'https://mocki.io/v1/27b98d62-eb2a-4aba-bbe6-67702d3250a5';
        break;

      case 'cairo':
        locatonIndex = 'https://mocki.io/v1/b29cd987-620c-4f15-a3ec-fb69172382d2';
        break;

      case 'nairobi':
        locatonIndex = 'https://mocki.io/v1/b29cd987-620c-4f15-a3ec-fb69172382d2';
        break;

      case 'chicago':
        locatonIndex= 'https://mocki.io/v1/907be57b-4d48-411d-9845-7cb6d9c67a72';
        break;
      case 'new york':
        locatonIndex='https://mocki.io/v1/907be57b-4d48-411d-9845-7cb6d9c67a72';
        break;

      case 'seoul':
        locatonIndex="https://mocki.io/v1/907be57b-4d48-411d-9845-7cb6d9c67a72";
        break;

      case 'jakarta':
        locatonIndex='https://mocki.io/v1/907be57b-4d48-411d-9845-7cb6d9c67a72';
        break;

     default:
         url = 'https://mocki.io/v1/648e132c-7a4e-4ca8-baba-98d3c7570c90';
        break;
    };
  }
    
  

  Future<void> getTime() async {
    print(location);
    try {
      
      setUrl();
   
   Response response= await get(Uri.parse("$locatonIndex"));
    
    
    Map data=jsonDecode(response.body);
    

    String datetime=data['datetime'];
    String offset=data['utc_offset'].substring(1,3);

    DateTime now=DateTime.parse(datetime);
    now=now.add(Duration(hours: int.parse(offset)));
    isDayTime = now.hour > 6 && now.hour < 20? true : false;
    time=DateFormat.jm().format(now);
    
    
  }
    catch(e) {
      print('catch an error: $e');
      time="opps something wrong happened";
    }
   


  }

}