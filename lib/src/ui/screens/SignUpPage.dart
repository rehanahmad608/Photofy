import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photofy/src/ui/screens/root_app.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:photofy/src/bloc/User/user_bloc.dart';
import 'package:photofy/src/ui/configs/ScreenSizeConfig.dart';
import 'package:photofy/src/ui/configs/Theme.dart';
// import 'package:photofy/src/ui/screens/ConfirmEmail.dart';
import 'package:photofy/src/ui/screens/SignInPage.dart';
// import 'package:photofy/src/ui/screens/VerifyNumberScreen.dart';
// import 'package:photofy/src/ui/widgets/BufferScreen.dart';
import 'package:photofy/src/ui/widgets/SnackBar.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = '/signup-page';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();
  FocusNode 
  usernameFocusNode = FocusNode(),
  emailFocusNode = FocusNode(),
      phoneFocusNode = FocusNode(),
      passwordFocusNode = FocusNode();

  String email = '',
      phone = '',
      password = '',
      username = '',
      status = '',
      dateOfBirth = '',
      countrycode = '';
  var defaulttext = TextStyle(color: Colors.black);

  var linktext = TextStyle(color: Colors.indigo);

// Create an instance of FacebookLogin
  final fb = FacebookLogin();

  bool _obscureText = true;
  bool _valueCheckBox = false;
  String? countryCode;

  @override
  void initState() {
    usernameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    super.initState();
    print("In SignUp Screen");
  }

  @override
  dispose() {
    usernameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    phoneFocusNode.dispose();
    super.dispose();
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
      phoneFocusNode.unfocus();
      if (!_valueCheckBox) {
        ScaffoldMessenger.of(context).showSnackBar(
            showSnackbar('Please accept the terms and conditions'));
      } else {
        if (_formkey.currentState!.validate()) {
          _formkey.currentState!.save();
          final mobileNum = countryCode! + phone;
          print(mobileNum);
          print('Submit');
          BlocProvider.of<UserBloc>(context).add(Signup(
            email: email,
            phoneNumber: phone,
            password: password,
            username: username,
            status: "free",
            dateOfBirth: "",
            countrycode: countryCode!,
          ));
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
              'Next',
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
                      padding: EdgeInsets.all(screenSizeWidth * 0.05),
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
                      padding: EdgeInsets.all(screenSizeWidth * 0.05),
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

    textFieldandTitlewithCountryPrefix(
        var screenSizeWidth,
        String title,
        String hintText,
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
                  style: theme.textTheme.bodyText1
                      ?.merge(TextStyle(fontWeight: FontWeight.normal)),
                  textInputAction: TextInputAction.go,
                  focusNode: focusNode,
                  autocorrect: false,
                  onFieldSubmitted: (_) => nextFocusNode.requestFocus(),
                  onSaved: (val) => phone = val!.trim(),
                  validator: (val) => val != null
                      ? val.trim().length != 10
                          ? "Enter Valid Phone Number"
                          : null
                      : null,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20, 27, 0, 0),
                    hintText: hintText,
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    prefixIcon: CountryCodePicker(
                      textStyle: theme.textTheme.bodyText1
                          ?.merge(TextStyle(fontWeight: FontWeight.normal)),
                      initialSelection: 'SA',
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      favorite: ['+92', 'PK'],
                      onInit: (code) {
                        countryCode = code?.dialCode;
                        print("on init  ${code!.dialCode} ${code.name}");
                      },
                      onChanged: (code) {
                        countryCode = code.dialCode;
                        print("on changed  ${code.dialCode} ${code.name}");
                      },
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
                    prefixIcon: Icon(Icons.lock_outline_rounded,
                        color: Colors.grey[400]),
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

    facebookLoginButton(String image, var navigation) {
      return InkWell(
        onTap: () async {
          // Log in
          final res = await fb.expressLogin();

          if (res.status == FacebookLoginStatus.success) {
            final FacebookAccessToken? accessToken = res.accessToken;
            print('Access token: ${accessToken!.token}');
          }
          // Get profile data
          final profile = await fb.getUserProfile();
          print('Hello, ${profile!.name}! You ID: ${profile.userId}');

          // Get user profile image url
          final imageUrl = await fb.getProfileImageUrl(width: 100);
          print('Your profile image: $imageUrl');

          // Get email (since we request email permission)
          final email = await fb.getUserEmail();
          // But user can decline permission
          if (email != null) print('And your email is $email');
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
          if (state.error == "User already Exist") {
            ScaffoldMessenger.of(context).showSnackBar(
                showSnackbar("User Already Exists. Please Sign-in"));
            Future.delayed(Duration(seconds: 1), () {
              Navigator.pushReplacementNamed(context, SignInPage.routeName);
            });
          } else {
            print('Error log in Scaffold');
            ScaffoldMessenger.of(context)
                .showSnackBar(showSnackbar(state.error));
          }
        } 
        else if (state is UserLoggedIn) {
          // var phoneSubString = phoneNumber.substring(phoneNumber.length - 4);
           Navigator.pushReplacementNamed(context,RootApp.routeName);
          // if (!state.confirmed) {
          //   Navigator.pushReplacementNamed(context,RootApp.routeName);
          // }
        }
      }, builder: (context, state) {
        return
            // (state is UserLoading)
            //     ? bufferScreen(screenSizeHeight, screenSizeWidth, theme)
            //     :
            SingleChildScrollView(
          // padding: EdgeInsets.fromLTRB(50, 20, 35, 20),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(height: screenSizeHeight * 0.1),
                Container(
                  width: screenSizeWidth * 0.5,
                  height: screenSizeHeight * 0.08,
                  // decoration: const BoxDecoration(
                  //   image: DecorationImage(
                  //       image: AssetImage('assets/images/Weell_logo1.png'),
                  //       fit: BoxFit.contain),
                  // ),
                  child: Text('Photofy',
                      style: theme.textTheme.headline1?.merge(TextStyle(
                        color: theme.primaryColor,
                      ))),
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
                    SizedBox(height: 10,),
                textFieldandTitlewithImageIcon(
                    screenSizeWidth,
                    "Email",
                    "name@email.com",
                    'assets/images/icons/enter_email_icon.png',
                    emailFocusNode,
                    phoneFocusNode,
                    "email"),
                SizedBox(
                  height: 15,
                ),
                textFieldandTitlewithCountryPrefix(
                    screenSizeWidth,
                    "Mobile Number",
                    "1122114455",
                    phoneFocusNode,
                    passwordFocusNode,
                    "phonenumber"),
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
                  height: 20,
                ),
                (state is UserLoading)
                    ? Container(
                        height: screenSizeHeight * 0.3,
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(
                                theme.primaryColor),
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          Text('(or) - Sign up with',
                              style: theme.textTheme.bodyText1?.merge(
                                TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.normal
                                    // letterSpacing: 1.0,
                                    // fontSize: 15.0,
                                    ),
                              )),

                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: screenSizeWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                socialLoginButton(
                                    "assets/images/icons/Glogo.png", () {}),
                                SizedBox(width: 40),
                                facebookLoginButton(
                                    'assets/images/icons/facebook.png',
                                    () {}),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: screenSizeWidth * 0.85,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Checkbox(
                                  value: _valueCheckBox,
                                  checkColor: Colors.indigo,
                                  onChanged: (value) {
                                    setState(() {
                                      if (_valueCheckBox == true) {
                                        _valueCheckBox = false;
                                      } else {
                                        _valueCheckBox = true;
                                      }
                                    });
                                  },
                                ),
                                Expanded(
                                    child: RichText(
                                        text: TextSpan(children: [
                                  TextSpan(
                                      style: theme.textTheme.bodyText2?.merge(
                                          TextStyle(
                                              color: Colors.grey[850],
                                              fontWeight: FontWeight.normal)),
                                      text:
                                          "By signing up, I acknowledge to have read and agree to the "),
                                  TextSpan(
                                      style: theme.textTheme.bodyText2?.merge(
                                          TextStyle(
                                              color: Colors.indigo,
                                              fontWeight: FontWeight.normal)),
                                      text: "PHOTOFY Terms & Conditions ",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          // var url = "https://www.google.com";
                                          // if (await canLaunch(url)) {
                                          //   await launch(url);
                                          // } else {
                                          //   throw 'Could not launch ';
                                          // }
                                        }),
                                  TextSpan(
                                      style: theme.textTheme.bodyText2?.merge(
                                          TextStyle(
                                              color: Colors.grey[850],
                                              fontWeight: FontWeight.normal)),
                                      text: "and "),
                                  TextSpan(
                                      style: theme.textTheme.bodyText2?.merge(
                                          TextStyle(
                                              color: Colors.indigo,
                                              fontWeight: FontWeight.normal)),
                                      text: "Privacy Policy",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          // var url = "https://www.google.com";
                                          // if (await canLaunch(url)) {
                                          //   await launch(url);
                                          // } else {
                                          //   throw 'Could not launch ';
                                          // }
                                        }),
                                ]))),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          submitButton(),
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
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, SignInPage.routeName);
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
                        ],
                      ),
                SizedBox(
                  height: screenSizeHeight * 0.05,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
