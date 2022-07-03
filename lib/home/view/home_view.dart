import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:se_to_do/splash_screen.dart';
import 'package:se_to_do/utils/const.dart';
import 'package:se_to_do/widget/circularprogress.dart';
import 'package:se_to_do/widget/fab_buton.dart';
import 'package:se_to_do/widget/gridlist_home.dart';
import 'package:se_to_do/widget/to_do_dialog.dart';
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
                // backgroundColor: ProjectColors.kBdarkPurple,
                body: hp.isLoading
                    ? const LoadingCircular()
                    : SafeArea(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      color: ProjectColors.kBdarkPurple,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: ProjectColors.kBdarkPurple,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: ProjectColors
                                                      .kBlihgtPurple,
                                                  blurRadius: 15.0,
                                                  spreadRadius: 5.0)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.asset(
                                          "assets/images/tasks.png",
                                          //color: Colors.white,
                                          width: 45.0,
                                        ),
                                      ),
                                      Container(
                                        width: size.width * 0.6,
                                        //height: size.height * 0.03,
                                        //color: Colors.white,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text.rich(TextSpan(
                                                text: "Hey,\n",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25.0),
                                                children: [
                                                  TextSpan(
                                                      text: "Welcome",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 20.0))
                                                ])),
                                            TextButton(
                                                onPressed: () async {
                                                  await FirebaseAuth.instance
                                                      .signOut();
                                                  Navigator.pushAndRemoveUntil<
                                                      void>(
                                                    context,
                                                    MaterialPageRoute<void>(
                                                        builder: (BuildContext
                                                                context) =>
                                                            const SplashScreen()),
                                                    ModalRoute.withName('/'),
                                                  );
                                                },
                                                child: const Text(
                                                  "Sign out",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15.0),
                                                ))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              /* Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                  "Your all to do list",
                                  style: TextStyle(
                                      color: ProjectColors.fixColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0),
                                ),
                              ), */
                              hp.isLoading
                                  ? const LoadingCircular()
                                  : hp.todolist.isNotEmpty
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15.0),
                                              child: Text(
                                                "Your all to do list",
                                                style: TextStyle(
                                                    color: Colors.grey.shade500,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20.0),
                                              ),
                                            ),
                                            const GridListHome(),
                                          ],
                                        )
                                      : Container(
                                          height: size.height * 0.4,
                                          //burda yükseliği  elle verdim tekrar bakıcam
                                          alignment: Alignment.bottomCenter,
                                          child: const Text(
                                            "To do list is empty",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 30.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                            ],
                          ),
                        ),
                      ),
                floatingActionButton: FabButton(() {
                  hp.clearDialaog();
                  toDocreateDialog(context, hp);
                }, FontAwesomeIcons.plus, ProjectColors.kBdarkPurple)
                /*  floatingActionButton: FabButton(() async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil<void>(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SplashScreen()),
                  ModalRoute.withName('/'),
                );
              }, FontAwesomeIcons.rightFromBracket,
                  ProjectColors.fabButonColor), */
                );
          });
        });
  }
}
