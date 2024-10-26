import 'package:imei/library.dart';

class ListImImeiPage extends StatefulWidget {
  ListImImeiPage({super.key});

  @override
  State<ListImImeiPage> createState() => _ListImImeiPageState();
}

class _ListImImeiPageState extends State<ListImImeiPage> {
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
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          "YO'QOLGAN QURILMALAR",
          style: TextStyle(
            color: Colors.white,
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
          IconButton(onPressed: (){}, icon: Icon(Icons.search, size: 26, color: Colors.white,)),
          SizedBox(width: 6),
        ],
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
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
                          leading:
                              Image.asset("assets/icons/phone.png", width: 32),
                          title: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "12345678901234",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 22,
                        bottom: 8,
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
      floatingActionButton: FloatingActionButton(onPressed: ()=>Get.to(CreateImeiPage()), child: Icon(Icons.add),),
    );
  }
}
