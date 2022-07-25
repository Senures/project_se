import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:se_to_do/core/extensions/context_extension.dart';
import 'package:se_to_do/core/extensions/widget_helper_extension.dart';
import 'package:se_to_do/core/style/colors.dart';
import 'package:se_to_do/core/style/image.dart';
import 'package:se_to_do/pages/auth/forgot_password/view/forgot_password_view.dart';
import 'package:se_to_do/pages/auth/login/provider/login_provider.dart';
import 'package:se_to_do/pages/auth/register/view/register_view.dart';
import 'package:se_to_do/widget/auth_button.dart';
import 'package:se_to_do/widget/auth_textformfield.dart';
import 'package:se_to_do/widget/circularprogress.dart';
import 'package:se_to_do/widget/diagonal_appbar.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
        create: (context) => LoginProvider(context),
        builder: (context, child) {
          return Consumer<LoginProvider>(builder: (context, lp, child) {
            return Scaffold(
              backgroundColor: kLightColor,
              body: lp.isLoading
                  ? const LoadingCircular()
                  : Form(
                      key: lp.formGlobalKey,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildDiagonalAppBar(context),
                                buildTitle(),
                                buildEmailandPassword(lp),
                                buildResetPassword(context),
                                buttonsArea(lp, context)
                              ]),
                        ),
                      ),
                    ),
            );
          });
        });
  }

  buildDiagonalAppBar(BuildContext context) {
    return DiagonalAppBar(
      appBarheight: context.height * 0.25,
      diagonalHeight: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {
                  context.toPageBack();
                },
                icon: const Icon(
                  FontAwesomeIcons.angleLeft,
                  color: kLightColor,
                  size: 30.0,
                )),
          ),
          SafeArea(
            child: Image.asset(
              logoImg,
              width: 60.0,
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 15.0, vertical: 10.0),
    );
  }

  buildTitle() {
    return Text(
      "Login",
      style: TextStyle(
          color: kTextColor, fontWeight: FontWeight.bold, fontSize: 38.0),
    ).paddingAll(padding: 15.0);
  }

  buildEmailandPassword(LoginProvider lp) {
    return Column(
      children: [
        AuthTextField(
          controller: lp.emailcontroller,
          title: "E-mail",
          hintText: "Your email",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please fill this field';
            } else if (!value.contains("@")) {
              return "Please enter valid email";
            }
            return null;
          },
        ).paddingAll(padding: 15.0),
        AuthTextField(
          obscureText: lp.obscureText,
          controller: lp.passwordcontroller,
          title: "Password",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please fill this field';
            } else if (value.length <= 5) {
              return "Password must be at least 6 characters";
            }
            return null;
          },
          hintText: "Password",
          suffixIcon: IconButton(
              onPressed: (() {
                lp.setObscure();
              }),
              icon: lp.obscureText
                  ? const Icon(
                      Icons.visibility_off_rounded,
                      color: Colors.grey,
                    )
                  : const Icon(
                      Icons.visibility,
                      color: kSecondaryColor,
                    )),
        ).paddingAll(padding: 15.0)
      ],
    );
  }

  buildResetPassword(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      width: MediaQuery.of(context).size.width,
      child: TextButton(
          onPressed: () {
            context.toPage(ForgotPasswordView());
          },
          child: const Text(
            "Forgot password?",
            style: TextStyle(color: Colors.grey, fontSize: 16.0),
          )),
    ).paddingSymmetric(horizontal: 15.0);
  }

  buttonsArea(LoginProvider lp, BuildContext context) {
    return Column(
      children: [
        signInButton(lp),
        goLoginPage(context),
        registerOptionsInfo(),
        googleButton(lp),
      ],
    );
  }

  signInButton(LoginProvider lp) {
    return AuthButton(
      onPressed: () => lp.loginEmail(),
      buttonLabel: "Sign in",
    );
  }

  goLoginPage(BuildContext context) {
    return TextButton(
        onPressed: (() {
          context.toPage(RegisterView());
        }),
        child: const Text(
          "Don't have an account? Sign-up",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ));
  }

  registerOptionsInfo() {
    return Row(children: const <Widget>[
      Expanded(
          child: Divider(
        indent: 30.0,
        endIndent: 15.0,
      )),
      Text("Or login with"),
      Expanded(
          child: Divider(
        indent: 15.0,
        endIndent: 30.0,
      )),
    ]).paddingSymmetric(vertical: 15.0);
  }

  googleButton(LoginProvider lp) {
    return IconButton(
      onPressed: () => lp.signInWithGoogle(),
      icon: Icon(
        FontAwesomeIcons.google,
        color: kSecondaryColor,
        size: 30.0,
      ),
    ).paddingSymmetric(vertical: 10).center;
  }
}
