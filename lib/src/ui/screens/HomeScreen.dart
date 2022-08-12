// ignore: import_of_legacy_library_into_null_safe
import 'dart:async';
// import 'dart:io';

// import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photofy/src/ui/configs/ScreenSizeConfig.dart';
// import 'package:photofy/src/ui/configs/Theme.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: non_constant_identifier_names
  var list_friends;
  late DateTime alert;

  // final navigationButtonsAutoSizeGroup = AutoSizeGroup();
  var dur;
  late Timer timer, timer1;

  @override
  void initState() {
    super.initState();
    print("In Home Screen");
  }

  @override
  void dispose() {
    // timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig().init(context);
    var screenSizeWidth = ScreenSizeConfig.safeBlockHorizontal * 100;
    var screenSizeHeight = ScreenSizeConfig.safeBlockVertical * 100;
    final theme = Theme.of(context);
    // final size = MediaQuery.of(context).size;

    // void navigateToScanBadgePage() {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => ScanBadgeScreen(timer: timer)),
    //   );
    //   // Navigator.of(context).pushNamed(ScanBadgeScreen.routeName).then((value) => setState(() {}));
    //   ;
    // }

    // void navigateToShowadgePage() {
    //   Navigator.pushReplacement(
    //     context,
    //     PageRouteBuilder(
    //       pageBuilder: (context, animation1, animation2) =>
    //           ViewUserFrameScreen(),
    //       transitionDuration: Duration(seconds: 0),
    //     ),
    //   ).then((value) => setState(() {}));

    //   // Navigator.of(context).pushNamed(ViewUserFrameScreen.routeName);
    // }

    // void navigateToScanCard() {
    //   Navigator.of(context)
    //       .pushNamed(OnBoardingScreen1.routeName)
    //       .then((value) => setState(() {}));
    //   ;
    // }

    // Widget searchAndShareBar() {
    //   return Container(
    //     height: size.height * 0.12,
    //     width: size.width * 0.95,
    //     padding: const EdgeInsets.symmetric(vertical: 12),
    //     child: SearchBar(timer: timer),
    //   );
    // }

    // unfocus() {
    //   FocusScopeNode currentFocus = FocusScope.of(context);

    //   if (!currentFocus.hasPrimaryFocus) {
    //     currentFocus.unfocus();
    //   }
    // }

    // Widget navigationButton(String image, String text, Function onPressed,
    //     Color startColor, Color endColor) {
    //   return Column(
    //     children: [
    //       Container(
    //         margin: const EdgeInsets.symmetric(vertical: 7),
    //         child: ElevatedButton(
    //           onPressed: () => onPressed(),
    //           style: ElevatedButton.styleFrom(
    //             padding: EdgeInsets.zero,
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(50),
    //             ),
    //           ),
    //           child: Ink(
    //             decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 border: Border.all(color: Colors.grey[400]!, width: 2.0),
    //                 // gradient: LinearGradient(colors: [startColor, endColor]),
    //                 borderRadius: BorderRadius.circular(20)),
    //             child: Container(
    //               padding: EdgeInsets.all(8),
    //               child: DottedBorder(
    //                 borderType: BorderType.RRect,
    //                 color: Color(0xff175ec6),
    //                 strokeWidth: 1,
    //                 radius: Radius.circular(10),
    //                 child: Container(
    //                   padding: const EdgeInsets.symmetric(horizontal: 20),
    //                   width: size.width * 0.18,
    //                   height: size.width * 0.18,
    //                   // height: 50,
    //                   // height: size.height * 0.06 < 45 ? size.height * 0.06 : 45,
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Container(
    //                           width: size.width * 0.06,
    //                           child: Image.asset(
    //                             image,
    //                             fit: BoxFit.contain,
    //                           )),
    //                       // SizedBox(width: 10),
    //                       // SizedBox(
    //                       //   width: size.width * 0.6,
    //                       //   child: AutoSizeText(
    //                       //     text,
    //                       //     group: navigationButtonsAutoSizeGroup,
    //                       //     maxLines: 1,
    //                       //     // style: theme.textTheme.bodyText1?.merge(TextStyle(
    //                       //     //     color: textColor, fontWeight: FontWeight.w400)),
    //                       //   ),
    //                       // ),

    //                       // FittedBox(
    //                       //   fit: BoxFit.fitHeight,
    //                       //   child: Text(
    //                       //     text,
    //                       //     style: TextStyle(fontSize: 15),
    //                       //   ),
    //                       // ),
    //                       // Spacer(),
    //                       // Icon(Icons.arrow_forward_ios, color: Colors.white)
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       SizedBox(width: 10),
    //     ],
    //   );
    // }

    _topBar() {
      return Container(
        width: screenSizeWidth,
        height: screenSizeHeight * 0.35,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/devoncar.png'),
              fit: BoxFit.fitWidth),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenSizeWidth * 0.3,
              child: Image.asset("assets/images/Weell_logo1.png"),
            ),
            SizedBox(height: 15),
            Text(
              "Spread your Wings",
              textAlign: TextAlign.center,
              maxLines: 1,
              style: theme.textTheme.headline2?.merge(
                TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      );
    }

    _floatingBox() {
      return Positioned(
        top: 10 + screenSizeWidth * 0.4,
        child: Container(
          width: screenSizeWidth,
          alignment: AlignmentDirectional.center,
          child: Container(
            width: screenSizeWidth * 0.85,
            height: screenSizeHeight * 0.25,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 3.0,
                ),
              ],
            ),
          ),
        ),
      );
    }

    _topRatedCarsContentBox() {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: screenSizeHeight * 0.3,
          width: screenSizeWidth * 0.7,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(0.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 3.0,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        // appBar: vacctrustAppBar(state.user.getVaccineStatus),
        // endDrawer: vacctrustDrawer(),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: screenSizeHeight * 1.2,
              ),
              _topBar(),
              _floatingBox(),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: screenSizeHeight * 0.55,
                    ),
                    Container(
                      width: screenSizeWidth * 0.85,
                      alignment: AlignmentDirectional.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Top Rated cars near you",
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: theme.textTheme.headline6?.merge(
                                  TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                "Find the cars most loved by photofy Users",
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: theme.textTheme.bodyText1?.merge(
                                  TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "View all",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: theme.textTheme.bodyText2?.merge(
                              TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          _topRatedCarsContentBox(),
                          _topRatedCarsContentBox()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
        // Stack(
        //   children: [
        //     SingleChildScrollView(
        //       child: GestureDetector(
        //         onTap: unfocus,
        //         child: Column(
        //           children: [
        //             SizedBox(
        //               height: 40,
        //             ),
        //             Column(
        //               children: [
        //                 Container(
        //                   width: screenSizeWidth * 0.4,
        //                   child:
        //                       Image.asset("assets/images/vaccinated_title.png"),
        //                 ),
        //                 Text(
        //                   "You have received both of the doses",
        //                   textAlign: TextAlign.center,
        //                   maxLines: 2,
        //                   style: theme.textTheme.bodyText1?.merge(
        //                     TextStyle(
        //                       color: Colors.white,
        //                       fontWeight: FontWeight.w300,
        //                     ),
        //                   ),
        //                 )
        //               ],
        //             ),
        //             SizedBox(
        //               height: 20,
        //             ),
        //             Container(
        //               width: screenSizeWidth,
        //               height: screenSizeHeight * 0.75,
        //               decoration: BoxDecoration(
        //                 color: Colors.white,
        //                 borderRadius: BorderRadius.all(
        //                   Radius.circular(40.0),
        //                 ),
        //               ),
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   SizedBox(
        //                     height: 5,
        //                   ),

        //                   // buildHorizontalListFriends(context),
        //                   Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                     children: [
        //                       // navigationButton(
        //                       //     'assets/images/icons/updatestatusicon.png',
        //                       //     'Update Status',
        //                       //     navigateToScanCard,
        //                       //     Color(0xfff6632f),
        //                       //     Color(0xfff68e2f)),
        //                     ],
        //                   ),
        //                   SizedBox(
        //                     height: 5,
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     )
        //   ],
        //   // floatingActionButtonLocation:
        //   //     FloatingActionButtonLocation.centerFloat,
        //   // floatingActionButton: vacctrustBottomNavigationBar(label: 'Home'),
        //   // bottomNavigationBar: vacctrustBottomNavigationBar(label: 'Home'),
        // )
        );
  }
}
