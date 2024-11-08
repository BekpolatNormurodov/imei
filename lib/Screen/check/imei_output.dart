import 'package:flutter/material.dart';

class ImeiOutput extends StatefulWidget {
  ImeiOutput({super.key});

  @override
  State<ImeiOutput> createState() => _ImeiOutputState();
}

class _ImeiOutputState extends State<ImeiOutput> {
  List<String> deviceRequest = [
    "IMEI",
    "Oxirgi ishlagan SIM",
    "Modeli",
    "Rangi",
    "Holat haqida ma'lumot",
  ];
  List<String> deviceResponse = [
    "111111111111111",
    "(99) 847-19-95",
    "Iphone 15 Pro-Max",
    "Qizil",
    "Tushurib qoldirilgan",
  ];
  List<String> ownerRequest = [
    "F.I.SH",
    "Tel",
    "JSHSHIR",
    "Shakl1 №",
  ];
  List<String> ownerResponse = [
    "NORMURODOV BEKPOLAT ERGASH O'GLI",
    "(94) 679-22-20",
    "22222222222222",
    "1234",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(68, 68, 68, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(68, 68, 68, 1),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey.shade300,
            )),
        title: Text(
          "Qurilma Ma'lumotlari".toUpperCase(),
          style: TextStyle(
            color: Colors.grey.shade200,
            fontSize: 16,
            wordSpacing: 2,
            letterSpacing: .5,
            fontWeight: FontWeight.w600,
            shadows: [
              BoxShadow(
                offset: Offset(1, 1),
                color: Colors.black,
                blurRadius: 8,
              )
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: deviceRequest.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      children: [
                        Text(
                          (index + 1).toString(),
                          style: TextStyle(color: Colors.grey.shade300),
                        ),
                        Text(
                          deviceRequest[index],
                          style: TextStyle(color: Colors.grey.shade300),
                        ),
                        Text(
                          "-",
                          style: TextStyle(color: Colors.grey.shade300),
                        ),
                        Text(
                          deviceResponse[index],
                          style: TextStyle(color: Colors.grey.shade300),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Text(
              "* Qurilma egasining ma'lumotlari.",
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.teal.shade300,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: ownerRequest.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      children: [
                        Text(
                          (index + 1).toString(),
                          style: TextStyle(color: Colors.grey.shade300),
                        ),
                        Text(
                          ownerRequest[index],
                          style: TextStyle(color: Colors.grey.shade300),
                        ),
                        Text(
                          "-",
                          style: TextStyle(color: Colors.grey.shade300),
                        ),
                        Text(
                          ownerResponse[index],
                          style: TextStyle(color: Colors.grey.shade300),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
