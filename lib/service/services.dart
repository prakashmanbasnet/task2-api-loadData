import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/main.dart';
import 'package:myapp/model/userModel.dart';

class Services {
  static var client = http.Client();

  static Future<Data?> fetchData() async {
  
       final post = Hive.box(LOAD_DATA).get('profile', defaultValue: {});
    
     final Data data1 = dataFromJson(post);
      if (data1 != null) return data1;

      var response =
          await client.get(Uri.parse('https://reqres.in/api/users?page=1'));

      if (response.statusCode == 200) {
        var jsonString = response.body;
    
        final Data data = dataFromJson(jsonString);
     
         Hive.box(LOAD_DATA).put('profile', jsonString);
        return data;
      } else {
        return null;
      }
    
  }
}
