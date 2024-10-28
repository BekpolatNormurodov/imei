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
            )),
        title: Text(
          "YO'QOLGAN QURILMALAR",
          style: TextStyle(
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
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 26,
                color: Colors.grey.shade200,
              )),
          SizedBox(width: 6),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              height: 80,
              child: AnimationSearchBar(
                onChanged: (text) {
                  [] = [].where((e) {
                    return e.idNumber
                            .toString()
                            .toLowerCase()
                            .contains(text.toLowerCase()) ||
                        e.passportNumber
                            .toString()
                            .toLowerCase()
                            .contains(text.toLowerCase()) ||
                        e.name
                            .toString()
                            .toLowerCase()
                            .contains(text.toLowerCase()) ||
                        e.surname
                            .toString()
                            .toLowerCase()
                            .contains(text.toLowerCase()) ||
                        e.fatherName
                            .toString()
                            .toLowerCase()
                            .contains(text.toLowerCase());
                  }).toList();
                  setState(() {});
                },
                searchTextEditingController: TextEditingController(),
                closeIconColor: Colors.grey.shade200,
                centerTitle: "YO'QOLGAN QURILMALAR",
                hintText: 'Izlash',
                centerTitleStyle: TextStyle(
                  color: Colors.grey.shade100,
                  fontSize: 14.sp,
                  letterSpacing: .8,
                  shadows: [
                    BoxShadow(
                      offset: Offset(.5, .5),
                      blurRadius: 1.r,
                      color: Colors.red.shade100,
                    )
                  ],
                ),
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                cursorColor: Colors.lightBlue.shade300,
                duration: Duration(milliseconds: 300),
                searchFieldHeight: 35.h,
                searchBarHeight: 50.h,
                searchBarWidth: Get.width - 24.w,
                horizontalPadding: 5.w,
                verticalPadding: 4.h,
                searchIconColor: Colors.white.withOpacity(.6),
                searchFieldDecoration: BoxDecoration(
                  color: Colors.blueGrey.shade700,
                  border: Border.all(
                    color: Colors.black.withOpacity(.2),
                    width: .5.w,
                  ),
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
            ),
            Expanded(
              child: LiveList.options(
                options: options,
                // itemCount: provider!.data.length,
                itemCount: 4,
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
                    child: InkWell(
                      onTap: () {},
                      child: Stack(
                        children: [
                          Card(
                            margin:
                                EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                            color: Colors.grey.shade200,
                            child: ListTile(
                              leading: Image.asset("assets/icons/phone.png",
                                  width: 32),
                              title: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "12345678901234",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 22,
                            bottom: 8,
                            child: Text(
                              "22:19",
                              style:
                                  TextStyle(fontSize: 11, color: Colors.black45),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () => Get.to(CreateImeiLost()),
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.grey.shade200,
        ),
      ),
    );
  }
}
