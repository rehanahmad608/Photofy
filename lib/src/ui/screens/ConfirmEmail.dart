// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photofy/src/ui/configs/Theme.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:photofy/src/bloc/User/user_bloc.dart';
import 'package:photofy/src/ui/configs/ScreenSizeConfig.dart';
// import 'package:photofy/src/ui/configs/Theme.dart';
// import 'package:photofy/src/ui/screens/ConfirmEmail.dart';
// import 'package:photofy/src/ui/screens/VerifyNumberScreen.dart';

import 'HomeScreen.dart';
import 'SignUpPage.dart';

class ConfirmEmail extends StatefulWidget {
  static const routeName = '/confirmemail-page';

  @override
  _ConfirmEmailState createState() => _ConfirmEmailState();
}

class _ConfirmEmailState extends State<ConfirmEmail> {
  final _formkey = GlobalKey<FormState>();
  FocusNode emailFocusNode = FocusNode(), passwordFocusNode = FocusNode();
  String email = '', phone = '', password = '';
  var defaulttext = TextStyle(color: Colors.black);

  var linktext = TextStyle(color: Colors.indigo);

  // bool _obscureText = true;
  // bool _valueCheckBox = false;
  // late bool _valueCheckBox;

  @override
  void initState() {
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig().init(context);
    var screenSizeWidth = ScreenSizeConfig.safeBlockHorizontal * 100;
    var screenSizeHeight = ScreenSizeConfig.safeBlockVertical * 100;

    // void submit() {
    //   emailFocusNode.unfocus();
    //   passwordFocusNode.unfocus();

    //   if (!_valueCheckBox) {
    //     // ScaffoldMessenger.of(context).showSnackBar(
    //     //     showSnackbar('Please accept the terms and conditions'));
    //   } else {
    //     if (_formkey.currentState!.validate()) {
    //       _formkey.currentState!.save();
    //       // final mobileNum = countryCode! + phone;
    //       // print(mobileNum);
    //       print('Submit');
    //       // BlocProvider.of<UserBloc>(context).add(
    //       //     Signup(email: mobileNum, phoneNumber: phone, password: password));
    //     }
    //   }
    // }

    // Widget submitButton() {
    //   return InkWell(
    //     onTap: submit,
    //     // () {
    //     //   Navigator.pushReplacementNamed(context, VerifyNumber.routeName);
    //     // },
    //     child: Container(
    //       height: 50,
    //       width: screenSizeWidth * 0.55,
    //       decoration: BoxDecoration(
    //         color: Colors.grey,
    //         borderRadius: BorderRadius.all(
    //           Radius.circular(15.0),
    //         ),
    //       ),
    //       child: Center(
    //         child: Text(
    //           'Sign In',
    //           style: theme.textTheme.headline5?.merge(TextStyle(
    //             color: Colors.white,
    //           )),
    //         ),
    //       ),
    //     ),
    //   );
    // }

    // Widget textFieldandTitlewithImageIcon(
    //     var screenSizeWidth,
    //     String title,
    //     String hintText,
    //     String icon,
    //     FocusNode focusNode,
    //     FocusNode nextFocusNode,
    //     String storingVariable) {
    //   return Container(
    //     width: screenSizeWidth * 0.85,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         //title
    //         Text(
    //           title,
    //           style: theme.textTheme.bodyText1?.merge(
    //               TextStyle(color: Colors.black, fontWeight: FontWeight.w300)),
    //         ),
    //         SizedBox(
    //           height: 10,
    //         ),

    //         Container(
    //             color: Colors.white,
    //             height: 55,
    //             // height: ScreenSizeConfig.safeBlockVertical * 7,
    //             // width: ScreenSizeConfig.safeBlockHorizontal * 75,
    //             // padding: EdgeInsets.all(1.0),
    //             child: TextFormField(
    //               textAlign: TextAlign.left,
    //               textInputAction: TextInputAction.next,
    //               focusNode: focusNode,
    //               keyboardType: TextInputType.name,
    //               style: theme.textTheme.bodyText1
    //                   ?.merge(TextStyle(fontWeight: FontWeight.normal)),
    //               onFieldSubmitted: (_) => nextFocusNode.requestFocus(),
    //               onSaved: (val) => email = val!,
    //               validator: (val) =>
    //                   val!.length < 3 ? 'Enter Valid Email' : null,
    //               decoration: InputDecoration(
    //                 contentPadding: EdgeInsets.fromLTRB(20, 27, 0, 0),
    //                 hintText: hintText,
    //                 hintStyle: TextStyle(color: Colors.grey[400]),
    //                 prefixIcon: Container(
    //                   padding: EdgeInsets.all(screenSizeWidth * 0.05),
    //                   child: Image.asset(icon, fit: BoxFit.contain),
    //                 ),
    //                 filled: true,
    //                 fillColor: Colors.grey[200],
    //                 enabledBorder: OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(18.0)),
    //                   borderSide: BorderSide(color: Colors.white12, width: 2),
    //                 ),
    //                 focusedBorder: OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(18.0)),
    //                   borderSide: BorderSide(color: Colors.white12, width: 2),
    //                 ),
    //               ),
    //             )),
    //       ],
    //     ),
    //   );
    // }

    // textFieldandTitleObscureOption(
    //     var screenSizeWidth,
    //     String title,
    //     String hintText,
    //     IconData icon,
    //     bool obscure,
    //     FocusNode focusNode,
    //     String storingVariable) {
    //   bool obs = obscure;
    //   return Container(
    //     width: screenSizeWidth * 0.85,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         //title
    //         Text(
    //           title,
    //           style: theme.textTheme.bodyText1?.merge(
    //               TextStyle(color: Colors.black, fontWeight: FontWeight.w300)),
    //         ),
    //         SizedBox(
    //           height: 10,
    //         ),
    //         Container(
    //             color: Colors.white,
    //             height: 55,
    //             width: screenSizeWidth * 0.85,
    //             // height: ScreenSizeConfig.safeBlockVertical * 7,
    //             // width: ScreenSizeConfig.safeBlockHorizontal * 75,
    //             // padding: EdgeInsets.all(1.0),
    //             child: TextFormField(
    //               textAlign: TextAlign.left,
    //               obscureText: _obscureText,
    //               textInputAction: TextInputAction.next,
    //               focusNode: focusNode,
    //               keyboardType: TextInputType.name,
    //               style: theme.textTheme.bodyText1
    //                   ?.merge(TextStyle(fontWeight: FontWeight.normal)),
    //               // onFieldSubmitted: (_) => submit,
    //               onSaved: (val) => password = val!,
    //               validator: (val) =>
    //                   val!.length < 3 ? 'Enter Valid Password' : null,
    //               decoration: InputDecoration(
    //                 contentPadding: EdgeInsets.fromLTRB(20, 22, 0, 0),
    //                 hintText: 'Your Password',
    //                 prefixIcon: Container(
    //                   padding: EdgeInsets.all(screenSizeWidth * 0.05),
    //                   child: Icon(Icons.lock_outline_rounded,
    //                       color: Colors.grey[400]),
    //                 ),
    //                 //
    //                 // hintStyle: TextStyle(color: Colors.grey),
    //                 suffixIcon: IconButton(
    //                   icon: Icon(
    //                     Icons.visibility,
    //                     color: Colors.grey[400],
    //                   ),
    //                   onPressed: () {
    //                     // print("Changing obscure");
    //                     setState(() {
    //                       if (_obscureText == true) {
    //                         _obscureText = false;
    //                       } else {
    //                         _obscureText = true;
    //                       }
    //                     });
    //                   },
    //                 ),
    //                 hintStyle: TextStyle(color: Colors.grey[400]),
    //                 // prefixIcon: Icon(icon),

    //                 filled: true,
    //                 fillColor: Colors.grey[200],
    //                 enabledBorder: OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(18.0)),
    //                   borderSide: BorderSide(color: Colors.white12, width: 2),
    //                 ),
    //                 focusedBorder: OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(18.0)),
    //                   borderSide: BorderSide(color: Colors.white12, width: 2),
    //                 ),
    //               ),
    //             ))
    //       ],
    //     ),
    //   );
    // }

    // socialLoginButton(String image, var navigation) {
    //   return InkWell(
    //     onTap: () {
    //       //nav
    //     },
    //     child: Container(
    //       height: ScreenSizeConfig.safeBlockVertical * 10,
    //       width: ScreenSizeConfig.safeBlockVertical * 10,
    //       padding: EdgeInsets.all(
    //         ScreenSizeConfig.safeBlockVertical * 2,
    //       ),
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.all(
    //           Radius.circular(10.0),
    //         ),
    //         boxShadow: [
    //           BoxShadow(
    //             color: Colors.grey,
    //             offset: Offset(0.0, 1.0), //(x,y)
    //             blurRadius: 3.0,
    //           ),
    //         ],
    //       ),
    //       child: Image.asset(
    //         image,
    //         fit: BoxFit.contain,
    //       ),
    //     ),
    //   );
    // }

    screenSwitchable(String title1, String title2, String title3) {
      return Container(
          width: screenSizeWidth,
          // height: screenSizeHeight * 1.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenSizeHeight * 0.1,
              ),
              Container(
                width: screenSizeWidth * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        title1,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headline3?.merge(TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Text(
                        title2,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headline2?.merge(TextStyle(
                            color: theme.primaryColor, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Text(
                        title3,
                        style: theme.textTheme.bodyText1?.merge(TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenSizeHeight * 0.05,
              ),
            ],
          ));
    }

    return Scaffold(
        body: BlocConsumer<UserBloc, UserState>(listener: (context, state) {
      if (state is UserRegistered) {
        if (state.confirmed == true) {
          BlocProvider.of<UserBloc>(context)
              .add(ConfirmedEmail(user: state.user));
          print("navigating to home screen");
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        }
      }
    }, builder: (context, state) {
      return SingleChildScrollView(
        // padding: EdgeInsets.fromLTRB(50, 20, 35, 20),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(height: screenSizeHeight * 0.1),
              Container(
                width: screenSizeWidth * 0.50,
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
              SizedBox(
                height: screenSizeHeight * 0.07,
              ),
              screenSwitchable(
                  "Your email is not confirmed.",
                  "To confirm your email",
                  "Click the 'Confirm Email' button below."),

              SizedBox(
                height: screenSizeHeight * 0.1,
              ),

              InkWell(
                onTap: () {
                  // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                  if (state is UserRegistered) {
                    print("state confirmed: ${state.confirmed}");
                    if (!state.confirmed) {
                      BlocProvider.of<UserBloc>(context).add(ConfirmingEmail(
                          email: state.user.getEmail,
                          //token: state.user.getToken,
                          user: state.user));
                    } else {
                      print(state.confirmed);
                    }
                  }
                  print(state);
                  print("state");
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
                      'Confirm Email',
                      style: theme.textTheme.headline5?.merge(TextStyle(
                        color: Colors.white,
                      )),
                    ),
                  ),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: Text(
              //     'Next',
              //     style: TextStyle(
              //       color: Colors.white,
              //     ),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //       primary: Colors.black12,
              //       padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(15.0),
              //       ),
              //       textStyle: TextStyle(
              //         fontSize: 18,
              //         letterSpacing: 1.2,
              //       )),
              //   //color: Colors.black38,
              // ),
              SizedBox(
                height: screenSizeHeight * 0.05,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, SignUpPage.routeName);
                },
                child: Text(
                  'Not a Member? Sign up Now!',
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
    }));
  }
}
