import 'package:flutter/material.dart';

class SaibLoginScreen extends StatelessWidget {
  const SaibLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saudi Investment Bank',
      debugShowCheckedModeBanner: false,
      home: SaibLogin(),
    );
  }
}

class SaibLogin extends StatefulWidget {
  const SaibLogin({Key? key}) : super(key: key);

  @override
  _SaibLoginState createState() => _SaibLoginState();
}

class _SaibLoginState extends State<SaibLogin> {
  ButtonStyle mainBtnSt = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(36),
      ),
    ),
  );
  List<String> icPath = [
    'assets/icons/ic_aboutus.png',
    'assets/icons/ic_locator.png',
    'assets/icons/ic_phone.png',
  ];
  InputDecoration getInputDecoration(
      {required String hint, required bool hasIcon}) {
    if (hasIcon) {
      return InputDecoration(
        hintText: hint,
        suffixIcon: const Icon(
          Icons.visibility,
          color: Colors.grey,
        ),
        hintStyle: const TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      );
    }
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        fontSize: 18,
        color: Colors.grey,
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
    );
  }

  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.7;
    double buttonHeight = MediaQuery.of(context).size.height * 0.09;
    double logoHit = MediaQuery.of(context).size.height * 0.1;
    double logoWid = MediaQuery.of(context).size.width * 0.6;
    double clmnBtnHit = MediaQuery.of(context).size.height * 0.05;
    double clmnBtnWid = MediaQuery.of(context).size.width * 0.10;
    const TextStyle mainBtnTextSt = TextStyle(
      color: Colors.black,
      fontSize: 16,
    );
    List<Widget> btnColumn = List.generate(
      icPath.length,
      (index) => GestureDetector(
        onTap: () {
          print('${[index]} Tapped.');
        },
        child: Container(
          width: clmnBtnWid,
          height: clmnBtnHit,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                icPath[index],
              ),
            ),
          ),
        ),
      ),
    );
    double screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: screenHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg_landing.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/map_dots.png'))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: Stack(
                      children: [
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/line.png'),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.13,
                          left: MediaQuery.of(context).size.width * 0.25,
                          child: const RotationTransition(
                            turns: AlwaysStoppedAnimation(10 / 360),
                            child: Image(
                              image: AssetImage('assets/icons/ic_plane.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: logoHit,
                          width: logoWid,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/logo_saib.png'),
                            ),
                          ),
                        ),
                        Form(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: getInputDecoration(
                                        hint: 'Username',
                                        hasIcon: false,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    obscureText: true,
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: getInputDecoration(
                                      hint: 'Password',
                                      hasIcon: true,
                                    ),
                                  ),
                                ),
                                Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Colors.white,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: CheckboxListTile(
                                    value: checkBoxValue,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        checkBoxValue = value!;
                                      });
                                    },
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    contentPadding: EdgeInsets.zero,
                                    title: const Text(
                                      'Remember me',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: buttonWidth,
                          height: buttonHeight,
                          child: ElevatedButton(
                            style: mainBtnSt,
                            child: const Text(
                              'Login',
                              style: mainBtnTextSt,
                            ),
                            onPressed: () {
                              print('Login');
                            },
                          ),
                        ),
                        GestureDetector(
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white54,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onTap: () {},
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account ",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white54,
                              ),
                            ),
                            GestureDetector(
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white54,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 44, vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: btnColumn,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
