import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:se_to_do/auth/forgot_password/provider/fgp_provider.dart';
import 'package:se_to_do/utils/const.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ChangeNotifierProvider<ForgotProvider>(
        create: (context) => ForgotProvider(context),
        builder: (context, child) {
          return Consumer<ForgotProvider>(builder: (context, fgp, child) {
            return Scaffold(
                backgroundColor: Colors.white,
                /*  appBar: AppBar(
                  iconTheme: const IconThemeData(
                    color: Colors.black,
                  ),
                  //backgroundColor: const Color(0xff3581B8),
                  title: const Text(
                    "Forgot password",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  centerTitle: true,
                  elevation: 0.0,
                ), */
                body: Form(
                    key: fgp.formGlobalKey,
                    child: ListView(children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: ListView(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Diagonal(
                                clipHeight: 20.0,
                                axis: Axis.horizontal,
                                position: DiagonalPosition.BOTTOM_LEFT,
                                child: GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                      context, '/diagonal_demo'),
                                  child: Container(
                                    color:  ProjectColors.kBlihgtPurple,
                                    width: size.width,
                                    height: size.height * 0.22,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(
                                                FontAwesomeIcons.angleLeft,
                                                color: Colors.white,
                                                size: 30.0,
                                              )),
                                          Image.asset(
                                            "assets/images/tasks.png",
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
                                  "Forgot password",
                                  style: TextStyle(
                                      color: ProjectColors.fixColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35.0),
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
                                            hintText: "Your email id"),
                                        cursorColor: ProjectColors.fixColor,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          } else if (!value.contains("@")) {
                                            return "Please e-mail";
                                          }
                                          return null;
                                        },
                                        controller: fgp.emailcontroller,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      fgp.resetPassword();
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
                                    child: const Text("Submit",
                                        style: ProjectTextStyles.sign),
                                  ),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Back to login",
                                    style: TextStyle(
                                        fontSize: 17.0, color: Colors.grey),
                                  ))
                            ],
                          ))
                    ])));
          });
        });
  }
}
  /*   Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          width: size.width,
                          child: Text(
                            ProjectText.email,
                            style: ProjectTextStyles.textformlabel,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          showCursor: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else if (!value.contains("@")) {
                              return "Please e-mail";
                            }
                            return null;
                          },
                          cursorColor: const Color.fromARGB(255, 241, 152, 152),
                          controller: fgp.emailcontroller,
                          decoration: InputDecoration(
                              //  prefixIcon:prefixIcon ,
                              border: InputBorder.none,

                              // labelText: 'Enter something',
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: ProjectColors.enabledBorder),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton(
                          onPressed: () {
                            fgp.resetPassword();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: ProjectColors.fixColor,
                            alignment: Alignment.center,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            minimumSize:
                                Size(size.width * 0.8, 45.0), //////// HERE
                          ),
                          child: const Text(
                            "Reset",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ),
                      ), */