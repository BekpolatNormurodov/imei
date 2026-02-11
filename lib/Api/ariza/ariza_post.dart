import 'dart:io';

import 'package:imei/library.dart';
import 'package:http/http.dart' as http;

class AccountPost {
  Future accountPost({
    required String imei,
    required String last_simcard,
    required String model,
    required String color,
    required String jshir,
    required String phone_number,
    required String fish,
  }) async {
    var request = await http.MultipartRequest(
      'post',
      Uri.parse('http://bekpolatnormurodov.uz/imeiApi/api/v1/ariza/'),
    );

    request.fields.addAll({
      'imei': imei,
      'last_simcard': last_simcard,
      'model': model,
      'color': color,
      'jshir': jshir,
      'phone_number': phone_number,
      'fish': fish,
    });

    String token = Hive.box('token').get('token');
    request.headers.addAll({
       HttpHeaders.authorizationHeader: 'Bearer $token'
    });

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 201) {
      var data = await response.stream.bytesToString();
      return jsonDecode(data);
    }
  }
}
