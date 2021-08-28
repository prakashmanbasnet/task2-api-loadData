import 'package:http/http.dart' as http;
import 'package:myapp/model/userModel.dart';

class Services {
  static var client = http.Client();

  static Future<Data?> fetchData() async {
    var response =
        await client.get(Uri.parse('https://reqres.in/api/users?page=1'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      final Data data = dataFromJson(jsonString);
      return data;
    } else {
      return null;
    }
  }
}
