import 'package:clippy_flutter/diagonal.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:se_to_do/utils/const.dart';
import 'package:se_to_do/widget/circularprogress.dart';

import '../provider/register_provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<RegisterProvider>(
        create: (context) => RegisterProvider(context),
        builder: (context, child) {
          return Consumer<RegisterProvider>(builder: (context, rp, child) {
            return Scaffold(
                backgroundColor: Colors.white,
                body: rp.isLoading
                    ? const LoadingCircular()
                    : Form(
                        key: rp.formGlobalKey,
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
                                                      FontAwesomeIcons
                                                          .angleLeft,
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
                                        vertical: 15.0, horizontal: 15.0),
                                    child: Text(
                                      "Register",
                                      style: TextStyle(
                                          color: ProjectColors.fixColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 38.0),
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
                                            "E-mail",
                                            style: TextStyle(
                                                fontSize: 19.0,
                                                fontWeight: FontWeight.bold,
                                                color: ProjectColors.fixColor),
                                          ),
                                          TextFormField(
                                            controller: rp.emailcontroller,
                                            cursorColor: ProjectColors.fixColor,
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: ProjectColors
                                                          .fixColor),
                                                ),
                                                hintText: "Your email"),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
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
                                            controller: rp.passwordcontroller,
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
                                            obscureText: rp.obscureText,
                                            decoration: InputDecoration(
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color:
                                                        ProjectColors.fixColor),
                                              ),
                                              hintText: "Password",
                                              suffixIcon: IconButton(
                                                  onPressed: (() {
                                                    rp.setObscure();
                                                  }),
                                                  icon: rp.obscureText
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
                                        vertical: 15.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          rp.registerWithEmail();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: ProjectColors.signUpColor,
                                          alignment: Alignment.center,
                                          elevation: 10,
                                          shadowColor: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          minimumSize: Size(size.width * 0.6,
                                              size.height * 0.06), //////// HERE
                                        ),
                                        child: Text(ProjectText.signUp,
                                            style: ProjectTextStyles.sign),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
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
                                  Container(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
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
                        /* Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 15.0),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
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
                                        TextFormField(
                                            cursorColor: ProjectColors.fixColor,
                                            controller: rp.emailcontroller,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter some text';
                                              } else if (!value.contains("@")) {
                                                return "Please enter valid email";
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                                //  prefixIcon:prefixIcon ,
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1,
                                                      color: Colors.black),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),

                                                // labelText: 'Enter something',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1,
                                                      color: ProjectColors
                                                          .enabledBorder),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1,
                                                      color: ProjectColors
                                                          .enabledBorder),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1,
                                                      color: ProjectColors
                                                          .fixColor),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                )))
                                      ],
                                    ),
                                    Column(
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
                                          obscureText: rp.obscureText,
                                          controller: rp.passwordcontroller,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter some text';
                                            } else if (value.length <= 5) {
                                              return "Password must be at least 6 characters";
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                  onPressed: (() {
                                                    rp.setObscure();
                                                  }),
                                                  icon: rp.obscureText
                                                      ? const Icon(
                                                          Icons
                                                              .visibility_off_rounded,
                                                          color: Colors.grey,
                                                        )
                                                      : Icon(
                                                          Icons.visibility,
                                                          color: ProjectColors
                                                              .signUpColor,
                                                        )),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Colors.black),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
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
                                              disabledBorder:
                                                  OutlineInputBorder(
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
                                    Container(
                                      alignment: Alignment.center,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          rp.registerWithEmail();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: ProjectColors.signUpColor,
                                          alignment: Alignment.center,
                                          elevation: 10,
                                          shadowColor: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          minimumSize: Size(size.width * 0.8,
                                              45.0), //////// HERE
                                        ),
                                        child: const Text(
                                          "Sign up",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  // color: Colors.blue,
                                  child: Column(
                                    children: [
                                      Row(children: const <Widget>[
                                        Expanded(
                                            child: Divider(
                                          color: Colors.black,
                                          indent: 30.0,
                                          endIndent: 15.0,
                                        )),
                                        Text("OR"),
                                        Expanded(
                                            child: Divider(
                                          color: Colors.black,
                                          indent: 15.0,
                                          endIndent: 30.0,
                                        )),
                                      ]),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20.0),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                            width: size.width * 0.15,
                                            height: size.height * 0.05,
                                            decoration: BoxDecoration(
                                                color:
                                                    ProjectColors.signUpColor,
                                                borderRadius:
                                                    BorderRadius.circular(8.0)),
                                            child: const Icon(
                                              FontAwesomeIcons.google,
                                              color: Colors.white,
                                              size: 15.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )  */
                      ));
          });
        });
  }
}
