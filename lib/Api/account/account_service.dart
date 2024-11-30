import 'package:imei/library.dart';
import 'package:http/http.dart' as http;

class AccountService {
  Future<List<AccountModel>?> accountService() async {
    try {
      var _response = await http
          .get(Uri.parse('https://imei-102.uz/imei102/registration/'));
      if (_response.statusCode == 200) {
        List json = jsonDecode(_response.body);
        List<AccountModel> data =
            json.map((e) => AccountModel.fromJson(e)).toList();
        return data;
      } else {
        return jsonDecode(_response.body);
      }
    } catch (e) {}
    return null;
  }
}
