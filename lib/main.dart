import 'package:flutter/material.dart';
import 'package:saib_ui_task/login_screen.dart';

void main() {
  runApp(const SaibLandingScreen());
}

class SaibLandingScreen extends StatelessWidget {
  const SaibLandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saudi Investment Bank',
      debugShowCheckedModeBanner: false,
      home: SaibHome(),
    );
  }
}

class SaibHome extends StatefulWidget {
  const SaibHome({Key? key}) : super(key: key);

  @override
  _SaibHomeState createState() => _SaibHomeState();
}

class _SaibHomeState extends State<SaibHome> {
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
  List<String> icString = [
    'About Us',
    'ATM Locator',
    'Contact Us',
  ];

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
          print('${icString[index]} Tapped.');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
            const SizedBox(
              height: 5,
            ),
            Text(
              icString[index],
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg_landing.png'), fit: BoxFit.fill),
          ),
          child: Container(
            decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('assets/map_dots.png'))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 2,
                  child: Stack(
                    children: [
                      Positioned(
                        right: MediaQuery.of(context).size.width * 0.07,
                        top: 80,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all<double>(0),
                              shape: MaterialStateProperty.all<CircleBorder>(
                                const CircleBorder(),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white)),
                          child: const Text(
                            'AR',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            print('AR tapped.');
                          },
                        ),
                      ),
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
                        child: RotationTransition(
                          turns: AlwaysStoppedAnimation(10 / 360),
                          child: Container(
                            child: Image(
                              image: AssetImage('assets/icons/ic_plane.png'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      const Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: btnColumn,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 3,
                  child: Column(
                    children: [
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SaibLoginScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: buttonWidth,
                        height: buttonHeight,
                        child: ElevatedButton(
                          style: mainBtnSt,
                          child: const Text(
                            'Register',
                            style: mainBtnTextSt,
                          ),
                          onPressed: () {},
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
    );
  }
}
