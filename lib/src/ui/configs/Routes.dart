import 'package:flutter/cupertino.dart';
import 'package:photofy/src/ui/screens/SplashScreen.dart';
import 'package:photofy/src/ui/screens/GuideScreen.dart';
import 'package:photofy/src/ui/screens/ChooseSigninSignUp.dart';
import 'package:photofy/src/ui/screens/SignInPage.dart';
import 'package:photofy/src/ui/screens/root_app.dart';
import 'package:photofy/src/ui/screens/HomeScreen.dart';
import 'package:photofy/src/ui/screens/SignUpPage.dart';
import 'package:photofy/src/ui/screens/ConfirmEmail.dart';
import 'package:photofy/src/ui/screens/VerifyNumberScreen.dart';
import 'package:photofy/src/ui/screens/UploadDocuments.dart';



final Map<String, Widget Function(BuildContext)> routes = {
  GuideScreen.routeName: (ctx) => GuideScreen(),
  SplashScreen.routeName: (ctx) => SplashScreen(),
  ChooseSigninSignUp.routeName: (ctx) => ChooseSigninSignUp(),
  SignInPage.routeName: (ctx) => SignInPage(),
  RootApp.routeName: (ctx) => RootApp(),
  HomeScreen.routeName: (ctx) => HomeScreen(),
      SignUpPage.routeName: (ctx) => SignUpPage(),
       ConfirmEmail.routeName: (ctx) => ConfirmEmail(),
      VerifyNumber.routeName: (ctx) => VerifyNumber(),
      UploadDocuments.routeName: (ctx) => UploadDocuments(),

};
