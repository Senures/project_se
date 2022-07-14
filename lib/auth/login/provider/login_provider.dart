import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:se_to_do/home/view/home_view.dart';
import 'package:se_to_do/utils/const.dart';
import 'package:se_to_do/widget/animation.dart';
import 'package:se_to_do/widget/custom_snackbar.dart';
import 'package:se_to_do/widget/snackbar_widget.dart';

class LoginProvider with ChangeNotifier {
  BuildContext context;
  TextEditingController? emailcontroller = TextEditingController();
  TextEditingController? passwordcontroller = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool obscureText = false;

  LoginProvider(this.context) {
    obscureText = true;
  }
  setObscure() {
    obscureText = !obscureText;
    notifyListeners();
  }

  setIsLoading(bool b) {
    isLoading = b;
    notifyListeners();
  }

  loginEmail() async {
    setIsLoading(true);
    if (formGlobalKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller!.text,
          password: passwordcontroller!.text,
        );

        Navigator.push(context, BouncyPageRoute(widget: HomeView()));
        setIsLoading(false);
      } on FirebaseAuthException catch (e) {
        setIsLoading(false);
        if (e.code == 'user-not-found') {
          snackBarCustom(
              context,
              "User not found. Please check your information.",
              kPrimaryColor,
              3);
        } else if (e.code == 'wrong-password') {
          snackBarCustom(
              context,
              "The password was entered incorrectly. Please check your information.",
              kPrimaryColor,
              3);
        } else if (e.code == 'user-disabled') {
          snackBarCustom(
              context,
              "Your account has been blocked. Please contact.",
              kPrimaryColor,
              3);
        } else if (e.code == 'invalid-email') {
          snackBarCustom(
              context,
              "You have entered an Invalid Email. Please check your information.",
              kPrimaryColor,
              3);
        }
      } catch (e) {
        setIsLoading(false);
      }
    }
  }

  tapToGmail() {}
}
