// import 'dart:html';
// import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lottie/lottie.dart';

// import 'dart:async';

import 'package:photofy/src/ui/configs/ScreenSizeConfig.dart';
import 'package:photofy/src/ui/configs/Theme.dart';
// import 'package:photofy/src/ui/screens/HomeScreen.dart';
import 'package:photofy/src/ui/screens/SignInPage.dart';
import 'package:photofy/src/ui/screens/SignUpPage.dart';
import 'package:photofy/src/ui/screens/root_app.dart';


class ChooseSigninSignUp extends StatefulWidget {
  static const routeName = '/choosesigninsignup-screen';
  @override
  _ChooseSigninSignUpState createState() => _ChooseSigninSignUpState();
}

class _ChooseSigninSignUpState extends State<ChooseSigninSignUp> {
  @override
  void initState() {
    // startTimer();
    super.initState();
    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.pushReplacementNamed(context, SignUpPage.routeName);
    // });
  }

  @override
  void dispose() {
    // _timer.cancel();
    super.dispose();
  }

  Widget signInSignUpButtons() {
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, SignInPage.routeName);
              },
              child: Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[
                      theme.primaryColor,
                      Colors.deepPurple,
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    "Sign In",
                    style: theme.textTheme.bodyText1?.merge(TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, SignUpPage.routeName);
              },
              child: Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: theme.textTheme.bodyText1?.merge(TextStyle(
                        color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig().init(context);
    var screenSizeHeight = ScreenSizeConfig.safeBlockVertical * 100;
    var screenSizeWidth = ScreenSizeConfig.safeBlockHorizontal * 100;

    return
      // BlocListener<UserBloc, UserState>(
      //   listener: (context, state) {
      //     if (state is UserLoggedIn) {
      //     } else if (state is UserInitial) {
      //     }
      //   },
      //   child:
      Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: screenSizeHeight * 1.2,
              width: screenSizeWidth,

              child: Image.asset('assets/images/SplashScreen2.jpg',
                  fit: BoxFit.cover),
              // child: Lottie.asset('assets/images/splashScreen.json',
              //     fit: BoxFit.cover),
            ),
            // Container(
            //   height: screenSizeHeight * 1.2,
            //   width: screenSizeWidth,

            //   child: Image.asset('assets/images/weell background 2.png',
            //       fit: BoxFit.cover),
            //   // child: Lottie.asset('assets/images/ChooseSigninSignUp.json',
            //   //     fit: BoxFit.cover),
            // ),
            Container(
                width: screenSizeWidth,
                height: screenSizeHeight * 1.2,
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenSizeHeight * 0.25,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      //color: theme.primaryColor,
                      width: screenSizeWidth * 0.5,
                      height: screenSizeHeight * 0.45,
                      child: Text('Photofy',
                      style: theme.textTheme.headline1?.merge(TextStyle(
                        color: Colors.white,
                      ))
                      ),
                    ),
                    SizedBox(
                      height: screenSizeHeight * 0.19,
                    ),
                    signInSignUpButtons()
                  ],
                )),
            Positioned(
              bottom: 10,
              left: (screenSizeWidth / 2) - 50,
              child: Container(
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, RootApp.routeName);
                  },
                  child: Container(
                    height: 35,
                    width: 100,
                    // decoration: BoxDecoration(
                    //   color: Colors.,
                    //   borderRadius: BorderRadius.all(
                    //     Radius.circular(10.0),
                    //   ),
                    // ),
                    child: Center(
                      child: Text(
                        "SKIP",
                        style: theme.textTheme.bodyText1?.merge(TextStyle(
                            color: Colors.white, fontWeight: FontWeight.normal)),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        // ),
      );
  }
}
