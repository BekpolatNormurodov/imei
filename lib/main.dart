import 'package:imei/library.dart';

main(List<String> args) async {
  await Hive.initFlutter();
  await Hive.openBox('data');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AccountProvider>(
          create: (context) => AccountProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
  MyApp();
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360.0, 758.7),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            // theme: ThemeData(
            //   textTheme: GoogleFonts.slabo13pxTextTheme(),
            // ),
            home: LockPage(),
          ),
        );
      },
    );
  }
}
