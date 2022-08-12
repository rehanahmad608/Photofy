import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:photofy/src/resources/UserRepository.dart';
import 'package:photofy/src/ui/configs/Routes.dart';
import 'package:photofy/src/ui/configs/Theme.dart';
// import 'package:photofy/src/ui/screens/GuideScreen.dart';
// import 'package:photofy/src/ui/screens/HomeScreen.dart';
// import 'package:photofy/src/ui/screens/SignUpPage.dart';
import 'package:photofy/src/ui/screens/SplashScreen.dart';
// import 'package:photofy/src/ui/screens/VerifyNumberScreen.dart';
// import 'package:photofy/src/ui/screens/UploadDocuments.dart';
import 'package:photofy/src/bloc/User/user_bloc.dart';
import 'package:overlay_support/overlay_support.dart';

final themeColor = Colors.blue;
final accentColor = Color(0xff2e88c0);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserBloc()
            // ..add(CheckIfLoggedIn()),
            ),
       // BlocProvider(create: (context) => CarBloc()),
       // BlocProvider(create: (context) => SearchVehicleBloc()),
       // BlocProvider(create: (context) => BookingBloc()),
       // BlocProvider(create: (context) => TripdetailsBloc()),
       // BlocProvider(create: (context) => TriponroadBloc()),
      ],
      child: OverlaySupport(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          routes: routes,
          home: SplashScreen(),
        ),
      ),
    );
  }
}


