import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:se_to_do/core/extensions/context_extension.dart';
import 'package:se_to_do/pages/auth/login/view/login_view.dart';


class ForgotPasswordProvider extends ChangeNotifier {
  BuildContext context;
  TextEditingController? emailcontroller = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  ForgotPasswordProvider(this.context);
  resetPassword() {
    if (formGlobalKey.currentState!.validate()) {
      reset();
      context.toPage(LoginView());
    }
  }

  reset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller!.text);
    } catch (e) {
      print("hataaaaa" + e.toString());
    }
  }
}
