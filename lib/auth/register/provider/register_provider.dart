import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:se_to_do/auth/login/view/login_view.dart';
import 'package:se_to_do/widget/custom_snackbar.dart';
import 'package:se_to_do/widget/snackbar_widget.dart';

import '../../../utils/const.dart';

class RegisterProvider extends ChangeNotifier {
  BuildContext context;
  TextEditingController? emailcontroller = TextEditingController();
  TextEditingController? passwordcontroller = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool obscureText = false;
  RegisterProvider(this.context) {
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

  registerWithEmail() {
    if (formGlobalKey.currentState!.validate()) {
      createUser();
    } else {}
  }

  createUser() async {
    setIsLoading(true);
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller!.text,
        password: passwordcontroller!.text,
      );
      if (credential.user != null) //null değilse
      {
        createUserCollection(credential);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        snackBarCustom(
            context,
            "Password too weak. Please enter your password as a stronger password.",
            ProjectColors.kBdarkPurple,
            3);
      } else if (e.code == 'email-already-in-use') {
        snackBarCustom(context, "The account for this Email already exists.",
            ProjectColors.kBdarkPurple, 3);
      }
      setIsLoading(false);
    } catch (e) {
      setIsLoading(false);
    }
  }

  createUserCollection(UserCredential credential) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.doc(credential.user!.uid).set({
      "id": credential.user!.uid,
      "mail": credential.user!.email,
    });

    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const LoginView(),
      ),
    );
    setIsLoading(false);
  }
}
