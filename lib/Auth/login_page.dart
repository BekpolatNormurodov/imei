import 'package:imei/library.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // String adminPassword = 'bek1995admin';
  String username = 'kali';
  String usersPassword = '1234';
  bool enableEmail = false;
  bool enablePassword = false;
  bool showPassword = true;
  // bool hasToken = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(39, 39, 39, 1),
      body: _page(),
    );
  }

  Widget _page() {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _icon(),
              SizedBox(height: 100),
              _inputField("E-mail", usernameController),
              SizedBox(height: 20),
              _inputField("Password", passwordController),
              SizedBox(height: 40),
              _loginBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _icon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: 'intro',
          child: Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/IIV-logo.png"),
                // fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(width: 26),
        Container(
          width: 150,
          child: TypeWriter.text(
            "IMEI - 102",
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.justify,
            duration: const Duration(milliseconds: 300),
          ),
        ),
      ],
    );
  }

  Widget _inputField(String label, TextEditingController controller) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey),
    );
    var focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade200),
    );

    return TextFormField(
      onChanged: (e) {
        setState(() {
          if (e.isNotEmpty)
            enablePassword = true;
          else
            enablePassword = false;
        });
      },
      style: TextStyle(
          color: Colors.grey.shade200,
          letterSpacing: label == "Password" ? 2 : 1),
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(color: Colors.grey.shade300),
        ),
        enabledBorder: border,
        focusedBorder: focusedBorder,
        suffixIcon: label == "Password"
            ? IconButton(
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                icon: Icon(
                  showPassword ? Icons.remove_red_eye : Icons.visibility_off,
                  color: Colors.grey,
                  size: 24,
                ),
              )
            : Icon(
                Icons.mail,
                size: 24,
                color: Colors.grey,
              ),
      ),
      obscureText: label == "Password" ? showPassword : false,
      obscuringCharacter: '*',
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: () async {
        if (passwordController.text == usersPassword) {
          // Get.offAll(Hive.box('data').isEmpty ? CreateSettings() : NavigatorBar());
          Get.off(SelectionPage());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Parol to'g'ri",
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
          // var response = await WorkersPost().workersPost(
          //   username: usernameController.text,
          //   admin: false.toString(),
          // );
          // Constant.username = response['username'];
          // Constant.admin = false;
          // setState(() {});
        }
        //  else if (passwordController.text == adminPassword) {
        //   Get.offAll(SearchPage());
        //   Get.snackbar('Successful !!!', 'Welcome to Admin Panel',
        //       backgroundColor: Colors.green.withOpacity(.8));

        //   var response = await WorkersPost().workersPost(
        //     username: usernameController.text,
        //     admin: true.toString(),
        //   );
        //   Constant.username = response['username'];
        //   Constant.admin = true;
        //   setState(() {});
        // }
        else {
          Get.snackbar('Faild...', "Parol xato", backgroundColor: Colors.red.withOpacity(.8));
        }
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor:
            enablePassword ? Colors.teal : Colors.white.withOpacity(.1),
        foregroundColor: Colors.grey,
        padding: EdgeInsets.only(top: 16, bottom: 12),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          "Kirish",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: enablePassword ? Colors.grey.shade200 : Colors.grey.shade700,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
