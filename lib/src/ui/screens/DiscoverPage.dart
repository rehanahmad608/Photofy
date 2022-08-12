import 'package:flutter/material.dart';
import 'package:photofy/src/ui/configs/ScreenSizeConfig.dart';
import 'package:photofy/src/ui/configs/Theme.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
TextEditingController searchbar = TextEditingController();

Widget trendingPhotos(){
  return Container(
    child: Column(
      children: [
        Row(
                   children: [
                     
                      SizedBox(width: ScreenSizeConfig.safeBlockHorizontal*2,),
                     CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage('assets/images/devoncar.png'),
                      ),
                      SizedBox(width: ScreenSizeConfig.safeBlockHorizontal*1,),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Container(
                               child: Text('Talha Iqbal',
                               style: theme.textTheme.bodyText1?.merge(TextStyle(
                                 fontWeight: FontWeight.w400,
                               ))
                               ),
                             ),
                             Text('@ridzjcob'),
                           ],
                         ),
                   ],
                 ),
                 SizedBox(height: ScreenSizeConfig.safeBlockVertical*2,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                 SizedBox(width: ScreenSizeConfig.safeBlockHorizontal*2,),
                     Container(
                       child: Image(image: AssetImage('assets/images/SplashScreen.jpg'),
                       height: ScreenSizeConfig.safeBlockVertical*30,
                       //width: ScreenSizeConfig.safeBlockHorizontal*60,
                       ),
                     ),
                   ],
                 ),
                 SizedBox(height: ScreenSizeConfig.safeBlockVertical*2,),
                 Row(
                   children: [
                 SizedBox(width: ScreenSizeConfig.safeBlockHorizontal*2,),
                     InkWell(
                        onTap: (){},
                       child: Icon(Icons.auto_awesome_outlined,
                       size: 20,
                       color: Colors.yellow,
                       ),
                     ),
                     
                     SizedBox(width: ScreenSizeConfig.safeBlockHorizontal*1,),
                     Text('sweetApple',
                     style: theme.textTheme.bodyText2?.merge(TextStyle(
                       fontWeight: FontWeight.w600,
                     ))
                     ),
                     SizedBox(width: ScreenSizeConfig.safeBlockHorizontal*45,),
                     Container(
                       child: Icon(Icons.favorite, 
                       color: Colors.red,
                       ),
                     ),
                     Text('53 Likes',
                     style: theme.textTheme.bodyText2?.merge(TextStyle(
                       fontWeight: FontWeight.w600,
                     ))
                     ),
                     SizedBox(width: ScreenSizeConfig.safeBlockHorizontal*2,),
                      InkWell(
                        onTap: (){},
                       child: Icon(Icons.share, 
                       size: 25,
                       color: Colors.black,
                       ),
                     ),
                      SizedBox(width: ScreenSizeConfig.safeBlockHorizontal*2,),
                   ],
                 ),
      ],
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: photofyPurple.withOpacity(0.5),
          title: Container(
        width: double.infinity,
        height: ScreenSizeConfig.safeBlockVertical*6,
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(5),
            ),
        child: Center(
          child: TextField(
            controller: searchbar,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none),
          ),
        ),
      )),
      body: SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           SizedBox(height: ScreenSizeConfig.safeBlockVertical*2,),
           Row(
             children: [
           SizedBox(width: ScreenSizeConfig.safeBlockHorizontal*2,),
               Container(
                 child: Text('Discover',
                 style: theme.textTheme.headline2?.merge(TextStyle(
                   fontWeight: FontWeight.w300,
                 ))
                 ),
               ),
             ],
           ),
            SizedBox(height: ScreenSizeConfig.safeBlockVertical*2,),
           Row(
             children: [
           SizedBox(width: ScreenSizeConfig.safeBlockHorizontal*2,),
               Container(
                 child: Text('Trending New Today',
                 style: theme.textTheme.bodyText1?.merge(TextStyle(
                   fontWeight: FontWeight.w600,
                 ))
                 ),
               ),
             ],
           ),
           
           SizedBox(height: ScreenSizeConfig.safeBlockVertical*2,),
           SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Center(
               child: Row(
                 children: [
                      SizedBox(width: ScreenSizeConfig.safeBlockHorizontal*1,),
                   trendingPhotos(),
                   SizedBox(width: ScreenSizeConfig.safeBlockHorizontal*1,),
                   trendingPhotos(),
                 ],
               ),
             ),
           ),
           
                SizedBox(height: ScreenSizeConfig.safeBlockVertical*2,),
                Row(
                  children: [
                SizedBox(width: ScreenSizeConfig.safeBlockHorizontal*2,),
                    Container(
                         child: Text('Browse All',
                         style: theme.textTheme.bodyText1?.merge(TextStyle(
                           fontWeight: FontWeight.w600,
                         ))
                         ),
                       ),
                  ],
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
