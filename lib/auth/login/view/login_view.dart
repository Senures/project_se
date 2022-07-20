import 'package:clippy_flutter/diagonal.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:se_to_do/auth/login/provider/login_provider.dart';
import 'package:se_to_do/auth/register/view/register_view.dart';
import 'package:se_to_do/auth/forgot_password/view/fgp_view.dart';
import 'package:se_to_do/style/app_text.dart';
import 'package:se_to_do/style/app_textstyle.dart';
import 'package:se_to_do/style/colors.dart';
import 'package:se_to_do/widget/animation.dart';
import 'package:se_to_do/widget/circularprogress.dart';

import '../../../style/image.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Diagonal(
                                  clipHeight: 50.0,
                                  axis: Axis.horizontal,
                                  position: DiagonalPosition.BOTTOM_LEFT,
                                  child: GestureDetector(
                                    child: Container(
                                      color: kSecondaryColor,
                                      width: size.width,
                                      height: size.height * 0.25,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0, vertical: 10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SafeArea(
                                              child: IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
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
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 15.0),
                                  child: Text(
                                    "Log-in",
                                    style: TextStyle(
                                        color: kTextColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 38.0),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "E-mail",
                                        style: TextStyle(
                                            fontSize: 19.0,
                                            fontWeight: FontWeight.bold,
                                            color: kTextColor),
                                      ),
                                      TextFormField(
                                        controller: lp.emailcontroller,
                                        cursorColor: kTextColor,
                                        decoration: InputDecoration(
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: kTextColor),
                                            ),
                                            hintText: "Your email"),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please fill this field';
                                          } else if (!value.contains("@")) {
                                            return "Please enter valid email";
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 15.0),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Password",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19.0,
                                              color: kTextColor),
                                        ),
                                        TextFormField(
                                          controller: lp.passwordcontroller,
                                          cursorColor: kTextColor,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please fill this field';
                                            } else if (value.length <= 5) {
                                              return "Password must be at least 6 characters";
                                            }
                                            return null;
                                          },
                                          obscureText: lp.obscureText,
                                          decoration: InputDecoration(
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: kTextColor),
                                            ),
                                            hintText: "Password",
                                            suffixIcon: IconButton(
                                                onPressed: (() {
                                                  lp.setObscure();
                                                }),
                                                icon: lp.obscureText
                                                    ? const Icon(
                                                        Icons
                                                            .visibility_off_rounded,
                                                        color: Colors.grey,
                                                      )
                                                    : const Icon(
                                                        Icons.visibility,
                                                        color: kPrimaryColor)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Container(
                                    alignment: Alignment.topRight,
                                    width: MediaQuery.of(context).size.width,
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.push<void>(
                                              context,
                                              BouncyPageRoute(
                                                  widget: ForgotPassword()));
                                        },
                                        child: const Text(
                                          "Forgot password?",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16.0),
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        lp.loginEmail();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: kPrimaryColor,
                                        alignment: Alignment.center,
                                        elevation: 10,
                                        shadowColor: Colors.grey,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        minimumSize: Size(size.width * 0.6,
                                            size.height * 0.06), //////// HERE
                                      ),
                                      child: Text(ProjectText.signIn,
                                          style: ProjectTextStyles.sign),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: TextButton(
                                      onPressed: (() {
                                        Navigator.push<void>(
                                            context,
                                            BouncyPageRoute(
                                                widget: RegisterView()));
                                      }),
                                      child: const Text(
                                        "Don't have an account? Sign-up",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 16),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Row(children: const <Widget>[
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
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Container(
                                    width: size.width,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        FontAwesomeIcons.google,
                                        color: kPrimaryColor,
                                        size: 30.0,
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ),
            );
          });
        });
  }
}
