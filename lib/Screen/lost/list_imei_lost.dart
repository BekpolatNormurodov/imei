import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:imei/library.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class ListImImeiLost extends StatefulWidget {
  ListImImeiLost({super.key});

  @override
  State<ListImImeiLost> createState() => _ListImImeiLostState();
}

class _ListImImeiLostState extends State<ListImImeiLost> {
  late final SmsRetriever smsRetriever;
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;

  bool? enableButton;
  Timer? _timer;
  int _secoundCount = 60;
  int _minutCount = 2;

  bool codeSend = false;

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
    if (kIsWeb) {
      BrowserContextMenu.disableContextMenu();
    }
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();

    /// In case you need an SMS autofill feature
    smsRetriever = SmsRetrieverImpl(
      SmartAuth(),
    );

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

  @override
  void dispose() {
    if (kIsWeb) {
      BrowserContextMenu.enableContextMenu();
    }
    pinController.dispose();
    focusNode.dispose();

    _timer!.cancel();
    setState(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color focusedBorderColor = Colors.deepPurpleAccent.shade700;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    Color borderColor = Colors.deepPurpleAccent.withOpacity(.4);

    final defaultPinTheme = PinTheme(
      width: 40,
      height: 40,
      textStyle: const TextStyle(
        fontSize: 16,
        color: Color.fromARGB(255, 24, 10, 63),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    enableButton = false;
                    pinController.clear();
                    // _timer!.cancel();
                    _secoundCount = 60;
                    _minutCount = 2;
                    codeSend = false;
                    showDialog(
                      barrierColor: Colors.black.withOpacity(.8),
                      context: context,
                      builder: (
                        context,
                      ) {
                        return StatefulBuilder(
                          builder: (context, StateSetter setState) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              scrollable: true,
                              elevation: 10,
                              iconPadding: EdgeInsets.zero,
                              icon: Container(
                                margin: EdgeInsets.only(top: 18),
                                child: Text(
                                  "SMS kodi",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              titlePadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 16),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '* Tasdiqlash kodini kiriting.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black.withOpacity(.6),
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "   +998 (94) 679-22-20",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(),
                                      codeSend
                                          ? Container(
                                              margin: EdgeInsets.only(top: 20),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.timer_outlined,
                                                    color: Colors
                                                        .deepPurple.shade900,
                                                  ),
                                                  SizedBox(width: 8),
                                                  Text(
                                                    _minutCount > -1
                                                        ? (_secoundCount > 9
                                                            ? "0$_minutCount:$_secoundCount"
                                                            : "0$_minutCount:0$_secoundCount")
                                                        : '',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        letterSpacing: .6,
                                                        color: Colors.deepPurple
                                                            .shade900),
                                                  )
                                                ],
                                              ),
                                            )
                                          : Container(
                                              margin: EdgeInsets.only(top: 20),
                                            ),
                                      codeSend
                                          ? Container(
                                              margin: EdgeInsets.only(
                                                  top: 20, bottom: 2),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 24, vertical: 12),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.black
                                                        .withOpacity(.2),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: Text(
                                                "YUBORISH",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black
                                                      .withOpacity(.2),
                                                  letterSpacing: .5,
                                                ),
                                              ),
                                            )
                                          : Container(
                                              margin: EdgeInsets.only(top: 18),
                                              child: OutlinedButton(
                                                onPressed: () {
                                                  codeSend = true;
                                                  _timer = Timer.periodic(
                                             
                                                    Duration(seconds: 1),
                                                    (timer) {
                                                      this._secoundCount -= 1;
                                                      setState(
                                                        () {
                                                          if (_secoundCount ==
                                                              -1) {
                                                            _secoundCount = 59;
                                                            _minutCount -= 1;
                                                            setState(() {});
                                                          }
                                                          if (_minutCount < 0) {
                                                            codeSend = false;
                                                            _secoundCount = 60;
                                                            _minutCount = 2;
                                                            _timer!.cancel();
                                                          }
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Text(
                                                  "YUBORISH",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors
                                                        .deepPurpleAccent
                                                        .shade700,
                                                    letterSpacing: .5,
                                                  ),
                                                ),
                                                style: OutlinedButton.styleFrom(
                                                  side: BorderSide(
                                                    color:
                                                        Colors.deepPurpleAccent,
                                                    width: 1,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6)),
                                                ),
                                              ),
                                            ),
                                    ],
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 50, bottom: 30),
                                    alignment: Alignment.center,
                                    child: Form(
                                      key: formKey,
                                      child: Directionality(
                                        // Specify
                                        // direction if desired
                                        textDirection: TextDirection.ltr,
                                        child: Pinput(
                                          // You can pass your own SmsRetriever implementation based on any package
                                          // in this example we are using the SmartAuth
                                          smsRetriever: smsRetriever,
                                          controller: pinController,
                                          focusNode: focusNode,
                                          defaultPinTheme: defaultPinTheme,
                                          separatorBuilder: (index) =>
                                              const SizedBox(width: 10),
                                          validator: (value) {
                                            enableButton =
                                                value! == '2222' ? true : false;
                                            setState(() {});
                                            print(enableButton);
                                            return value == '2222'
                                                ? null
                                                : 'Kod xato!';
                                          },
                                          hapticFeedbackType:
                                              HapticFeedbackType.lightImpact,
                                          onCompleted: (pin) {
                                            debugPrint('onCompleted: $pin');
                                          },
                                          onChanged: (value) {
                                            debugPrint('onChanged: $value');
                                          },
                                          cursor: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 9),
                                                width: 16,
                                                height: 1,
                                                color: focusedBorderColor,
                                              ),
                                            ],
                                          ),
                                          focusedPinTheme:
                                              defaultPinTheme.copyWith(
                                            decoration: defaultPinTheme
                                                .decoration!
                                                .copyWith(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: focusedBorderColor,
                                                  width: .8),
                                            ),
                                          ),
                                          submittedPinTheme:
                                              defaultPinTheme.copyWith(
                                            decoration: defaultPinTheme
                                                .decoration!
                                                .copyWith(
                                              color: fillColor,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: focusedBorderColor),
                                            ),
                                          ),
                                          errorPinTheme:
                                              defaultPinTheme.copyBorderWith(
                                            border: Border.all(
                                                color: Colors.redAccent),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              content: OutlinedButton.icon(
                                onPressed: () {
                                  if (enableButton!) {
                                    _timer!.cancel();
                                    Get.off(ListImImeiFound());
                                    Navigator.of(Get.overlayContext!,
                                            rootNavigator: true)
                                        .pop();
                                    Get.snackbar(imei[index],
                                        "Topilganlar ro'yxatiga qo'shildi.",
                                        backgroundColor: Colors.green);
                                  }
                                },
                                icon: Icon(Icons.check_circle,
                                    color: enableButton!
                                        ? Colors.white
                                        : Colors.black.withOpacity(.1)),
                                label: Text(
                                  "TASDIQLASH",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: enableButton!
                                        ? Colors.grey.shade100
                                        : Colors.black.withOpacity(.1),
                                    letterSpacing: .6,
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                  // shadowColor: enableButton! ? Colors.deepPurpleAccent : Colors.transparent,
                                  overlayColor: enableButton!
                                      ? Colors.red.shade900
                                      : Colors.transparent,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 10),
                                  backgroundColor: enableButton!
                                      ? Colors.deepPurpleAccent
                                      : Colors.black.withOpacity(.1),
                                  elevation: 8,
                                  side: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                              ),
                            );
                          },
                        );
                      },
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

class SmsRetrieverImpl implements SmsRetriever {
  const SmsRetrieverImpl(this.smartAuth);

  final SmartAuth smartAuth;

  @override
  Future<void> dispose() {
    return smartAuth.removeSmsListener();
  }

  @override
  Future<String?> getSmsCode() async {
    final signature = await smartAuth.getAppSignature();
    debugPrint('App Signature: $signature');
    final res = await smartAuth.getSmsCode(
      useUserConsentApi: true,
    );
    if (res.succeed && res.codeFound) {
      return res.code!;
    }
    return null;
  }

  @override
  bool get listenForMultipleSms => false;
}