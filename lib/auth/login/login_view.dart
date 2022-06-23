import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:se_to_do/auth/login/provider/login_provider.dart';
import 'package:se_to_do/auth/register/view/register_view.dart';
import 'package:se_to_do/auth/forgot_password/view/fgp_view.dart';
import 'package:se_to_do/utils/const.dart';
import 'package:se_to_do/widget/circularprogress.dart';

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
              backgroundColor: Colors.white,
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: ProjectColors.fixColor,
                ),
                //backgroundColor: const Color(0xff3581B8),
                title: Text(
                  ProjectText.appbarl,
                  style: TextStyle(
                    color: ProjectColors.fixColor,
                  ),
                ),
                centerTitle: true,
                elevation: 0.0,
              ),
              body: lp.isLoading
                  ? const Circular()
                  : SingleChildScrollView(
                      child: Form(
                          key: lp.formGlobalKey,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Text(
                                          ProjectText.email,
                                          style:
                                              ProjectTextStyles.textformlabel,
                                        ),
                                      ),
                                      // customText(size, "E-mail"),
                                      TextFormField(
                                        cursorColor: ProjectColors.fixColor,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          } else if (!value.contains("@")) {
                                            return "Please enter valid email";
                                          }
                                          return null;
                                        },
                                        controller: lp.emailcontroller,
                                        decoration: InputDecoration(
                                            //  prefixIcon:prefixIcon ,
                                            border: InputBorder.none,

                                            // labelText: 'Enter something',
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: ProjectColors
                                                      .enabledBorder),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: ProjectColors
                                                      .enabledBorder),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color:
                                                      ProjectColors.fixColor),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Text(
                                          ProjectText.password,
                                          style:
                                              ProjectTextStyles.textformlabel,
                                        ),
                                      ),
                                      TextFormField(
                                        cursorColor: ProjectColors.fixColor,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          } else if (value.length <= 5) {
                                            return "Password must be at least 6 characters";
                                          }
                                          return null;
                                        },
                                        controller: lp.passwordcontroller,
                                        obscureText: lp.obscureText,
                                        decoration: InputDecoration(
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
                                                    : Icon(
                                                        Icons.visibility,
                                                        color: ProjectColors
                                                            .signInColor,
                                                      )),
                                            border: InputBorder.none,
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: ProjectColors
                                                      .enabledBorder),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: ProjectColors
                                                      .enabledBorder),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color:
                                                      ProjectColors.fixColor),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      lp.loginEmail();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: ProjectColors.signInColor,
                                      alignment: Alignment.center,
                                      elevation: 10,
                                      shadowColor: Colors.grey,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      minimumSize: Size(
                                          size.width * 0.8, 45.0), //////// HERE
                                    ),
                                    child: Text(ProjectText.signIn,
                                        style: ProjectTextStyles.sign),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push<void>(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              const ForgotPassword(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Forgot password",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16.0),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Row(children: <Widget>[
                                    Expanded(
                                        child: Divider(
                                      color: ProjectColors.fixColor,
                                      indent: 30.0,
                                      endIndent: 15.0,
                                    )),
                                    const Text("OR"),
                                    Expanded(
                                        child: Divider(
                                      color: ProjectColors.fixColor,
                                      indent: 15.0,
                                      endIndent: 30.0,
                                    )),
                                  ]),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 15.0),
                                    decoration: BoxDecoration(
                                        color: ProjectColors.signInColor,
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    child: const Icon(
                                      FontAwesomeIcons.google,
                                      color: Colors.white,
                                      size: 15.0,
                                    ),
                                  ),
                                ),
                                TextButton(
                                    onPressed: (() {
                                      Navigator.push<void>(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              const RegisterView(),
                                        ),
                                      );
                                    }),
                                    child: const Text(
                                      "Don't have an account? Sign up",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ))
                              ],
                            ),
                          )),
                    ),
            );
          });
        });
  }
}
