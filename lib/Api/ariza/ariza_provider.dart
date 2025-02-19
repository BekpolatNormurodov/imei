// import 'package:imei/library.dart';

// enum ArizaState { intial, waiting, success, error }

// class ArizaProvider extends ChangeNotifier {
//   ArizaState state = ArizaState.intial;
//   set(ArizaState value) {
//     state = value;
//     notifyListeners();
//   }

//   ArizaModel? data;

//   Future getData() async {
//     set(ArizaState.waiting);
//     try {
//       data = (await ArizaService().arizaService())!;
//       set(ArizaState.success);
//     } catch (e) {
//       set(ArizaState.error);
//     }
//   }
// }
