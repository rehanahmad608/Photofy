import 'package:flutter/material.dart';

Widget bufferScreen(screenSizeHeight, screenSizeWidth, theme) {
  return Center(
    child: Container(
      height: screenSizeHeight * 0.5,
      child: Column(
        children: [
          Container(
            width: screenSizeWidth * 0.4,
            height: screenSizeHeight * 0.08,
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage('assets/images/Weell_logo1.png'),
            //       fit: BoxFit.contain),
            // ),
            child: Text('Photofy',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            ),
          ),
          SizedBox(
            height: screenSizeHeight * 0.2,
          ),
          CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(theme.primaryColor),
          ),
        ],
      ),
    ),
  );
}
