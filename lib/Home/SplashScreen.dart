import 'package:flutter/material.dart';
import 'package:flutter_course/Home/Home.dart';
import 'package:flutter_course/login&register/Login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  int splashtime = 3;
  // duration of splash screen on second

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return 1 == 1 ? const Home() : const Login();
        //Login();
      }));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //vertically align center
                children: <Widget>[
                  SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset("assets/images/splash.png")),
                  /*  AnimatedContainer(
                    duration: Duration(seconds: 3),
                    curve: Curves.bounceIn,
                    margin: EdgeInsets.only(top: 30),
                    alignment: Alignment.center,
                    //margin top 30
                    child: Text(
                      "Welcome To BaBaAli App",
                      style:TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ), */
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: const Text("Version: 1.0.0",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        )),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const CircularProgressIndicator(
                    strokeWidth: 4.0,
                    color: Colors.amber,
                  ),
                ])));
  }
}
