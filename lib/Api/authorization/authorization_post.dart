import 'package:imei/library.dart';
import 'package:http/http.dart' as http;

class AuthorizationPost {
  Future authorizationPost({
    required String phone,
    required String jton,
  }) async {
    var request = await http.MultipartRequest(
      'post',
      Uri.parse('http://imei.yacdem.uz/api/v1/token/'),
    );

    request.fields.addAll({
      'username': phone,
      'password': jton,
    });

    http.StreamedResponse response = await request.send();
    if (response.statusCode >= 200 || response.statusCode < 300) {
      var data = await response.stream.bytesToString();
      await Hive.box('token').put(
        'token',
        jsonDecode(data)["access"]
      );
      // print(Hive.box("token").get("token"));
      return jsonDecode(data);
    }
  }
}