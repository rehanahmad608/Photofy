import 'package:flutter/material.dart';
// import 'dart:html';
// import 'dart:io';
import 'package:photofy/src/ui/configs/ScreenSizeConfig.dart';
import 'package:photofy/src/ui/configs/Theme.dart';
// import 'package:lottie/lottie.dart';
import 'dart:async';
import 'package:photofy/src/ui/configs/local-storage.dart';
import 'package:photofy/src/ui/screens/ChooseSigninSignUp.dart';
import 'package:photofy/src/ui/screens/GuideScreen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash-screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // ignore: unused_field
  late Timer _timer;
  int _start = 3;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
    // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

  @override
  void initState() {
    // startTimer();
    super.initState();
    initialize().then((e) {
      setState(() {
        try {
          if (Storage.getValue("guideScreensViewed") == null) {
            Storage.setValue("guideScreensViewed", "false");
          }
        } catch (e) {
          Storage.setValue("guideScreensViewed", "false");
        }
      });
    });
    Future.delayed(const Duration(seconds: 3), () {
      //conditional navigation change
      if (Storage.getValue("guideScreensViewed") == "false") {
        Storage.setValue("guideScreensViewed", "true");

        Navigator.pushReplacementNamed(context, GuideScreen.routeName);
      } else {
        Navigator.pushReplacementNamed(context, ChooseSigninSignUp.routeName);
      }
    });
  }

  initialize() async {
    await Storage.initialize();
  }

  @override
  void dispose() {
    // _timer.cancel();
    super.dispose();
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

              child: Image.asset('assets/images/SplashScreen.jpg',
                  fit: BoxFit.cover),
              // child: Lottie.asset('assets/images/splashScreen.json',
              //     fit: BoxFit.cover),
            ),
            // Container(
            //   height: screenSizeHeight * 1.2,
            //   width: screenSizeWidth,

            //   child: Image.asset('assets/images/weell background 2.png',
            //       fit: BoxFit.cover),
            //   // child: Lottie.asset('assets/images/splashScreen.json',
            //   //     fit: BoxFit.cover),
            // ),
            Container(
              width: ScreenSizeConfig.safeBlockHorizontal*100,
              height: screenSizeHeight * 1.2,
              alignment: AlignmentDirectional.center,
              child: Container(
                alignment: Alignment.topCenter,
                width: screenSizeWidth * 0.6,
                height: screenSizeHeight * 0.45,
                child: Text('Photofy',
                style: theme.textTheme.headline1?.merge(TextStyle(
                  color: Colors.white,
                ))
                ),
              ),
            ),
          ],
        ),
        // ),
      );
  }
}
