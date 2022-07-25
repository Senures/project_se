import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:se_to_do/core/extensions/context_extension.dart';
import 'package:se_to_do/core/extensions/widget_helper_extension.dart';
import 'package:se_to_do/core/style/colors.dart';
import 'package:se_to_do/core/style/image.dart';
import 'package:se_to_do/pages/auth/forgot_password/provider/fgp_provider.dart';
import 'package:se_to_do/widget/auth_button.dart';
import 'package:se_to_do/widget/auth_textformfield.dart';
import 'package:se_to_do/widget/diagonal_appbar.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ForgotPasswordProvider>(
        create: (context) => ForgotPasswordProvider(context),
        builder: (context, child) {
          return Consumer<ForgotPasswordProvider>(
              builder: (context, fgp, child) {
            return Scaffold(
                backgroundColor: Colors.white,
                body: Form(
                    key: fgp.formGlobalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildDiagonalAppBar(context),
                        buildTitle(),
                        resetwithEmail(fgp),
                        submitButton(fgp),
                      ],
                    )));
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
                onPressed: () {
                  context.toPageBack();
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
      ).paddingSymmetric(horizontal: 15.0, vertical: 10.0),
    );
  }

  buildTitle() {
    return Text(
      "Forgot password",
      style: TextStyle(
          color: kTextColor, fontWeight: FontWeight.bold, fontSize: 38.0),
    ).paddingAll(padding: 15.0);
  }

  resetwithEmail(ForgotPasswordProvider fgp) {
    return AuthTextField(
      controller: fgp.emailcontroller,
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
    ).paddingAll(padding: 15.0);
  }

  submitButton(ForgotPasswordProvider fgp) {
    return AuthButton(
      onPressed: () => fgp.resetPassword(),
      buttonLabel: "Submit",
    );
  }
}
