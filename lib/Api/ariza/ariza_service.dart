// import 'package:imei/library.dart';
// import 'package:http/http.dart' as http;
// import 'dart:io';

// class ArizaService {
//   Future<ArizaModel?> arizaService() async {
//     try {
//       String token = Hive.box('token').get('token');
//       var _response = await http.get(
//         Uri.parse('http://imei.yacdem.uz/api/v1/ariza/'),
//         headers: {
//           HttpHeaders.authorizationHeader: 'Bearer $token',
//         },
//       );
//         print(_response.statusCode);
//       if (_response.statusCode == 200) {
//         var json = jsonDecode(_response.body);
//        var data = ArizaModel.fromJson(json);
//         return data;
//       } else {
//         return jsonDecode(_response.body);
//       }
//     } catch (e) {}
//     return null;
//   }
// }