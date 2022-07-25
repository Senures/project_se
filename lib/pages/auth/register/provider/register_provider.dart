import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:se_to_do/core/extensions/context_extension.dart';
import 'package:se_to_do/pages/auth/login/view/login_view.dart';
import 'package:se_to_do/widget/snackbar_widget.dart';

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
    }
  }

  createUser() async {
    setIsLoading(true);
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller!.text,
        password: passwordcontroller!.text,
      );
      if (credential.user != null) {
        createUserCollection(credential);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        snackBarCustom(
          context,
          "Password too weak. Please enter your password as a stronger password.",
        );
      } else if (e.code == 'email-already-in-use') {
        snackBarCustom(context, "The account for this Email already exists.");
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
    context.toPage(LoginView());

    setIsLoading(false);
  }
}
