import 'package:clippy_flutter/diagonal.dart';
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
                                    onTap: () => Navigator.pushNamed(
                                        context, '/diagonal_demo'),
                                    child: Container(
                                      color: ProjectColors.kBlihgtPurple,
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
                                                    color: Colors.white,
                                                    size: 30.0,
                                                  )),
                                            ),
                                            SafeArea(
                                              child: Image.asset(
                                                "assets/images/tasks.png",
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
                                        color: ProjectColors.fixColor,
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
                                            color: ProjectColors.fixColor),
                                      ),
                                      TextFormField(
                                        controller: lp.emailcontroller,
                                        cursorColor: ProjectColors.fixColor,
                                        decoration: InputDecoration(
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      ProjectColors.fixColor),
                                            ),
                                            errorStyle: TextStyle(
                                                color:
                                                    ProjectColors.kBdarkPurple,
                                                fontSize: 14.0),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: ProjectColors
                                                      .kBdarkPurple),
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
                                              color: ProjectColors.fixColor),
                                        ),
                                        TextFormField(
                                           controller: lp.passwordcontroller,
                                          cursorColor: ProjectColors.fixColor,
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
                                              borderSide: BorderSide(
                                                  color:
                                                      ProjectColors.fixColor),
                                            ),
                                            /*   errorStyle: TextStyle(
                                                color:
                                                    ProjectColors.signInColor,
                                                fontSize: 14.0),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: ProjectColors
                                                      .signInColor),
                                            ), */
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
                                                    : Icon(
                                                        Icons.visibility,
                                                        color: ProjectColors
                                                            .kBdarkPurple,
                                                      )),
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
                                            MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  const ForgotPassword(),
                                            ),
                                          );
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
                                        primary: ProjectColors.kBdarkPurple,
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
                                  //color: Colors.blue,
                                  child: TextButton(
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
                                      icon: Icon(
                                        FontAwesomeIcons.google,
                                        color: ProjectColors.kBdarkPurple,
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
 /*   Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 15.0),
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
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 20.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          vertical: 10.0),
                                                  child: Text(
                                                    ProjectText.password,
                                                    style: ProjectTextStyles
                                                        .textformlabel,
                                                  ),
                                                ),
                                                TextFormField(
                                                  cursorColor:
                                                      ProjectColors.fixColor,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
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
                                                                  color:
                                                                      Colors.grey,
                                                                )
                                                              : Icon(
                                                                  Icons.visibility,
                                                                  color: ProjectColors
                                                                      .signInColor,
                                                                )),
                                                      border: InputBorder.none,
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: ProjectColors
                                                                .enabledBorder),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: ProjectColors
                                                                .enabledBorder),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: ProjectColors
                                                                .fixColor),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                10),
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
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
                                                        BorderRadius.circular(
                                                            10.0)),
                                                minimumSize: Size(size.width * 0.8,
                                                    45.0), //////// HERE
                                              ),
                                              child: Text(ProjectText.signIn,
                                                  style: ProjectTextStyles.sign),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    //  color: Colors.amber,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
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
                                                  color: Colors.black,
                                                  fontSize: 16.0),
                                            )),
                                        Row(children: <Widget>[
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
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            width: size.width * 0.15,
                                            height: size.height * 0.05,
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
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    //color: Colors.blue,
                                    child: TextButton(
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
                                        )),
                                  ),
                                ) */