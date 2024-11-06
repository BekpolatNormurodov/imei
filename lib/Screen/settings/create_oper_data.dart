import 'package:imei/library.dart';

class CreateOperData extends StatefulWidget {
  const CreateOperData({Key? key}) : super(key: key);

  @override
  State<CreateOperData> createState() => _CreateOperDataState();
}

class _CreateOperDataState extends State<CreateOperData> {
  TextEditingController? imeiController;
  TextEditingController? simController;
  TextEditingController? modelController;
  TextEditingController? colorController;
  TextEditingController? shortInfoController;
  TextEditingController? fullnameController;
  TextEditingController? numberController;
  TextEditingController? jshshirController;
  TextEditingController? shakl1Controller;

  @override
  void initState() {
    imeiController = TextEditingController();
    simController = TextEditingController();
    modelController = TextEditingController();
    colorController = TextEditingController();
    shortInfoController = TextEditingController();
    fullnameController = TextEditingController();
    numberController = TextEditingController();
    jshshirController = TextEditingController();
    shakl1Controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Color.fromRGBO(68, 68, 68, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(68, 68, 68, 1),
        title: Text(
          "Ro'yxatdan o'tish",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Colors.grey.shade200,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            owner(),
            Container(
              width: Get.width,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () async {
                  Get.off(ListImImeiLost());
                  // Get.snackbar(
                  //   'Successful',
                  //   "Ma'lumotlari kiritildi !!!",
                  //   backgroundColor: Colors.green.shade800,
                  //   maxWidth: double.infinity,
                  //   margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0)
                  // );
        
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Ma'lumotlar saqlandi.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade200,
                        ),
                      ),
                      showCloseIcon: true,
                      closeIconColor: Colors.teal.shade800,
                      backgroundColor: Colors.teal.shade300,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                label: Text(
                  "SAQLASH",
                  style: TextStyle(
                    color: Colors.grey.shade200,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  owner() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ":",
          style: TextStyle(color: Colors.grey.shade200, fontSize: 13),
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
            controller: fullnameController,
            cursorColor: Colors.grey.shade200,
            cursorWidth: 1,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            style: TextStyle(fontSize: 15, color: Colors.grey.shade200),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
              ),
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.person,
                size: 24,
                color: Colors.grey.shade200,
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          ":",
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
            inputFormatters: [
              TextInputMask(
                mask: '\\ (99) 999-99-99',
                placeholder: '_ ',
                maxPlaceHolders: 9,
              )
            ],
            controller: numberController,
            cursorColor: Colors.grey.shade200,
            cursorWidth: 1,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade200),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 4,
                right: 10,
                top: 10,
              ),
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.phone,
                size: 24,
                color: Colors.grey.shade200,
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          ":",
          style: TextStyle(color: Colors.grey.shade200, fontSize: 13),
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
            inputFormatters: [
              TextInputMask(
                mask: '\\ 99999999999999',
                placeholder: '_ ',
                maxPlaceHolders: 14,
              )
            ],
            controller: jshshirController,
            cursorColor: Colors.grey.shade200,
            cursorWidth: 1,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade200),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 4,
                right: 10,
                top: 10,
              ),
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.document_scanner,
                size: 22,
                color: Colors.grey.shade200,
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          ":",
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
            controller: shakl1Controller,
            cursorColor: Colors.grey.shade200,
            cursorWidth: 1,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade200,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 12,
                right: 10,
                top: 10,
              ),
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.discount,
                size: 22,
                color: Colors.grey.shade200,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
