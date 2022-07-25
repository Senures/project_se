import 'package:flutter/material.dart';
import 'package:se_to_do/core/extensions/context_extension.dart';
import 'package:se_to_do/core/extensions/widget_helper_extension.dart';
import 'package:se_to_do/core/style/colors.dart';
import 'package:se_to_do/core/style/image.dart';
import 'package:se_to_do/pages/auth/register/view/register_view.dart';
import 'package:se_to_do/widget/diagonal_appbar.dart';

import '../login/view/login_view.dart';

class AuthRootView extends StatelessWidget {
  const AuthRootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        width: context.width,
        height: context.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildAppBar(context),
            buildWelcomeTitle(context),
            buildButtonArea(context)
          ],
        ),
      ),
    );
  }

  buildAppBar(BuildContext context) {
    return DiagonalAppBar(
      appBarheight: context.height * 0.55,
      diagonalHeight: 100.0,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0), color: kPrimaryColor),
        child: Image.asset(
          logoImg,
          width: 150.0,
        ),
      ).center,
    );
  }

  buildWelcomeTitle(BuildContext context) {
    return Container(
      height: context.width * 0.3,
      child: Column(
        children: const [
          Text(
            "Welcome to the",
            style: TextStyle(color: kLightColor, fontSize: 22.0),
          ),
          Text(
            "TASKEZ",
            style: TextStyle(
                color: kLightColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 5.0,
                fontSize: 50.0),
          ),
        ],
      ),
    );
  }

  buildButtonArea(BuildContext context) {
    return Container(
      height: context.height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [getStartedButton(context), signInButton(context)],
      ),
    );
  }

  getStartedButton(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: context.width,
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      height: context.height * 0.08,
      decoration: BoxDecoration(
          color: kLightColor, borderRadius: BorderRadius.circular(15.0)),
      child: const Text("Get started",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
            fontSize: 18.0,
          )),
    ).onTapWidget(
      () => context.toPage(RegisterView()),
    );
  }

  signInButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have account?",
          style: TextStyle(color: kLightColor, fontSize: 16.0),
        ),
        TextButton(
            onPressed: () => context.toPage(LoginView()),
            child: const Text(
              " Sign in",
              style: TextStyle(
                  color: kLightColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0),
            ))
      ],
    );
  }
}
