import 'package:imei/library.dart';

class CreateOwnerPage extends StatefulWidget {
  const CreateOwnerPage({Key? key}) : super(key: key);

  @override
  State<CreateOwnerPage> createState() => _CreateOwnerPageState();
}

class _CreateOwnerPageState extends State<CreateOwnerPage> {
  TextEditingController? imeiController;
  TextEditingController? numberController;
  TextEditingController? modelController;
  TextEditingController? colorController;
  TextEditingController? shortInfoController;

  @override
  void initState() {
    imeiController = TextEditingController();
    numberController = TextEditingController();
    modelController = TextEditingController();
    colorController = TextEditingController();
    shortInfoController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.only(left: 20, right: 20, top: 60),
        color: Color.fromRGBO(68, 68, 68, 1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // IconButton(
                  //     onPressed: () => Get.back(),
                  //     icon: Icon(
                  //       Icons.arrow_back,
                  //       color: Colors.white,
                  //     )),
                  Expanded(
                    child: Container(
                      child: Text(
                        "Qurilma egasining ma'lumotlari",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey.shade200,
                          letterSpacing: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  // Container(),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(
                  //     size: 28,
                  //     isDark
                  //         ? LineAwesomeIcons.sun
                  //         : LineAwesomeIcons.star_and_crescent_solid,
                  //   ),
                  // )
                ],
              ),
              SizedBox(height: 34),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ism:",
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
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade200),
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
                  SizedBox(height: 16),
                  Text(
                    "Familiya:",
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
                      controller: modelController,
                      cursorColor: Colors.grey.shade200,
                      cursorWidth: 1,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade200),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 8,
                        ),
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.smartphone,
                          size: 24,
                          color: Colors.grey.shade200,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Otasining ismi:",
                    style: TextStyle(color: Colors.grey.shade200),
                  ),
                  Container(
                    height: 46,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(6.r)),
                    child: TextFormField(
                      controller: colorController,
                      cursorColor: Colors.grey.shade200,
                      cursorWidth: 1,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade200),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 8,
                        ),
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.color_lens_outlined,
                          size: 24,
                          color: Colors.grey.shade200,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Tel:",
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
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade200),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 4,
                          right: 10,
                          top: 8,
                        ),
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          LineAwesomeIcons.phone_alt_solid,
                          size: 24,
                          color: Colors.grey.shade200,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "JSHSHIR:",
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
                          mask: '\\ 99999999999999',
                          placeholder: '_ ',
                          maxPlaceHolders: 14,
                        )
                      ],
                      controller: numberController,
                      cursorColor: Colors.grey.shade200,
                      cursorWidth: 1,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade200),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 4,
                          right: 10,
                          top: 8,
                        ),
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          LineAwesomeIcons.phone_alt_solid,
                          size: 24,
                          color: Colors.grey.shade200,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 160),
              Container(
                width: Get.width,
                height: 48,
                margin: EdgeInsets.only(bottom: 20),
                child: ElevatedButton.icon(
                  onPressed: () async {
                    Get.to(CreateOwnerPage());
                    // await Hive.box('data').put('name', nameController!.text);
                    // await Hive.box('data')
                    //     .put('surname', surnameController!.text);
                    // await Hive.box('data')
                    //     .put('fatherName', fathernameController!.text);
                    // await Hive.box('data')
                    //     .put('office', officeController!.text);
                    // await Hive.box('data').put('unvon', unvonController!.text);
                    // Get.to(NavigatorBar());
                    Get.snackbar(
                      'Successful',
                      "Ma'lumotlari kiritildi !!!",
                      backgroundColor: Colors.green,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  label: Text(
                    "KIRITISH",
                    style: TextStyle(
                      color: Colors.grey.shade200,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
