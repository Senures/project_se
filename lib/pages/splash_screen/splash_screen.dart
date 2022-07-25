import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:se_to_do/core/extensions/context_extension.dart';
import 'package:se_to_do/core/style/image.dart';
import 'package:se_to_do/pages/auth/auth_root/auth_root.dart';
import 'package:se_to_do/pages/home/view/home_view.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
        context.toPageReplacement(AuthRootView());
      } else {
        context.toPageReplacement(HomeView());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          width: context.width,
          height: context.height,
          child: Image.asset(
            logoImg,
            width: 150.0,
          )),
    );
  }
}
