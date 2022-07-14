import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:se_to_do/auth/login/view/login_view.dart';
import 'package:se_to_do/widget/animation.dart';

class ForgotProvider extends ChangeNotifier {
  BuildContext context;
  TextEditingController? emailcontroller = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  ForgotProvider(this.context);
  resetPassword() {
    if (formGlobalKey.currentState!.validate()) {
      reset();
      Navigator.push<void>(
        context,
      BouncyPageRoute(widget: LoginView()),
        
      );
    }
  }

  reset() async {
    try {
      //burdakıi kodu çalıştır hata çıkarsa  catch çalışır,çıkmazsa bu kod çalışır
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller!.text);
    } catch (e) {
      print("hataaaaa" + e.toString());
    }
  }
}
