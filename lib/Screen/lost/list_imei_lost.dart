import 'package:imei/library.dart';

class ListImImeiLost extends StatefulWidget {
  ListImImeiLost({super.key});

  @override
  State<ListImImeiLost> createState() => _ListImImeiLostState();
}

class _ListImImeiLostState extends State<ListImImeiLost> {
  final options = LiveOptions(
    delay: Duration(milliseconds: 30),
    showItemInterval: Duration(milliseconds: 40),
    showItemDuration: Duration(milliseconds: 300),
    visibleFraction: 0.05,
    reAnimateOnVisibility: false,
  );

  List<String> imei = [
    "1111111111111",
    "2222222222222",
    "3333333333333",
    "1111111111111",
    "2222222222222",
    "3333333333333",
  ];

  // SignedProvider? provider;
  // Timer? _timer;

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    // provider = context.read<SignedProvider>();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   provider!.getData();
    //   _timer = Timer.periodic(Duration(seconds: 10), (timer) {
    //     provider!.getData();
    //   });
    // });
    // provider?.addListener(() {
    //   setState(() {});
    // });
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _timer?.cancel();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(68, 68, 68, 1),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          onPressed: () => Get.offAll(SelectionPage()),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey.shade200,
          ),
        ),
        title: AnimatedSearchBar(
            label: "YO'QOLGAN QURILMALAR",
            controller: TextEditingController(),
            closeIcon: Icon(
              Icons.close,
              color: Colors.grey.shade200,
              key: ValueKey('close'),
            ),
            searchIcon: Icon(
              Icons.search,
              color: Colors.grey.shade200,
              key: ValueKey('search'),
            ),
            labelStyle: TextStyle(
              color: Colors.grey.shade200,
              fontSize: 15,
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
            searchStyle: const TextStyle(color: Colors.white, letterSpacing: 1),
            cursorColor: Colors.white,
            textInputAction: TextInputAction.done,
            searchDecoration: const InputDecoration(
              hintText: 'Search',
              alignLabelWithHint: true,
              fillColor: Colors.white,
              focusColor: Colors.white,
              hintStyle: TextStyle(color: Colors.white70),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              debugPrint('value on Change');
              setState(() {
                // searchText = value;
              });
            },
            onFieldSubmitted: (value) {
              debugPrint('value on Field Submitted');
              setState(() {
                // searchText = value;
              });
            }),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: LiveList.options(
          options: options,
          itemCount: imei.length,
          padding: EdgeInsets.only(top: 20, bottom: 10),
          itemBuilder: (
            BuildContext context,
            int index,
            Animation<double> animation,
          ) =>
              FadeTransition(
            opacity: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(animation),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, -0.1),
                end: Offset.zero,
              ).animate(animation),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Icon(Icons.keyboard_double_arrow_left, color: Colors.lightBlueAccent),
                        Text(
                          "Topildi",
                          style: TextStyle(
                              color: Colors.tealAccent,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.check_circle_outline,
                            color: Colors.tealAccent, size: 26),
                        SizedBox(width: 20),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.teal.shade600,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  key: ValueKey<String>(imei[index]),
                  onDismissed: (DismissDirection direction) {
                    Get.defaultDialog(
                      title: 'Tasdiqlash',
                      titleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      content: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                style: TextStyle(fontSize: 15),
                                children: [
                                  TextSpan(
                                    text:
                                        "Qurilma topilganligini tasdiqlash uchun, ",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: "(94)-679-22-20",
                                    style: TextStyle(
                                        color: Colors.deepPurple.shade700),
                                  ),
                                  TextSpan(
                                    text: " telefon nomerga yuborilgan  kodni kiriting",
                                    style: TextStyle(color: Colors.black, wordSpacing: 2),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton(
                                  onPressed: () {},
                                  child: Text("Kodni yuborish"),
                                  style: OutlinedButton.styleFrom(
                                    // padding: EdgeInsets.symmetric(horizontal: 2)
                                  ),
                                )
                              ],
                            ),
                            Container(
                            height: 44,
                            margin: EdgeInsets.only(
                                top: 40, bottom: 30),
                            child: TextFormField(
                              controller: TextEditingController(),
                              cursorColor: Colors.black,
                              cursorWidth: 1,
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  left: 16,
                                  right: 4,
                                ),
                                label: Text(
                                  "Shakl1",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(.4),
                                      fontSize: 14),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black.withOpacity(.3))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black54)),
                              ),
                            ),
                          ),
                          ],
                        ),
                      ),
                      confirm: Container(
                        width: 100,
                        height: 48,
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            Get.off(ListImImeiFound());
                            Navigator.of(Get.overlayContext!,
                                    rootNavigator: true)
                                .pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Topilganlarga qo'shildi",
                                  style: TextStyle(
                                    fontSize: 16,
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
                            "Ok",
                            style: TextStyle(
                              color: Colors.grey.shade200,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .5,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 6),
                        color: Colors.grey.shade200,
                        child: ListTile(
                          leading:
                              Image.asset("assets/icons/phone.png", width: 36),
                          title: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              imei[index],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 9,
                        bottom: 9,
                        child: Text(
                          "22:19",
                          style: TextStyle(fontSize: 11, color: Colors.black45),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () => Get.off(CreateImeiLost()),
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.grey.shade200,
        ),
      ),
    );
  }
}
