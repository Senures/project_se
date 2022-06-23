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
                appBar: AppBar(
                  iconTheme: const IconThemeData(
                    color: Colors.black,
                  ),
                  //backgroundColor: const Color(0xff3581B8),
                  title: const Text(
                    "Sign up",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  centerTitle: true,
                  elevation: 0.0,
                ),
                body: rp.isLoading
                    ? const Circular()
                    : Form(
                        key: rp.formGlobalKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Center(
                            child: ListView(
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
                                        controller: rp.emailcontroller,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          } else if (!value.contains("@")) {
                                            return "Please enter valid email";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            //  prefixIcon:prefixIcon ,
                                            border: InputBorder.none,

                                            // labelText: 'Enter something',
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
                                        obscureText: rp.obscureText,
                                        controller: rp.passwordcontroller,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
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
                                            border: InputBorder.none,

                                            // labelText: 'Enter something',
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
                                      ElevatedButton(
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
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Row(children: const <Widget>[
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
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 15.0),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0, vertical: 15.0),
                                          decoration: BoxDecoration(
                                              color: ProjectColors.signUpColor,
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
                              ],
                            ),
                          ),
                        )));
          });
        });
  }
}
