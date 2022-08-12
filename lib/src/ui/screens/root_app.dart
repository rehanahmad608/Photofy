import 'package:flutter/material.dart';
import 'package:photofy/src/ui/configs/Theme.dart';
import 'package:photofy/src/ui/configs/colors.dart';
import 'package:photofy/src/ui/screens/AboutPage.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:photofy/src/ui/screens/CameraPage.dart';
import 'package:photofy/src/ui/screens/DiscoverPage.dart';
import 'package:photofy/src/ui/screens/EditorPage.dart';
import 'package:photofy/src/ui/screens/UserPage.dart';
//import 'package:snapchat_ui/pages/discover_page.dart';
//import 'package:snapchat_ui/pages/chat_page.dart';
//import 'package:snapchat_ui/pages/map_page.dart';
//import 'package:snapchat_ui/pages/stories_page.dart';


class RootApp extends StatefulWidget {
  static const routeName = '/rootapp';
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  List<Widget> pages = [
    DiscoverPage(),
    EditorPage(imagePath: "",),
    CameraPage(),
    UserPage(),
    AboutPage(),
  ];

  @override
  void initState() {
   
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    // return pages.elementAt(pageIndex);
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List iconItems = [
      //Feather.map_pin,
      Icons.wysiwyg,
      //MaterialIcons.chat_bubble_outline,
      Icons.wallpaper,
      //Feather.camera,
      Icons.camera_alt_outlined,
      //Feather.users,
      Icons.person_outline,
      //Feather.menu
      Icons.apps,
    ];
    List textItems = ["Discover", "Editor", "Camera", "Profile", "About"];
    List colorItems = [
      green,
      blue,
      primary,
      purple,
      primary,
    ];
    return Container(
      width: double.infinity,
      height: 74,
      decoration: BoxDecoration(
          color: Colors.deepPurple,
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[
                      theme.primaryColor,
                      Colors.deepPurple,
                    ],
                  ),
          border: Border(
              top:
              BorderSide(width: 2, color: black))),
      child: Padding(
        padding:
        const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(textItems.length, (index) {
            return InkWell(
                onTap: () {
                  selectedTab(index);
                },
                child: Column(
                  children: [
                    Icon(iconItems[index],
                        color: pageIndex == index
                            ? colorItems[index]
                            : white),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      textItems[index],
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: pageIndex == index
                              ? Colors.white
                              : white),
                    )
                  ],
                ));
          }),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
