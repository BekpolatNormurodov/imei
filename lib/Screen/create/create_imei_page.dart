import 'package:imei/library.dart';

class CreateImeiPage extends StatefulWidget {
  const CreateImeiPage({Key? key}) : super(key: key);

  @override
  State<CreateImeiPage> createState() => _CreateImeiPageState();
}

class _CreateImeiPageState extends State<CreateImeiPage> {
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
        padding: EdgeInsets.only(left: 20, right: 20, top: 40),
        color: Color.fromRGBO(68, 68, 68, 1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: ()=>Get.back(), icon: Icon(Icons.arrow_back, color: Colors.white,)),
                  Text(
                    "TELEFON",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.grey.shade200,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Container(width: 30),
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
              SizedBox(height: 20.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    "Oxirgi ishlagan SIM:",
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
                    "Modeli:",
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
                    "Rangi:",
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
                    "Holat haqida ma'lumot:",
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
                      controller: shortInfoController,
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
                          Icons.info_outline,
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
                height: 50,
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
                    // Get.snackbar(
                    //   'Successful',
                    //   "Ma'lumotlari kiritildi !!!",
                    //   backgroundColor: Colors.green,
                    // );
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
