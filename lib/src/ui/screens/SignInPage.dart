// import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photofy/src/ui/screens/root_app.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:photofy/src/bloc/User/user_bloc.dart';
import 'package:photofy/src/ui/configs/ScreenSizeConfig.dart';
import 'package:photofy/src/ui/configs/Theme.dart';
import 'package:photofy/src/ui/screens/ForgotPasswordScreen.dart';
// import 'package:photofy/src/ui/screens/SignInPage.dart';
// import 'package:photofy/src/ui/screens/VerifyNumberScreen.dart';
// import 'package:photofy/src/ui/widgets/BufferScreen.dart';
import 'package:photofy/src/ui/widgets/SnackBar.dart';

// import 'ConfirmEmail.dart';
// import 'HomeScreen.dart';
import 'SignUpPage.dart';

class SignInPage extends StatefulWidget {
  static const routeName = '/signin-page';

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formkey = GlobalKey<FormState>();
  FocusNode emailFocusNode = FocusNode(), passwordFocusNode = FocusNode(), usernameFocusNode = FocusNode();
  String email = '', password = '', username = '';
  var defaulttext = TextStyle(color: Colors.black);

  var linktext = TextStyle(color: Colors.indigo);

  bool _obscureText = true;
  bool _valueCheckBox = true;
  // late bool _valueCheckBox;

  @override
  void initState() {
    usernameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    super.initState();
    print("In SignIn Screen");
  }

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig().init(context);
    var screenSizeWidth = ScreenSizeConfig.safeBlockHorizontal * 100;
    var screenSizeHeight = ScreenSizeConfig.safeBlockVertical * 100;

    void submit() {
      usernameFocusNode.unfocus();
      emailFocusNode.unfocus();
      passwordFocusNode.unfocus();

      if (!_valueCheckBox) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //     showSnackbar('Please accept the terms and conditions'));
      } else {
        if (_formkey.currentState!.validate()) {
          _formkey.currentState!.save();
          // final mobileNum = countryCode! + phone;
          // print(mobileNum);

          BlocProvider.of<UserBloc>(context)
              .add(Signin(username: username, password: password));
        }
      }
    }

    Widget submitButton() {
      return InkWell(
        onTap: submit,
        // () {
        //   Navigator.pushReplacementNamed(context, VerifyNumber.routeName);
        // },
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
              'Sign In',
              style: theme.textTheme.headline5?.merge(TextStyle(
                color: Colors.white,
              )),
            ),
          ),
        ),
      );
    }

    Widget textFieldandTitlewithImageIcon(
        var screenSizeWidth,
        String title,
        String hintText,
        String icon,
        FocusNode focusNode,
        FocusNode nextFocusNode,
        String storingVariable) {
      return Container(
        width: screenSizeWidth * 0.85,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title
            Text(
              title,
              style: theme.textTheme.bodyText1?.merge(
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300)),
            ),
            SizedBox(
              height: 10,
            ),

            Container(
                color: Colors.white,
                height: 55,
                // height: ScreenSizeConfig.safeBlockVertical * 7,
                // width: ScreenSizeConfig.safeBlockHorizontal * 75,
                // padding: EdgeInsets.all(1.0),
                child: TextFormField(
                  textAlign: TextAlign.left,
                  textInputAction: TextInputAction.next,
                  focusNode: focusNode,
                  keyboardType: TextInputType.name,
                  style: theme.textTheme.bodyText1
                      ?.merge(TextStyle(fontWeight: FontWeight.normal)),
                  onFieldSubmitted: (_) => nextFocusNode.requestFocus(),
                  onSaved: (val) => email = val!,
                  validator: (val) =>
                      val!.length < 3 ? 'Enter Valid Email' : null,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20, 27, 0, 0),
                    hintText: hintText,
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    prefixIcon: Container(
                      padding: EdgeInsets.all(screenSizeWidth * 0.045),
                      child: Image.asset(icon, fit: BoxFit.contain),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.white12, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.white12, width: 2),
                    ),
                  ),
                )),
          ],
        ),
      );
    }
     Widget usernametextFieldandTitlewithImageIcon(
        var screenSizeWidth,
        String title,
        String hintText,
        String icon,
        FocusNode focusNode,
        FocusNode nextFocusNode,
        String storingVariable) {
      return Container(
        width: screenSizeWidth * 0.85,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title
            Text(
              title,
              style: theme.textTheme.bodyText1?.merge(
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300)),
            ),
            SizedBox(
              height: 10,
            ),

            Container(
                color: Colors.white,
                height: 55,
                // height: ScreenSizeConfig.safeBlockVertical * 7,
                // width: ScreenSizeConfig.safeBlockHorizontal * 75,
                // padding: EdgeInsets.all(1.0),
                child: TextFormField(
                  textAlign: TextAlign.left,
                  textInputAction: TextInputAction.next,
                  focusNode: focusNode,
                  keyboardType: TextInputType.name,
                  style: theme.textTheme.bodyText1
                      ?.merge(TextStyle(fontWeight: FontWeight.normal)),
                  onFieldSubmitted: (_) => nextFocusNode.requestFocus(),
                  onSaved: (val) => username = val!,
                  validator: (val) =>
                      val!.length < 3 ? 'Enter Valid Username' : null,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20, 27, 0, 0),
                    hintText: hintText,
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    prefixIcon: Container(
                      padding: EdgeInsets.all(screenSizeWidth * 0.045),
                      child: Image.asset(icon, fit: BoxFit.contain),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.white12, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.white12, width: 2),
                    ),
                  ),
                )),
          ],
        ),
      );
    }


    textFieldandTitleObscureOption(
        var screenSizeWidth,
        String title,
        String hintText,
        IconData icon,
        bool obscure,
        FocusNode focusNode,
        String storingVariable) {
      // bool obs = obscure;
      return Container(
        width: screenSizeWidth * 0.85,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title
            Text(
              title,
              style: theme.textTheme.bodyText1?.merge(
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300)),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                color: Colors.white,
                height: 55,
                width: screenSizeWidth * 0.85,
                // height: ScreenSizeConfig.safeBlockVertical * 7,
                // width: ScreenSizeConfig.safeBlockHorizontal * 75,
                // padding: EdgeInsets.all(1.0),
                child: TextFormField(
                  textAlign: TextAlign.left,
                  obscureText: _obscureText,
                  textInputAction: TextInputAction.next,
                  focusNode: focusNode,
                  keyboardType: TextInputType.name,
                  style: theme.textTheme.bodyText1
                      ?.merge(TextStyle(fontWeight: FontWeight.normal)),
                  // onFieldSubmitted: (_) => submit,
                  onSaved: (val) => password = val!,
                  validator: (val) =>
                      val!.length < 3 ? 'Enter Valid Password' : null,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20, 22, 0, 0),
                    hintText: 'Your Password',
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(
                          screenSizeWidth * 0.04,
                          screenSizeWidth * 0.035,
                          screenSizeWidth * 0.04,
                          screenSizeWidth * 0.045),
                      child: Icon(Icons.lock_outline_rounded,
                          color: Colors.grey[400]),
                    ),
                    // hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.visibility,
                        color: Colors.grey[400],
                      ),
                      onPressed: () {
                        // print("Changing obscure");
                        setState(() {
                          if (_obscureText == true) {
                            _obscureText = false;
                          } else {
                            _obscureText = true;
                          }
                        });
                      },
                    ),
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    // prefixIcon: Icon(icon),

                    filled: true,
                    fillColor: Colors.grey[200],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.white12, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.white12, width: 2),
                    ),
                  ),
                ))
          ],
        ),
      );
    }

    socialLoginButton(String image, var navigation) {
      return InkWell(
        onTap: () {
          //nav
        },
        child: Container(
          height: ScreenSizeConfig.safeBlockVertical * 10,
          width: ScreenSizeConfig.safeBlockVertical * 10,
          padding: EdgeInsets.all(
            ScreenSizeConfig.safeBlockVertical * 2,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 3.0,
              ),
            ],
          ),
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
      );
    }

    return Scaffold(
        body: BlocConsumer<UserBloc, UserState>(listener: (context, state) {
      if (state is LogInError) {
        print('Error log in Scaffold');
        ScaffoldMessenger.of(context).showSnackBar(showSnackbar(state.error));
      } else if (state is UserLoggedIn) {
        // var phoneSubString = phoneNumber.substring(phoneNumber.length - 4);
        // if (!state.confirmed) {
        //   Navigator.pushReplacementNamed(context, ConfirmEmail.routeName);
        // } else {
        Navigator.pushReplacementNamed(context, RootApp.routeName);
        // }
      }
    }, builder: (context, state) {
      return
          // (state is UserLoading)
          //     ? bufferScreen(screenSizeHeight, screenSizeWidth, theme)
          // :
          SingleChildScrollView(
        // padding: EdgeInsets.fromLTRB(50, 20, 35, 20),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(height: screenSizeHeight * 0.1),
              Container(
                width: screenSizeWidth * 0.4,
                height: screenSizeHeight * 0.08,
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
                height: 10,
              ),
              usernametextFieldandTitlewithImageIcon(
                  screenSizeWidth,
                  "Username",
                  "Enter Username",
                  'assets/images/icons/enter_email_icon.png',
                  usernameFocusNode,
                  emailFocusNode,
                  "username"),
              SizedBox(
                height: 15,
              ),
              textFieldandTitlewithImageIcon(
                  screenSizeWidth,
                  "Email",
                  "name@email.com",
                  'assets/images/icons/enter_email_icon.png',
                  emailFocusNode,
                  passwordFocusNode,
                  "email"),
              SizedBox(
                height: 15,
              ),
              textFieldandTitleObscureOption(
                  screenSizeWidth,
                  "Password",
                  "Your Password",
                  Icons.lock,
                  true,
                  passwordFocusNode,
                  'password'),
              SizedBox(
                height: 5,
              ),
              (state is UserLoading)
                  ? Container(
                      height: screenSizeHeight * 0.4,
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(
                              theme.primaryColor),
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          width: ScreenSizeConfig.safeBlockHorizontal * 80,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ForgotPasswordScreen.routeName);
                            },
                            child: Text('Forgot Password?',
                                style:
                                    theme.textTheme.bodyText2?.merge(TextStyle(
                                  color: theme.primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ))),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('(or) - Sign in with',
                            style: theme.textTheme.bodyText1?.merge(
                              TextStyle(
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.normal
                                  // letterSpacing: 1.0,
                                  // fontSize: 15.0,
                                  ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: screenSizeWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              socialLoginButton(
                                  "assets/images/icons/Glogo.png", () {}),
                              SizedBox(width: 40),
                              socialLoginButton(
                                  'assets/images/icons/facebook.png', () {}),
                              // SizedBox(width: 40),
                              // socialLoginButton(
                              //     'assets/images/icons/smartphone_icon.png',
                              //     () {}),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        submitButton(),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, SignUpPage.routeName);
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
                      ],
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
