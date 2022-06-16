import 'package:flutter/material.dart';
import 'package:se_to_do/auth/login/login_view.dart';
import 'package:se_to_do/auth/register/view/register_view.dart';
import 'package:se_to_do/widget/root_button.dart';

class RootPageView extends StatelessWidget {
  const RootPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              width: 150.0,
            ),
            const SizedBox(
              height: 50.0,
            ),
            RootButton(
                ontap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const LoginView(),
                    ),
                  );
                },
                text: "Sign in",
                color: const Color(0xff0C9463)),
            RootButton(
                ontap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const RegisterView(),
                    ),
                  );
                },
                text: "Sign up",
                color: const Color(0xffF5BA47))
          ],
        ),
      ),
    );
  }
}
