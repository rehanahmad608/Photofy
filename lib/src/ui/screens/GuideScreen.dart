import 'package:flutter/material.dart';
// import 'dart:html';
// import 'dart:io';

// import 'package:lottie/lottie.dart';

// import 'dart:async';

import 'package:photofy/src/ui/configs/ScreenSizeConfig.dart';
import 'package:photofy/src/ui/configs/Theme.dart';
// import 'package:photofy/src/ui/configs/local-storage.dart';
import 'package:photofy/src/ui/screens/ChooseSigninSignUp.dart';
// import 'package:photofy/src/ui/screens/HomeScreen.dart';
// import 'package:photofy/src/ui/screens/SignUpPage.dart';

class GuideScreen extends StatefulWidget {
  static const routeName = '/guide-screen';
  @override
  _GuideScreenState createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  int switchGuide = 1;
  @override
  void initState() {
    // startTimer();
    super.initState();
    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.pushReplacementNamed(context, SignUpPage.routeName);
    // });
  }

  _languageChangeButton() {
    return TextButton(
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              Icons.language,
              color: Colors.black87,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 4),
              child: Text(
                'EN',
                style: theme.textTheme.headline6!
                    .merge(TextStyle(color: theme.primaryColor)),
              ),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    // _timer.cancel();
    super.dispose();
  }

  Widget skipNextButtonsBottomPane() {
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, ChooseSigninSignUp.routeName);
              },
              child: Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Center(
                  child: Text(
                    "Skip",
                    style: theme.textTheme.bodyText1?.merge(
                        TextStyle(color: photofyPurple, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: switchGuide == 1 ? Colors.white : Colors.grey[200],
                    // Colors.white
                    border: Border.all(
                        color: switchGuide == 1 ? photofyPurple : Colors.grey[200]!,
                        width: 2.5),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100.0),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: switchGuide == 2 ? Colors.white : Colors.grey[200],
                    // Colors.white
                    border: Border.all(
                        color: switchGuide == 2 ? photofyPurple : Colors.grey[200]!,
                        width: 2.5),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100.0),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: switchGuide == 3 ? Colors.white : Colors.grey[200],
                    // Colors.white
                    border: Border.all(
                        color: switchGuide == 3 ? photofyPurple : Colors.grey[200]!,
                        width: 2.5),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100.0),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: switchGuide == 4 ? Colors.white : Colors.grey[200],
                    // Colors.white
                    border: Border.all(
                        color: switchGuide == 4 ? photofyPurple : Colors.grey[200]!,
                        width: 2.5),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100.0),
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                setState(() {
                  switchGuide++;
                  if (switchGuide > 4) {
                    Navigator.pushReplacementNamed(
                        context, ChooseSigninSignUp.routeName);
                  }
                });
              },
              child: Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    "Next",
                    style: theme.textTheme.bodyText1?.merge(
                        TextStyle(color: photofyPurple, fontWeight: FontWeight.bold)),
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

    screenSwitchable(
         String title2, String imageUrl) {
      return Container(
          width: screenSizeWidth,
          height: screenSizeHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //SizedBox(height: ScreenSizeConfig.safeBlockVertical*10,),
              Stack(
                children: [
                  Container(
                    width: screenSizeWidth * 1,
                    height: screenSizeHeight * 0.84,
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.fill,
                      )),

                        Column(
                          children: [
                         SizedBox(height: screenSizeHeight*0.08,),
                            Container(
                              alignment: Alignment.center,
                              child:
                              Stack(
                                children: <Widget>[
                                  // Stroked text as border.
                                  Text(
                                    title2,
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 4
                                        ..color = photofyPurple,
                                    ),
                                  ),
                                  // Solid text as fill.
                                  Text(
                                    title2,
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )

                            ),
                          ],
                        ),

                ],
              ),
              // SizedBox(
              //   height: screenSizeHeight * 0.19,
              // ),
              // skipNextButtonsBottomPane(),
            ],
          ));
    }

    return
      // BlocListener<UserBloc, UserState>(
      //   listener: (context, state) {
      //     if (state is UserLoggedIn) {
      //     } else if (state is UserInitial) {
      //     }
      //   },
      //   child:
      Scaffold(
          appBar:
          PreferredSize(
            preferredSize: Size.fromHeight(40.0),
          child:
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: <Widget>[
              _languageChangeButton(),
            ],
          ),
          ),
          extendBody: true,
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              switchGuide == 1
                  ? screenSwitchable(
                  "AI Driven PhotoEditor",
                  'assets/images/guide1.jpeg')
                  : switchGuide == 2
                  ? screenSwitchable(

                  "Advanced Image Styling",

                  'assets/images/guide3.jpg')
                  : switchGuide == 3
                  ? screenSwitchable(

                  "Creative AR Filters",

                  'assets/images/guide2.jpg')
                  : screenSwitchable(

                  "Discover New Trends",

                  'assets/images/guide4.jpg'),
              Positioned(
                bottom: screenSizeHeight * 0.02,
                child: Container(
                    width: screenSizeWidth,
                    child: skipNextButtonsBottomPane()),
              )
            ],
          )

        // ),
      );
  }
}
