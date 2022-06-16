import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:se_to_do/auth/login/provider/login_provider.dart';
import 'package:se_to_do/auth/register/view/register_view.dart';
import 'package:se_to_do/auth/forgot_password/view/fgp_view.dart';
import 'package:se_to_do/widget/textformfield.dart';

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
                iconTheme: const IconThemeData(
                  color: Colors.black,
                ),
                //backgroundColor: const Color(0xff3581B8),
                title: const Text(
                  "Sign in",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                centerTitle: true,
                elevation: 0.0,
              ),
              body: SingleChildScrollView(
                child: Form(
                  key: lp.formGlobalKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      customText(size, "E-mail"),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          showCursor: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else if (!value.contains("@")) {
                              return "Please enter valid email";
                            }
                            return null;
                          },
                          cursorColor: const Color.fromARGB(255, 241, 152, 152),
                          controller: lp.emailcontroller,
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
                      customText(size, "Password"),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          showCursor: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else if (value.length <= 5) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                          cursorColor: const Color.fromARGB(255, 241, 152, 152),
                          controller: lp.passwordcontroller,
                          obscureText: lp.obscureText,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: (() {
                                    lp.setObscure();
                                  }),
                                  icon: lp.obscureText
                                      ? const Icon(
                                          Icons.visibility_off_rounded,
                                          color: Colors.grey,
                                        )
                                      : const Icon(
                                          Icons.visibility,
                                          color:  Color(0XFF0C9463),
                                        )),
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
                            lp.loginEmail();
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
                            "Sign in",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
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
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                          )),
                      const SizedBox(
                        height: 15.0,
                      ),
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
                      const SizedBox(
                        height: 20.0,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          decoration: BoxDecoration(
                              color: const Color(0XFF0C9463),
                              borderRadius: BorderRadius.circular(8.0)),
                          child: const Icon(
                            FontAwesomeIcons.google,
                            color: Colors.white,
                            size: 15.0,
                          ),
                        ),
                      ),
                      /*  IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.google, color: Color(0XFF0C9463))), */
                      const SizedBox(
                        height: 100.0,
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
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ))
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
}

customText(Size size, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0),
    child: Container(
        alignment: Alignment.bottomLeft,
        width: size.width,
        height: size.height * 0.05,
        child: Text(
          text,
          style: const TextStyle(fontSize: 17.0),
          //textAlign: TextAlign.start,
        )),
  );
}
