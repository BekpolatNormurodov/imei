import 'package:imei/library.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String violat = '?';
  String tuman = '?';
  String unvon = '?';

  TextEditingController? fullnameController;
  TextEditingController? telController;
  TextEditingController? unvonController;

  @override
  void initState() {
    unvonController = TextEditingController(text: "MAYOR");
    fullnameController = TextEditingController(text: "Normurodov Bekpolat Ergash o'g'li");
    telController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Color.fromRGBO(68, 68, 68, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(68, 68, 68, 1),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          "Account".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.grey.shade300,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          height: Get.height - 84,
          padding: EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              oper(),
              Container(
                width: Get.width,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    Get.off(SelectionPage());
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Ma'lumotlar saqlandi.",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade300,
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
                      color: Colors.grey.shade300,
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
      ),
    );
  }

  oper() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "F.I.SH:",
          style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        ),
        SizedBox(height: 2),
        Container(
          height: 46,
          child: TextFormField(
            controller: fullnameController,
            cursorColor: Colors.grey.shade300,
            cursorWidth: 1,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            style: TextStyle(fontSize: 15, color: Colors.grey.shade300),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                right: 12,
                top: 8,
              ),
              prefixIcon: Container(
                width: 50,
                margin: EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.1),
                  border: Border(right: BorderSide(color: Colors.grey)),
                ),
                child: Icon(
                  Icons.person,
                  size: 24,
                  color: Colors.grey.shade300,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
        SizedBox(height: 18),
        Text(
          "Tel:",
          style: TextStyle(color: Colors.grey.shade400, fontSize: 15),
        ),
        SizedBox(height: 2),
        Container(
          height: 46,
          child: TextFormField(
            inputFormatters: [
              TextInputMask(
                mask: '\\ (99) 999-99-99',
                placeholder: '_ ',
                maxPlaceHolders: 9,
              )
            ],
            controller: telController,
            cursorColor: Colors.grey.shade300,
            cursorWidth: 1,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            style: TextStyle(fontSize: 15, color: Colors.grey.shade300),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                right: 8,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
              prefixIcon: Container(
                width: 50,
                margin: EdgeInsets.only(right: 6),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.1),
                  border: Border(right: BorderSide(color: Colors.grey)),
                ),
                child: Icon(
                  Icons.phone,
                  size: 24,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 18),
        Text(
          "Ish joyi:",
          style: TextStyle(color: Colors.grey.shade400),
        ),
        SizedBox(height: 2),
        Container(
          width: Get.width,
          height: 46,
          child: DropdownButtonFormField(
            focusColor: Colors.transparent,
            hint: Text(
              "Tanlang.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            iconEnabledColor: Colors.grey.shade400,
            dropdownColor: Color.fromRGBO(80, 80, 80, 1),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 16, right: 16),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            items: [
              viloyatIIB("IIV"),
              viloyatIIB("Toshkent shahar"),
              viloyatIIB("Toshkent viloyati"),
              viloyatIIB("Sirdaryo viloyati"),
              viloyatIIB("Jizzax viloyati"),
              viloyatIIB("Samarqand viloyati"),
              viloyatIIB("Farg'ona viloyati"),
              viloyatIIB("Namangan viloyati"),
              viloyatIIB("Andijon viloyati"),
              viloyatIIB("Qashqadaryo  viloyati"),
              viloyatIIB("Surxandaryo viloyati"),
              viloyatIIB("Buxoro viloyati"),
              viloyatIIB("Navoiy viloyati"),
              viloyatIIB("Xorazm viloyati"),
              viloyatIIB("Qoraqalpog'iston Res."),
            ],
            onChanged: (e) {
              violat = e!;
              setState(() {});
            },
          ),
        ),
        SizedBox(height: 18),
        Text(
          "Boshqarma",
          style: TextStyle(color: Colors.grey.shade400),
        ),
        SizedBox(height: 2),
        Container(
          width: Get.width,
          height: 46,
          child: DropdownButtonFormField(
            focusColor: Colors.transparent,
            hint: Text(
              "Tanlang.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            iconEnabledColor: Colors.grey.shade400,
            dropdownColor: Color.fromRGBO(80, 80, 80, 1),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 16, right: 16),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            items: [
              tumanIIB("Navoiy viloyati IIB"),
              tumanIIB("Navoiy shahar IIB"),
              tumanIIB("Karmana tumani IIB"),
              tumanIIB("Navbahor tumani IIB"),
              tumanIIB("Konimex tumani IIB"),
              tumanIIB("Qiziltepa tumani IIB"),
              tumanIIB("Xatirchi tumani IIB"),
              tumanIIB("Zarafshon shahar IIB"),
              tumanIIB("Uchquduq tumani IIB"),
              tumanIIB("Nurota tumani IIB"),
              tumanIIB("Tomdi tumani IIB"),
              tumanIIB("G'azg'on tumani IIB"),
            ],
            onChanged: (e) {
              tuman = e!;
              setState(() {});
            },
          ),
        ),
        SizedBox(height: 18),
        Text(
          "Lavozim:",
          style: TextStyle(color: Colors.grey.shade400),
        ),
        SizedBox(height: 2),
        Container(
          height: 46,
          child: TextFormField(
            controller: unvonController,
            cursorColor: Colors.grey.shade300,
            cursorWidth: 1,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade300,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 12,
                right: 8,
                top: 8,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
              prefixIcon: Container(
                width: 50,
                margin: EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.1),
                  border: Border(right: BorderSide(color: Colors.grey)),
                ),
                child: Icon(
                  Icons.workspace_premium_outlined,
                  size: 24,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          "Unvon:",
          style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        ),
        SizedBox(height: 2),
        Container(
          width: Get.width,
          height: 46,
          child: DropdownButtonFormField(
            focusColor: Colors.transparent,
            hint: Text(
              "Tanlang.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            iconEnabledColor: Colors.grey.shade400,
            dropdownColor: Color.fromRGBO(80, 80, 80, 1),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 16, right: 16),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            items: [
              unvonIIB("Safdor"),
              unvonIIB("Kichik serjant"),
              unvonIIB("Serjant"),
              unvonIIB("Katta serjant"),
              unvonIIB("Leytenant"),
              unvonIIB("Katta leytenant"),
              unvonIIB("Kapitan"),
              unvonIIB("Mayor"),
              unvonIIB("Podpolkovnik"),
              unvonIIB("Polkovnik"),
            ],
            onChanged: (e) {
              violat = e!;
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  DropdownMenuItem viloyatIIB(viloyat) => DropdownMenuItem(
        child: Text(
          viloyat.toUpperCase(),
          style: TextStyle(fontSize: 12.8, color: Colors.grey.shade300),
        ),
        value: viloyat,
        onTap: () {},
      );
  DropdownMenuItem tumanIIB(tuman) => DropdownMenuItem(
        child: Text(
          tuman.toUpperCase(),
          style: TextStyle(fontSize: 12.8, color: Colors.grey.shade300),
        ),
        value: tuman,
        onTap: () {},
      );

  DropdownMenuItem unvonIIB(unvon) => DropdownMenuItem(
        child: Text(
          unvon.toUpperCase(),
          style: TextStyle(fontSize: 12.8, color: Colors.grey.shade300),
        ),
        value: unvon,
        onTap: () {},
      );
}
