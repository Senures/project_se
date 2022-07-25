import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:se_to_do/core/extensions/context_extension.dart';
import 'package:se_to_do/core/extensions/widget_helper_extension.dart';
import 'package:se_to_do/widget/circularprogress.dart';
import 'package:se_to_do/widget/empty_list_widget.dart';
import 'package:se_to_do/widget/add_button.dart';
import 'package:se_to_do/widget/gridlist_home.dart';
import 'package:se_to_do/widget/to_do_dialog.dart';
import '../../../core/style/colors.dart';
import '../../../core/style/image.dart';
import '../../splash_screen/splash_screen.dart';
import '../provider/home_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var globalKey = GlobalKey();
  double paddingHeight = 0.0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (globalKey.currentContext != null) {
        paddingHeight = globalKey.currentContext!.size!.height;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
        create: (context) => HomeProvider(),
        builder: (context, child) {
          return Consumer<HomeProvider>(builder: (context, hp, child) {
            return Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildAppBar(),
                        buildBody(hp),
                      ],
                    ),
                  ),
                ),
                floatingActionButton: buildFabButton(hp));
          });
        });
  }

  buildAppBar() {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryColor,
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 8.0, offset: Offset(0, 5))
          ],
          borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          appBarLogo(),
          appBarTitle(),
        ],
      ).paddingAll(padding: 10.0),
    ).paddingAll(padding: 15.0);
  }

  appBarLogo() {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryColor,
          boxShadow: const [
            BoxShadow(color: Colors.white12, blurRadius: 1.0, spreadRadius: 1.0)
          ],
          borderRadius: BorderRadius.circular(10.0)),
      padding: const EdgeInsets.all(10.0),
      child: Image.asset(
        logoImg,
        width: 45.0,
      ),
    );
  }

  appBarTitle() {
    return Container(
      width: context.width * 0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text.rich(
            TextSpan(
                text: "Hey,\n",
                style: TextStyle(
                    color: kLightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),
                children: [
                  TextSpan(
                      text: "Welcome",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 20.0))
                ]),
          ),
          signOutButton()
        ],
      ),
    );
  }

  signOutButton() {
    return TextButton(
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          context.toPushAndRemove(SplashScreen());
        },
        child: const Text(
          "Sign out",
          style: TextStyle(color: kLightColor, fontSize: 17.0),
        ));
  }

  buildBody(HomeProvider hp) {
    return Container(
      width: context.width,
      height: context.height - paddingHeight - AppBar().preferredSize.height,
      child: hp.isLoading
          ? const LoadingCircular()
          : hp.todolist.isEmpty
              ? EmptyListWidget( messsage: "To do list is empty",)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    allList(),
                    GridListHome(hp: hp),
                  ],
                ),
    );
  }

  allList() {
    return Text(
      "Your all to do list",
      style: TextStyle(
          color: Colors.grey.shade500,
          fontWeight: FontWeight.bold,
          fontSize: 20.0),
    ).paddingSymmetric(horizontal: 15.0);
  }

  buildFabButton(HomeProvider hp) {
    return AddingButton(() {
      hp.clearDialaog();
      toDocreateDialog(context, hp);
    }, FontAwesomeIcons.plus, kPrimaryColor);
  }
}
