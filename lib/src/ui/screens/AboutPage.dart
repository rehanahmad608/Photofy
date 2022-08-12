import 'package:flutter/material.dart';
import 'package:photofy/src/ui/configs/ScreenSizeConfig.dart';
import 'package:photofy/src/ui/configs/Theme.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: ScreenSizeConfig.safeBlockVertical*0,),
            Row(
              children: [
                Container(
                  height: ScreenSizeConfig.safeBlockVertical*30,
                  width: ScreenSizeConfig.safeBlockHorizontal*100,
                  decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/devoncar.png"),
                fit: BoxFit.cover,
          ),
        ),
                  child: Center(child: Text('Photofy',
                  style: theme.textTheme.headline1?.merge(TextStyle(
                    color: Colors.white,
                  ))
                  ),
                  ),
                ),
              ],
            ),
             SizedBox(height: ScreenSizeConfig.safeBlockVertical*3,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: ScreenSizeConfig.safeBlockVertical*30,
                  width: ScreenSizeConfig.safeBlockHorizontal*100,
                  decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/devoncar.png"),
                fit: BoxFit.cover,
          ),
        ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[ 
                        SizedBox(height: ScreenSizeConfig.safeBlockVertical*2,),
                        Text('Photofy Membership',
                    style: theme.textTheme.headline2?.merge(TextStyle(
                      color: Colors.white,
                    ))
                    ),
                     SizedBox(height: ScreenSizeConfig.safeBlockVertical*3,),
                        Container(
                          padding: EdgeInsets.all(6),
                          child: Text('Get Access to unlimited options like Styling photos and AI Driven Editing Tools.',
                    style: theme.textTheme.bodyText1?.merge(TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ))
                    ),
                        ),
                    SizedBox(height: ScreenSizeConfig.safeBlockVertical*7,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: (){},
                              child: Container(
                                padding: EdgeInsets.all(5),
                                color: Colors.black26,
                                child: 
                                  Text('Get Membership',
                                                style: theme.textTheme.bodyText1?.merge(TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ))
                                                ),
                              
                              ),
                            ),
                          ],
                        ),
                    ]),
                  ),
                ),
              ],
            ),
             SizedBox(height: ScreenSizeConfig.safeBlockVertical*3,),
            Row(
              children: [
                Container(
                  height: ScreenSizeConfig.safeBlockVertical*30,
                  width: ScreenSizeConfig.safeBlockHorizontal*100,
                  decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/devoncar.png"),
                fit: BoxFit.cover,
          ),
        ),
                  child: Center(
                  child: 
                  Column(
                    children: [
                       SizedBox(height: ScreenSizeConfig.safeBlockVertical*3,),
                      Text('AI Driven Editor',
                      style: theme.textTheme.headline2?.merge(TextStyle(
                        color: Colors.white,
                      ))
                      ),
                      SizedBox(height: ScreenSizeConfig.safeBlockVertical*3,),
                        Container(
                          padding: EdgeInsets.all(6),
                          child: Text('Take your Photography skills a step further with our AI Driven Editing Tools.',
                    style: theme.textTheme.bodyText1?.merge(TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ))
                    ),
                        ),
                    SizedBox(height: ScreenSizeConfig.safeBlockVertical*6,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: (){},
                              child: Container(
                                padding: EdgeInsets.all(5),
                                color: Colors.black26,
                                child: 
                                  Text('Try it Out',
                                                style: theme.textTheme.bodyText1?.merge(TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ))
                                                ),
                              
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                  ),
                ),
              ],
            ),
             SizedBox(height: ScreenSizeConfig.safeBlockVertical*3,),
            Row(
              children: [
                Container(
                  height: ScreenSizeConfig.safeBlockVertical*30,
                  width: ScreenSizeConfig.safeBlockHorizontal*100,
                  decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/devoncar.png"),
                fit: BoxFit.cover,
          ),
        ),
                  child: Center(child: Column(
                    children: [
                      
                      SizedBox(height: ScreenSizeConfig.safeBlockVertical*3,),
                      Text('Style Your Photos',
                      style: theme.textTheme.headline2?.merge(TextStyle(
                        color: Colors.white,
                      ))
                      ),
                      SizedBox(height: ScreenSizeConfig.safeBlockVertical*3,),
                        Container(
                          padding: EdgeInsets.all(6),
                          child: Text('Style your photos with our amazing styles.',
                    style: theme.textTheme.bodyText1?.merge(TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ))
                    ),
                        ),
                    SizedBox(height: ScreenSizeConfig.safeBlockVertical*8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: (){},
                              child: Container(
                                padding: EdgeInsets.all(5),
                                color: Colors.black26,
                                child: 
                                  Text('Try it Out',
                                                style: theme.textTheme.bodyText1?.merge(TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ))
                                                ),
                              
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                  ),
                ),
              ],
            ),
             SizedBox(height: ScreenSizeConfig.safeBlockVertical*4,),
          ],
        ),

      ),
    );
  }
}
