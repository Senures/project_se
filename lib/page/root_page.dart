import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:se_to_do/auth/login/view/login_view.dart';
import 'package:se_to_do/auth/register/view/register_view.dart';
import 'package:se_to_do/utils/const.dart';
import 'package:se_to_do/widget/root_button.dart';

class RootPageView extends StatelessWidget {
  const RootPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ProjectColors.kBdarkPurple,
      //Color(0xff7e6be8),
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
                onTap: () => Navigator.pushNamed(context, '/diagonal_demo'),
                child: Container(
                  color: ProjectColors.kBlihgtPurple,
                  width: size.width,
                  height: size.height * 0.55,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: ProjectColors.kBdarkPurple),
                      child: Image.asset(
                        "assets/images/tasks.png",
                        width: 150.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: size.width * 0.3,
              // color: Colors.red,
              child: Column(
                children: const [
                  Text(
                    "Welcome to the",
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                  Text(
                    "TASKEZ",
                    style: TextStyle(
                        color: Colors.white,
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
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const RegisterView(),
                  ),
                );
              },
              child: Container(
                height: size.height * 0.2,
                //color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 15.0),
                      height: size.height * 0.08,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Text("Get started",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ProjectColors.kBdarkPurple,
                            fontSize: 18.0,
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have account?",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const LoginView(),
                                ),
                              );
                            },
                            child: const Text(
                              " Sign in",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )
            /*  RootButton(
                ontap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const LoginView(),
                    ),
                  );
                },
                text: ProjectText.signIn,
                color: ProjectColors.signInColor),
            RootButton(
                ontap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const RegisterView(),
                    ),
                  );
                },
                text: ProjectText.signUp,
                color: ProjectColors.signUpColor) */
          ],
        ),
      ),
    );
  }
}
