import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:se_to_do/splash_screen.dart';
import 'package:se_to_do/utils/const.dart';
import 'package:se_to_do/widget/circularprogress.dart';
import 'package:se_to_do/widget/fab_buton.dart';
import 'package:se_to_do/widget/gridlist_home.dart';
import '../provider/home_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ChangeNotifierProvider<HomeProvider>(
        create: (context) => HomeProvider(),
        builder: (context, child) {
          return Consumer<HomeProvider>(builder: (context, hp, child) {
            return Scaffold(
              body: hp.isLoading
                  ? const Circular()
                  : SafeArea(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 25.0),
                              child: Image.asset(
                                "assets/logo.png",
                                width: 100.0,
                              ),
                            ),
                            hp.isLoading
                                ? const Circular()
                                : const GridListHome()
                          ],
                        ),
                      ),
                    ),
              floatingActionButton: FabButton(() async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil<void>(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SplashScreen()),
                  ModalRoute.withName('/'),
                );
              }, FontAwesomeIcons.rightFromBracket,
                  ProjectColors.fabButonColor),
            );
          });
        });
  }
}
