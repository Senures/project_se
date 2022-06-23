import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:se_to_do/home/view/home_view.dart';
import 'package:se_to_do/widget/custom_snackbar.dart';

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
    if (formGlobalKey.currentState!.validate()) {
      setIsLoading(true);
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller!.text,
          password: passwordcontroller!.text,
        );

        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const HomeView(),
          ),
        );
        setIsLoading(false);
      } on FirebaseAuthException catch (e) {
        setIsLoading(false);
        if (e.code == 'user-not-found') {
          customSnackbar(
              context: context,
              type: 'error',
              message:
                  'Kullanıcı bulunamadı. Lütfen bilgilerinizi kontrol ediniz.');
        } else if (e.code == 'wrong-password') {
          customSnackbar(
              context: context,
              type: 'error',
              message:
                  'Şifre yanlış girildi. Lütfen bilgilerinizi kontrol ediniz.');
        } else if (e.code == 'user-disabled') {
          customSnackbar(
              context: context,
              type: 'error',
              message: 'Hesabınız bloke edilmiştir. Lütfen iletişime geçiniz.');
        } else if (e.code == 'invalid-email') {
          customSnackbar(
              context: context,
              type: 'error',
              message:
                  'Geçersiz E-posta girdiniz. Lütfen bilgilerinizi kontrol ediniz.');
        }
      } catch (e) {
        setIsLoading(false);
      }
    }
  }

  tapToGmail() {}
}
