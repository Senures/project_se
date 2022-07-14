import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:se_to_do/auth/login/view/login_view.dart';
import 'package:se_to_do/auth/register/view/register_view.dart';
import 'package:se_to_do/utils/const.dart';
import 'package:se_to_do/widget/animation.dart';

class RootPageView extends StatelessWidget {
  const RootPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Diagonal(
              clipHeight: 100.0,
              axis: Axis.horizontal,
              position: DiagonalPosition.BOTTOM_LEFT,
              child: GestureDetector(
                child: Container(
                  color: kSecondaryColor,
                  width: size.width,
                  height: size.height * 0.55,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: kPrimaryColor),
                      child: Image.asset(
                        logoImg,
                        width: 150.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: size.width * 0.3,
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
            ),
            GestureDetector(
              onTap: () {
                Navigator.push<void>(
                    context, BouncyPageRoute(widget: RegisterView()));
              },
              child: Container(
                height: size.height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 15.0),
                      height: size.height * 0.08,
                      decoration: BoxDecoration(
                          color: kLightColor,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: const Text("Get started",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                            fontSize: 18.0,
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have account?",
                          style: TextStyle(color: kLightColor, fontSize: 16.0),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push<void>(context,
                                  BouncyPageRoute(widget: LoginView()));
                            },
                            child: const Text(
                              " Sign in",
                              style: TextStyle(
                                  color: kLightColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
