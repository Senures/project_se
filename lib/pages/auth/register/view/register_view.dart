import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:se_to_do/core/extensions/context_extension.dart';
import 'package:se_to_do/core/extensions/widget_helper_extension.dart';
import 'package:se_to_do/core/style/colors.dart';
import 'package:se_to_do/core/style/image.dart';
import 'package:se_to_do/widget/auth_button.dart';
import 'package:se_to_do/widget/auth_textformfield.dart';
import 'package:se_to_do/widget/circularprogress.dart';
import 'package:se_to_do/widget/diagonal_appbar.dart';
import '../provider/register_provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterProvider>(
        create: (context) => RegisterProvider(context),
        builder: (context, child) {
          return Consumer<RegisterProvider>(builder: (context, rp, child) {
            return Scaffold(
                backgroundColor: kLightColor,
                body: rp.isLoading
                    ? const LoadingCircular()
                    : SingleChildScrollView(
                        child: Form(
                          key: rp.formGlobalKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildDiagonalAppBar(context),
                                buildTitle(),
                                buildEmailandPassword(rp),
                                buttonsArea(rp)
                              ]),
                        ),
                      ));
          });
        });
  }

  buildDiagonalAppBar(BuildContext context) {
    return DiagonalAppBar(
      appBarheight: context.height * 0.25,
      diagonalHeight: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () => context.toPageBack(),
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
      ).paddingSymmetric(horizontal: 15.0, vertical: 10.0),
    );
  }

  buildTitle() {
    return Text(
      "Register",
      style: TextStyle(
          color: kTextColor, fontWeight: FontWeight.bold, fontSize: 38.0),
    ).paddingAll(padding: 15.0);
  }

  buildEmailandPassword(RegisterProvider rp) {
    return Column(
      children: [
        AuthTextField(
          controller: rp.emailcontroller,
          title: "E-mail",
          hintText: "Your email",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please fill this field';
            } else if (!value.contains("@")) {
              return "Please enter valid email";
            }
            return null;
          },
        ).paddingAll(padding: 15.0),
        AuthTextField(
          obscureText: rp.obscureText,
          controller: rp.passwordcontroller,
          title: "Password",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please fill this field';
            } else if (value.length <= 5) {
              return "Password must be at least 6 characters";
            }
            return null;
          },
          hintText: "Password",
          suffixIcon: IconButton(
              onPressed: (() {
                rp.setObscure();
              }),
              icon: rp.obscureText
                  ? const Icon(
                      Icons.visibility_off_rounded,
                      color: Colors.grey,
                    )
                  : const Icon(
                      Icons.visibility,
                      color: kSecondaryColor,
                    )),
        ).paddingAll(padding: 15.0)
      ],
    );
  }

  buttonsArea(RegisterProvider rp) {
    return Column(
      children: [
        signUpButton(rp),
        registerOptionsInfo(),
        googleButton(),
      ],
    );
  }

  signUpButton(RegisterProvider rp) {
    return AuthButton(
      onPressed: () => rp.registerWithEmail(),
      buttonLabel: "Sign up",
    );
  }

  registerOptionsInfo() {
    return Row(children: const <Widget>[
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
    ]).paddingSymmetric(vertical: 15.0);
  }

  googleButton() {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        FontAwesomeIcons.google,
        color: kSecondaryColor,
        size: 30.0,
      ),
    ).paddingSymmetric(vertical: 10).center;
  }
}
