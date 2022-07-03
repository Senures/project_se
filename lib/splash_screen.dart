import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:se_to_do/home/view/home_view.dart';
import 'package:se_to_do/page/root_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      final userCredential = FirebaseAuth.instance.currentUser;
      if (userCredential == null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const RootPageView()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomeView()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          width: size.width,
          height: size.height,
          child: Image.asset(
            "assets/images/tasks.png",
            width: 150.0,
          )),
    );
  }
}
