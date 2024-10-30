import 'package:imei/Screen/lost/list_imei_lost.dart';
import 'package:imei/library.dart';
export 'package:flutter_slidable/flutter_slidable.dart';

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
          // itemCount: provider!.data.length,
          itemCount: 6,
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
              child: GestureDetector(
                onTap: () {},
                child: Stack(
                  children: [
                    Slidable(
                      key: const ValueKey(0),
                      endActionPane:  ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            // An action can be bigger than the others.
                            flex: 2,
                            onPressed: (context){},
                            backgroundColor: Color(0xFF7BC043),
                            foregroundColor: Colors.white,
                            icon: Icons.archive,
                            label: 'Archive',
                          ),
                        ],
                      ),
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        color: Colors.grey.shade200,
                        child: ListTile(
                          leading:
                              Image.asset("assets/icons/phone.png", width: 36),
                          title: Padding(
                            padding: EdgeInsets.only(left: 8),
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
