import 'package:imei/library.dart';

class CreateImeiLost extends StatefulWidget {
  const CreateImeiLost({Key? key}) : super(key: key);

  @override
  State<CreateImeiLost> createState() => _CreateImeiLostState();
}

class _CreateImeiLostState extends State<CreateImeiLost> {
  TextEditingController? imeiController;
  TextEditingController? simController;
  TextEditingController? modelController;
  TextEditingController? colorController;
  TextEditingController? shortInfoController;
  TextEditingController? fullnameController;
  TextEditingController? numberController;
  TextEditingController? jshshirController;
  TextEditingController? shakl1Controller;

  int page = 1;

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
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height,
          padding: EdgeInsets.only(left: 20, right: 20, top: 40),
          color: Color.fromRGBO(68, 68, 68, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.grey.shade200,
                        ),
                      ),
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
                    ],
                  ),
                  SizedBox(height: page == 2 ? 10.h : 0),
                  page == 2
                      ? Text(
                          "* Qurilma egasining ma'lumotlari.",
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.teal.shade300,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.start,
                        )
                      : Container(),
                  SizedBox(height: 14.h),
                  page == 1 ? imei() : owner()
                ],
              ),
              page == 1
                  ? Container(
                      width: Get.width - 40,
                      margin: EdgeInsets.only(bottom: 30),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                alignment: Alignment.center,
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                    color: Colors.grey.shade100,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              SizedBox(width: 14),
                              Container(
                                width: 26,
                                height: 26,
                                alignment: Alignment.center,
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                    color: Colors.teal.shade900,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.2),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: Get.width / 2 - 32,
                                height: 48,
                                child: ElevatedButton.icon(
                                  onPressed: () async {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.white.withOpacity(.1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  label: Text(
                                    "OLDINGI",
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: Get.width / 2 - 32,
                                height: 48,
                                child: ElevatedButton.icon(
                                  onPressed: () async {
                                    page = 2;
                                    setState(() {});
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  label: Text(
                                    "KEYINGI",
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
                        ],
                      ),
                    )
                  : Container(
                      width: Get.width - 40,
                      margin: EdgeInsets.only(bottom: 30),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 26,
                                height: 26,
                                alignment: Alignment.center,
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                    color: Colors.teal.shade900,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.2),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              SizedBox(width: 14),
                              Container(
                                width: 30,
                                height: 30,
                                alignment: Alignment.center,
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                    color: Colors.grey.shade200,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: Get.width / 2 - 32,
                                height: 48,
                                child: ElevatedButton.icon(
                                  onPressed: () async {
                                    page = 1;
                                    setState(() {});
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey.shade200,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(
                                            color: Colors.teal, width: 3)),
                                  ),
                                  label: Text(
                                    "OLDINGI",
                                    style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: Get.width / 2 - 32,
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
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  imei() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "IMEI:",
          style: TextStyle(color: Colors.grey.shade200),
        ),
        Container(
          height: 48,
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
            style: TextStyle(fontSize: 14, color: Colors.grey.shade200),
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
                top: 12,
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
        SizedBox(height: 12),
        Text(
          "Oxirgi ishlagan SIM:",
          style: TextStyle(color: Colors.grey.shade200),
        ),
        Container(
          height: 48,
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
            controller: simController,
            cursorColor: Colors.grey.shade200,
            cursorWidth: 1,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade200),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 4,
                right: 10,
                top: 12,
              ),
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.sim_card_sharp,
                size: 24,
                color: Colors.grey.shade200,
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        Text(
          "Modeli:",
          style: TextStyle(color: Colors.grey.shade200),
        ),
        Container(
          height: 48,
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
            style: TextStyle(fontSize: 14, color: Colors.grey.shade200),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 12,
                right: 10,
                top: 12,
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
        SizedBox(height: 12),
        Text(
          "Rangi:",
          style: TextStyle(color: Colors.grey.shade200),
        ),
        Container(
          height: 48,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(6.r)),
          child: TextFormField(
            controller: colorController,
            cursorColor: Colors.grey.shade200,
            cursorWidth: 1,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade200),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 12,
                right: 10,
                top: 12,
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
        SizedBox(height: 12),
        Text(
          "Holat haqida ma'lumot:",
          style: TextStyle(color: Colors.grey.shade200),
        ),
        Container(
          height: 48,
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
            style: TextStyle(fontSize: 14, color: Colors.grey.shade200),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 12,
                right: 10,
                top: 12,
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
    );
  }

  owner() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "F.I.SH:",
          style: TextStyle(color: Colors.grey.shade200, fontSize: 13),
        ),
        Container(
          height: 48,
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
            style: TextStyle(fontSize: 14, color: Colors.grey.shade200),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 12,
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
          "Tel:",
          style: TextStyle(color: Colors.grey.shade200),
        ),
        Container(
          height: 48,
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
                top: 12,
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
          "JSHSHIR:",
          style: TextStyle(color: Colors.grey.shade200, fontSize: 13),
        ),
        Container(
          height: 48,
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
                top: 12,
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
          "Shakl1 №:",
          style: TextStyle(color: Colors.grey.shade200),
        ),
        Container(
          height: 48,
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
                top: 12,
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