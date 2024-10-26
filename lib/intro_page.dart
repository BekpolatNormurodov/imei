import 'package:imei/library.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  AnimationController? _controller;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: Duration(seconds: 1));

    _controller!.forward();
    _controller!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Get.offAll(LoginPage());
    });
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Color.fromRGBO(68, 68, 68, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'intro',
              child: Container(
                width: Get.width - 80,
                height: Get.width - 80,
                alignment: Alignment.center,
                child: Container(
                  width: Get.width,
                  height: MediaQuery.of(context).size.width * _controller!.value,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/IIV-logo.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
