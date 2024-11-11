import 'package:imei/library.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController jetonController = TextEditingController();
  String email = 'kali';
  String jeton = 'A-123456';
  bool enableEmail = false;
  bool enableJeton = false;
  bool showJeton = true;
  bool hasToken = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(68, 68, 68, 1),
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
              _inputField("E-mail", emailController),
              SizedBox(height: 20),
              _inputField("Jeton raqam", jetonController),
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
          child: Text(
            "IMEI - 102",
            style: TextStyle(
              color: Colors.grey.shade300,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.justify,
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
            enableJeton = true;
          else
            enableJeton = false;
        });
      },
      cursorColor: Colors.deepPurpleAccent,
      style: TextStyle(color: Colors.grey.shade200),
      controller: controller,
      textInputAction: TextInputAction.next,
      textCapitalization: label == "Jeton raqam"
          ? TextCapitalization.characters
          : TextCapitalization.none,
      inputFormatters: label == "Jeton raqam"
          ? [
              TextInputMask(
                mask: 'A-999999',
                placeholder: '_ ',
                maxPlaceHolders: 9,
              )
            ]
          : [],
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(color: Colors.grey.shade300),
        ),
        enabledBorder: border,
        focusedBorder: focusedBorder,
        suffixIcon: label != "Jeton raqam" ? Icon(
          Icons.mail,
          size: 24,
          color: Colors.grey,
        ) : Image.asset("assets/icons/jeton.png", width: 10,),
      ),
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: () async {
        if (jetonController.text == jeton) {
          Get.offAll(Hive.box('oper-data').isEmpty
              ? AccountCreate()
              : SelectionPage());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "To'g'ri",
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
          //   email: emailController.text,
          //   admin: false.toString(),
          // );
          // Constant.email = response['email'];
          // Constant.admin = false;
          // setState(() {});
        }
        //  else if (passwordController.text == adminPassword) {
        //   Get.offAll(SearchPage());
        //   Get.snackbar('Successful !!!', 'Welcome to Admin Panel',
        //       backgroundColor: Colors.green.withOpacity(.8));

        //   var response = await WorkersPost().workersPost(
        //     email: emailController.text,
        //     admin: true.toString(),
        //   );
        //   Constant.email = response['email'];`
        //   Constant.admin = true;
        //   setState(() {});
        // }
        else {
          Get.snackbar('Faild...', "Jeton raqami xato",
              backgroundColor: Colors.red.withOpacity(.8));
        }
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor:
            enableJeton ? Colors.teal : Colors.white.withOpacity(.2),
        padding: EdgeInsets.only(top: 16, bottom: 12),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          "Kirish",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: enableJeton ? Colors.grey.shade200 : Colors.grey,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
