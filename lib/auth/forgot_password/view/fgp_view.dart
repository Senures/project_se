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
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                                color: Colors.white,
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
                                "Forgot password",
                                style: TextStyle(
                                    color: kTextColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25.0, vertical: 15.0),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "E-mail",
                                      style: TextStyle(
                                          fontSize: 19.0,
                                          fontWeight: FontWeight.bold,
                                          color: kTextColor),
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kTextColor),
                                          ),
                                          hintText: "Your email id"),
                                      cursorColor: kTextColor,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter valid email';
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
                                  child: const Text("Submit",
                                      style: ProjectTextStyles.sign),
                                ),
                              ),
                            ),
                          ],
                        ))));
          });
        });
  }
}
