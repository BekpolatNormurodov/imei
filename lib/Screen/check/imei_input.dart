import 'package:imei/library.dart';

class ImeiInput extends StatefulWidget {
  const ImeiInput({super.key});

  @override
  State<ImeiInput> createState() => _ImeiInputState();
}

class _ImeiInputState extends State<ImeiInput> {
  TextEditingController? imeiController;

  @override
  void initState() {
    imeiController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(68, 68, 68, 1),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "IMEI:",
              style: TextStyle(color: Colors.grey.shade200),
            ),
            Container(
              height: 46,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: TextFormField(
                controller: imeiController,
                cursorColor: Colors.grey.shade200,
                cursorWidth: 1,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade200),
                inputFormatters: [
                  TextInputMask(
                    mask: '\\ 999999999999999',
                    placeholder: '_ ',
                    maxPlaceHolders: 15,
                  )
                ],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 8,
                  ),
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.qr_code_scanner_outlined,
                    size: 26,
                    color: Colors.grey.shade200,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
