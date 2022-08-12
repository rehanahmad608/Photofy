 import 'package:flutter/material.dart';
import 'package:photofy/src/ui/configs/ScreenSizeConfig.dart';
import 'package:photofy/src/ui/configs/Theme.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: ScreenSizeConfig.safeBlockVertical*8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               // SizedBox(width: ,),
                CircleAvatar(
                  radius: 60,
                 backgroundImage: AssetImage('assets/images/devoncar.png'),
           ),
              ],
            ),
            SizedBox(height: ScreenSizeConfig.safeBlockVertical*2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Jane Dough',
                style: theme.textTheme.headline3,
                ),
                
              ],
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('@Jane123',
                style: theme.textTheme.bodyText1,
                ),
              ],
            ),
            SizedBox(height: ScreenSizeConfig.safeBlockVertical*1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Bio - Description',
                style: theme.textTheme.bodyText1,
                ),
              ],
            ),
            SizedBox(height: ScreenSizeConfig.safeBlockVertical*2,),
            Container(
              height: ScreenSizeConfig.safeBlockVertical*5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   InkWell(
                    onTap: (){},
                    child: Text('Follow',
                    style: theme.textTheme.bodyText1?.merge(TextStyle(
                      fontWeight: FontWeight.w600,
                    ))
                    ),
                  ),
                  //   Text('|',
                  // style: theme.textTheme.bodyText1,
                  // ),
                  VerticalDivider(
                    color: Colors.black,
                  ),
                   InkWell(
                    onTap: (){},
                    child: Text('Insights',
                    style: theme.textTheme.bodyText1?.merge(TextStyle(
                      fontWeight: FontWeight.w600,
                    ))
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.black,
                  ),
                  InkWell(
                    onTap: (){},
                    child: Text('Edit',
                    style: theme.textTheme.bodyText1?.merge(TextStyle(
                      fontWeight: FontWeight.w600,
                    ))
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.black,
                  ),
                  InkWell(
                    onTap: (){},
                    child: Text('Share',
                    style: theme.textTheme.bodyText1?.merge(TextStyle(
                      fontWeight: FontWeight.w600,
                    ))
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: ScreenSizeConfig.safeBlockVertical*1,),
            Center(child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:EdgeInsets.symmetric(horizontal:20.0),
                  child:Container(
                  height:0.5,
                  width:350.0,
                  color:Colors.black,),),
              ],
            ), 
            ),
            SizedBox(height: ScreenSizeConfig.safeBlockVertical*2,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
           SizedBox(width: ScreenSizeConfig.safeBlockHorizontal*2,),
               Container(
                 child: Image(image: AssetImage('assets/images/SplashScreen.jpg'),
                 height: ScreenSizeConfig.safeBlockVertical*30,
                 //width: ScreenSizeConfig.safeBlockHorizontal*60,
                 ),
               ),
               
           SizedBox(width: ScreenSizeConfig.safeBlockHorizontal*2,),
               Container(
                 child: Image(image: AssetImage('assets/images/SplashScreen.jpg'),
                 height: ScreenSizeConfig.safeBlockVertical*30,
                 //width: ScreenSizeConfig.safeBlockHorizontal*60,
                 ),
               ),
               
           SizedBox(width: ScreenSizeConfig.safeBlockHorizontal*2,),
               Container(
                 child: Image(image: AssetImage('assets/images/SplashScreen.jpg'),
                 height: ScreenSizeConfig.safeBlockVertical*30,
                 //width: ScreenSizeConfig.safeBlockHorizontal*60,
                 ),
               ),
               
           SizedBox(width: ScreenSizeConfig.safeBlockHorizontal*1,),
               
             ],
           ),
          SizedBox(height:ScreenSizeConfig.safeBlockVertical*2),
          ],
        ),
      ),
    );
  }
}
