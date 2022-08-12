// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
// import 'dart:async';
import 'package:photofy/src/ui/configs/ScreenSizeConfig.dart';
import 'package:photofy/src/ui/configs/Theme.dart';
import 'package:photofy/src/ui/screens/UploadDocuments.dart';

import 'SignInPage.dart';

class VerifyNumber extends StatefulWidget {
  static const routeName = '/VerifyNumber';

  @override
  _VerifyNumberState createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  late TextEditingController otpController = TextEditingController();
  bool hasError = false;
  String currentText = "";

  Widget otpField(double height) {
    return Container(
      // width: ScreenSizeConfig.safeBlockHorizontal * 85,
        height: height,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
        child: PinCodeTextField(
          // backgroundColor: Colors.grey,

          appContext: context,
          pastedTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          length: 4,
          obscureText: false,
          animationType: AnimationType.fade,

          pinTheme: PinTheme(
            shape: PinCodeFieldShape.underline,
            activeColor: Colors.grey[300],
            inactiveColor: Colors.grey[300],
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 50,
            selectedColor: Colors.grey[300],
            selectedFillColor: Colors.grey[300],
            activeFillColor: Colors.grey[300],
            inactiveFillColor: Colors.grey[300],
          ),
          // backgroundColor: Colors.white,
          cursorColor: Colors.black,
          animationDuration: Duration(milliseconds: 300),
          enableActiveFill: false,
          controller: otpController,
          keyboardType: TextInputType.number,

          onCompleted: (v) {
            print("Completed");
            setState(() {
              currentText = v;
            });
          },
          onChanged: (value) {
            print(value);
            // setState(() {
            //   currentText = value;
            // });
          },
          beforeTextPaste: (text) {
            print("Allowing to paste $text");
            return true;
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig().init(context);
    var screenSizeWidth = ScreenSizeConfig.safeBlockHorizontal * 100;
    var screenSizeHeight = ScreenSizeConfig.safeBlockVertical * 100;
    ScreenSizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        // padding: EdgeInsets.fromLTRB(50, 20, 35, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(height: screenSizeHeight * 0.1),
            Container(
              width: screenSizeWidth * 0.4,
              height: screenSizeHeight * 0.1,
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //       image: AssetImage('assets/images/Weell_logo1.png'),
              //       fit: BoxFit.contain),
              // ),
               child: Text('Photofy',
                  style: theme.textTheme.headline1?.merge(TextStyle(
                    color: theme.primaryColor,
                  ))
              ),
            ),
            Container(height: screenSizeHeight * 0.1),
            Container(
              child: Text(
                'Verify Your Mobile Number',
                style: theme.textTheme.headline6?.merge(
                  TextStyle(
                    color: Colors.black,
                    // fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              // height: ScreenSizeConfig.safeBlockVertical * 2.8,
              width: screenSizeWidth * 0.85,
            ),
            SizedBox(height: 5),
            Container(
              child: Text(
                'Enter the OTP Number received on your Phone',
                style: theme.textTheme.bodyText1?.merge(
                  TextStyle(
                    color: Colors.grey,
                    // fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              // height: ScreenSizeConfig.safeBlockVertical * 2.8,
              width: screenSizeWidth * 0.85,
            ),
            SizedBox(height: 15),
            Stack(children: [
              Container(
                width: screenSizeWidth,
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 60,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              otpField(70)
            ]),
            SizedBox(
              height: 5,
            ),
            Container(
              width: screenSizeWidth * 0.85,
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                'Resend OTP',
                style: theme.textTheme.bodyText2?.merge(
                  TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenSizeHeight * 0.27,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, UploadDocuments.routeName);
              },
              child: Container(
                height: 50,
                width: screenSizeWidth * 0.55,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Create',
                    style: theme.textTheme.headline5?.merge(TextStyle(
                      color: Colors.white,
                    )),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenSizeHeight * 0.05,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, SignInPage.routeName);
              },
              child: Text(
                'Already have an account? Sign-in',
                style: theme.textTheme.bodyText1?.merge(
                  TextStyle(
                    color: Colors.grey,
                    // fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenSizeHeight * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
