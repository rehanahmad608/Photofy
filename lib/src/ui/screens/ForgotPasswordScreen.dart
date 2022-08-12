import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photofy/src/bloc/User/user_bloc.dart';
import 'package:photofy/src/ui/configs/ScreenSizeConfig.dart';
import 'package:photofy/src/ui/configs/Theme.dart';
import 'package:photofy/src/ui/screens/EnterNewPassword.dart';
// import 'package:photofy/src/ui/screens/HomeScreen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static const routeName = '/forgotpasswordscreen';

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  var screenSizeWidth = ScreenSizeConfig.safeBlockHorizontal * 100;
  var screenSizeHeight = ScreenSizeConfig.safeBlockVertical * 100;
  TextEditingController emailController = TextEditingController();

  Widget nextButton() {
    return InkWell(
      onTap: () {
        BlocProvider.of<UserBloc>(context)
            .add(ForgotPassword(email: emailController.text));
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

  textFieldandTitlewithImageIcon(
      var screenSizeWidth, String title, String hintText, String icon) {
    return Container(
      width: screenSizeWidth * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              child: TextField(
                controller: emailController,
                style: TextStyle(
                  color: Colors.black,
                ),
                autocorrect: true,
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  prefixIcon: Container(
                    padding: EdgeInsets.all(screenSizeWidth * 0.055),
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

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig().init(context);
    var screenSizeWidth = ScreenSizeConfig.safeBlockHorizontal * 100;
    var screenSizeHeight = ScreenSizeConfig.safeBlockVertical * 100;
    return Scaffold(
        body: BlocConsumer<UserBloc, UserState>(listener: (context, state) {
      if (state is LogInError) {
        // Navigator.of(context).pushNamed(EnterNewPassword.routeName);
        print('Error log in Scaffold');
      } else if (state is ChangePassword) {
        Navigator.of(context).pushNamed(EnterNewPassword.routeName);
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
            textFieldandTitlewithImageIcon(screenSizeWidth, "Email",
                "name@email.com", 'assets/images/icons/enter_email_icon.png'),
            SizedBox(
              height: screenSizeHeight * 0.5,
            ),
            if (state is! UserLoading) nextButton(),
            if (state is UserLoading)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                    child: CircularProgressIndicator(
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(theme.colorScheme.secondary),
                  // color: theme.accentColor,
                )),
              ),
          ],
        ),
      );
    }));
  }
}
