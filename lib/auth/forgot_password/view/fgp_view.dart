import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_to_do/auth/forgot_password/provider/fgp_provider.dart';
import 'package:se_to_do/auth/login/login_view.dart';

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
              appBar: AppBar(
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
              ),
              body: Container(
                  width: size.width,
                  height: size.height,
                  child: Form(
                    key: fgp.formGlobalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customText(size, "Email"),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
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
                            cursorColor:
                                const Color.fromARGB(255, 241, 152, 152),
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
                              primary: const Color(0XFF0C9463),
                              alignment: Alignment.center,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minimumSize:
                                  Size(size.width * 0.8, 45.0), //////// HERE
                            ),
                            child: const Text(
                              "Reset",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            );
          });
        });
  }
}
