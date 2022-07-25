import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:se_to_do/core/extensions/context_extension.dart';
import 'package:se_to_do/pages/home/view/home_view.dart';
import 'package:se_to_do/widget/snackbar_widget.dart';
import 'package:google_sign_in/google_sign_in.dart';


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

  loginEmail() {
    if (formGlobalKey.currentState!.validate()) {
      createEmail();
    }
  }

  createEmail() async {
    setIsLoading(true);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller!.text,
        password: passwordcontroller!.text,
      );
      context.toPage(HomeView());

      setIsLoading(false);
    } on FirebaseAuthException catch (e) {
      setIsLoading(false);
      if (e.code == 'user-not-found') {
        snackBarCustom(
          context,
          "User not found. Please check your information.",
        );
      } else if (e.code == 'wrong-password') {
        snackBarCustom(
          context,
          "The password was entered incorrectly. Please check your information.",
        );
      } else if (e.code == 'user-disabled') {
        snackBarCustom(
          context,
          "Your account has been blocked. Please contact.",
        );
      } else if (e.code == 'invalid-email') {
        snackBarCustom(
          context,
          "You have entered an Invalid Email. Please check your information.",
        );
      }
    } catch (e) {
      setIsLoading(false);
    }
  }
  Future<UserCredential> signInWithGoogle() async {
 
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;


  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
}




 
 
