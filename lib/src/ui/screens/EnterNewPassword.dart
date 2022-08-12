import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photofy/src/bloc/User/user_bloc.dart';
import 'package:photofy/src/ui/configs/ScreenSizeConfig.dart';
import 'package:photofy/src/ui/configs/Theme.dart';
// import 'package:photofy/src/ui/screens/HomeScreen.dart';
import 'package:photofy/src/ui/screens/SignInPage.dart';
import 'package:photofy/src/ui/widgets/SnackBar.dart';

class EnterNewPassword extends StatefulWidget {
  const EnterNewPassword({Key? key}) : super(key: key);
  static const routeName = '/enternewpassword';

  @override
  _EnterNewPasswordState createState() => _EnterNewPasswordState();
}

class _EnterNewPasswordState extends State<EnterNewPassword> {
  final _formKey = GlobalKey<FormState>();
  var screenSizeWidth = ScreenSizeConfig.safeBlockHorizontal * 100;
  var screenSizeHeight = ScreenSizeConfig.safeBlockVertical * 100;

  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  // ignore: non_constant_identifier_names
  late bool _obscureText_newPassword;
  // ignore: non_constant_identifier_names
  late bool _obscureText_confirmPassword;

  // late bool _obscureText;

  textFieldandTitleObscureOption(var screenSizeWidth, String title,
      String hintText, IconData icon, bool obscure) {
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
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // _obscureText = true;
    _obscureText_newPassword = true;
    _obscureText_confirmPassword = true;
    // _valueCheckBox = false;
  }

  Widget nextButton() {
    return InkWell(
      onTap: () {
        final state = BlocProvider.of<UserBloc>(context).state;
        if (newPassword.text == confirmPassword.text) {
          if (state is ChangePassword) {
            BlocProvider.of<UserBloc>(context).add(ResetPassword(
                email: state.email,
                password: newPassword.text,
                token: state.token));
          } else if (state is UserLoading) {
            ScaffoldMessenger.of(context)
                .showSnackBar(showSnackbar("Change Password failed"));
          }
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(showSnackbar("Passwords are not the same"));
        }
      },
      child: Container(
        height: 50,
        width: screenSizeWidth * 0.55,
        decoration: BoxDecoration(
          color: theme.primaryColor,
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

  Widget build(BuildContext context) {
    ScreenSizeConfig().init(context);
    var screenSizeWidth = ScreenSizeConfig.safeBlockHorizontal * 100;
    var screenSizeHeight = ScreenSizeConfig.safeBlockVertical * 100;
    return Scaffold(
      body: BlocConsumer<UserBloc, UserState>(listener: (context, state) {
        if (state is LogInError) {
          print('Error log in Scaffold');
          Navigator.of(context).pushNamed(SignInPage.routeName);
        } else if (state is UserInitial) {
          Navigator.of(context).pushReplacementNamed(SignInPage.routeName);
        }
      }, builder: (context, state) {
        return SingleChildScrollView(
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
            SizedBox(
              height: screenSizeHeight * 0.07,
            ),
            changePasswordForm(),
          ],
        ));
      }),
    );
  }

  Widget changePasswordForm() {
    ScreenSizeConfig().init(context);
    var screenSizeWidth = ScreenSizeConfig.safeBlockHorizontal * 100;
    var screenSizeHeight = ScreenSizeConfig.safeBlockVertical * 100;
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenSizeWidth * 0.02,
                  ),
                  Text(
                    'Enter New Password',
                    style: theme.textTheme.bodyText1?.merge(TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300)),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              newPasswordField(),
              SizedBox(
                height: screenSizeHeight * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenSizeWidth * 0.02,
                  ),
                  Text(
                    'Confirm New Password',
                    style: theme.textTheme.bodyText1?.merge(TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300)),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              confirmPasswordField(),
              SizedBox(
                height: screenSizeHeight * 0.34,
              ),
              nextButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget newPasswordField() {
    ScreenSizeConfig().init(context);
    var screenSizeWidth = ScreenSizeConfig.safeBlockHorizontal * 100;
    // var screenSizeHeight = ScreenSizeConfig.safeBlockVertical * 100;
    return Container(
      color: Colors.white,
      height: 55,
      width: screenSizeWidth * 0.85,
      child: TextFormField(
        controller: newPassword,
        style: TextStyle(
          color: Colors.black,
        ),
        obscureText: _obscureText_newPassword,
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.symmetric(horizontal: 10),
          hintText: 'Enter New Password',
          prefixIcon: Icon(Icons.lock_outline_rounded, color: Colors.grey[400]),
          // hintStyle: TextStyle(color: Colors.grey),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.visibility,
              color: Colors.grey[400],
            ),
            onPressed: () {
              // print("Changing obscure");
              setState(() {
                if (_obscureText_newPassword == true) {
                  _obscureText_newPassword = false;
                } else {
                  _obscureText_newPassword = true;
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
        validator: (value) {
          if (isPasswordValid(value!) == true) {
            return null;
          } else {
            return 'Password must have at least one Uppercase and a lowercase character, at least one digit and a special character';
          }
        },
      ),
    );
  }

  Widget confirmPasswordField() {
    ScreenSizeConfig().init(context);
    var screenSizeWidth = ScreenSizeConfig.safeBlockHorizontal * 100;
    // var screenSizeHeight = ScreenSizeConfig.safeBlockVertical * 100;
    return Container(
      color: Colors.white,
      height: 55,
      width: screenSizeWidth * 0.85,
      // height: ScreenSizeConfig.safeBlockVertical * 7,
      // width: ScreenSizeConfig.safeBlockHorizontal * 75,
      // padding: EdgeInsets.all(1.0),
      child: TextFormField(
        controller: confirmPassword,
        style: TextStyle(
          color: Colors.black,
        ),
        obscureText: _obscureText_confirmPassword,
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.symmetric(horizontal: 10),
          hintText: 'Confirm New Password',
          prefixIcon: Icon(Icons.lock_outline_rounded, color: Colors.grey[400]),
          // hintStyle: TextStyle(color: Colors.grey),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.visibility,
              color: Colors.grey[400],
            ),
            onPressed: () {
              // print("Changing obscure");
              setState(() {
                if (_obscureText_confirmPassword == true) {
                  _obscureText_confirmPassword = false;
                } else {
                  _obscureText_confirmPassword = true;
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
        validator: (value) {
          if (isPasswordValid(value!) == true) {
            return null;
          }
          if (value != newPassword.text) {
            return 'Password not match';
          } else {
            return 'Password must have at least one Uppercase and a lowercase character, at least one digit and a special character';
          }
        },
      ),
    );
  }

  bool isPasswordValid(String password) {
    if (password.length < 4) return false;
    if (!password.contains(RegExp(r"[a-z]"))) return false;
    if (!password.contains(RegExp(r"[A-Z]"))) return false;
    if (!password.contains(RegExp(r"[0-9]"))) return false;
    if (!password.contains(RegExp(r'[!@#$%^&*(),_.?":{}|<>]'))) return false;
    return true;
  }
}
