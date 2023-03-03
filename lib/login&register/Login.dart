import 'package:flutter/material.dart';
import 'package:flutter_course/Home/Home.dart';
import 'package:flutter_course/login&register/Register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _passwordVisible = true;
  bool _passwordVisible2 = true;

  TextEditingController txtpwd = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  void login(context) {
    bool myvalid = _formkey.currentState!.validate();
    if (txtpwd.text.isNotEmpty && txtemail.text.isNotEmpty && myvalid) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ));
    } else if (txtpwd.text.isEmpty && txtemail.text.isEmpty && myvalid) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black, width: 0.5),
          borderRadius: BorderRadius.circular(24),
        ),
        content: const Text(
          "Failed",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: WaveClip(),
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 450),
                      color: Colors.deepPurple.withOpacity(.8),
                      height: 220,
                      alignment: Alignment.center,
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.only(top: 100),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height / 6,
              ),
              Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: txtemail,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 5) {
                            return "Wrong Value";
                          } else if (!value.contains(".") &&
                              !value.contains("@")) {
                            return "Please enter a valid Email";
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        enabled: true,
                        style: const TextStyle(
                          color: Colors.deepPurple,
                        ),
                        cursorHeight: 20,
                        autofocus: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.deepPurple.withOpacity(0.2),
                          hintStyle: const TextStyle(color: Colors.deepPurple),
                          labelText: "Email",
                          hintText: "Enter your email",
                          prefixIcon: const Icon(Icons.email_outlined),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(
                                color: Colors.deepPurple.withOpacity(0.2),
                                width: 1.5),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: txtpwd,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "No Value";
                          } else if (value.length < 5) {
                            return "Password is wrong";
                          }
                        },
                        obscureText: _passwordVisible,
                        // decoration: InputDecoration(fillColor: Colors.orange, filled: true),
                        style: const TextStyle(
                          color: Colors.deepPurple,
                        ),
                        cursorHeight: 20,
                        autofocus: false,
                        keyboardType: TextInputType.text,
                        // controller: _userPasswordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible == true
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = true
                                    ? _passwordVisible == false
                                    : _passwordVisible == true;
                              });
                            },
                          ),
                          filled: true,
                          fillColor: Colors.deepPurple.withOpacity(0.2),
                          hintStyle: const TextStyle(color: Colors.deepPurple),
                          labelText: "password",
                          hintText: "Enter your password",
                          prefixIcon: const Icon(Icons.lock_outline),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(
                                color: Colors.deepPurple.withOpacity(0.2),
                                width: 1.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.deepPurple),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: size.width * 0.90,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Register(),
                        ));
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.deepPurple)),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: size.width * 0.90,
                child: MaterialButton(
                  onPressed: () {
                    login(context);
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.deepPurple, fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomToolbarShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = const Color.fromARGB(255, 11, 121, 211);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10;

    TextSpan span =
        TextSpan(style: TextStyle(color: Colors.blue[800]), text: "hello");
    TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, const Offset(5.0, 5.0));

    var path = Path();

    path.lineTo(0, size.height * 0.39);
    path.lineTo(size.width * 0.20, size.height * 0.36);
    path.lineTo(size.width * 0.30, size.height * 0.36);
    path.lineTo(size.width * 0.45, size.height * 0.37);
    path.lineTo(size.width * 0.60, size.height * 0.39);
    path.lineTo(size.width * 0.68, size.height * 0.40);
    path.lineTo(size.width * 0.72, size.height * 0.40);

    path.lineTo(size.width, size.height / 2.7);
    path.lineTo(size.width, 0);

    /*   path.lineTo(x, y);
    path.lineTo(x, y);
    path.lineTo(x, y);
 */
    //  path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final lowPoint = size.height - 20;
    final highPoint = size.height - 20;
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 4, highPoint, size.width / 2, lowPoint);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, lowPoint);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
