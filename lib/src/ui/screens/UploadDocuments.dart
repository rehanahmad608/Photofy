// import 'package:country_code_picker/country_code_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'dart:async';
import 'package:photofy/src/ui/configs/ScreenSizeConfig.dart';

class UploadDocuments extends StatefulWidget {
  static const routeName = '/UploadDocuments';

  @override
  _UploadDocumentsState createState() => _UploadDocumentsState();
}

class _UploadDocumentsState extends State<UploadDocuments> {
  bool showpassport = false;
  List<String> _locations = ['A', 'B', 'C', 'D'];
  String? _selectedLocation;


  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            if(!showpassport)
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: ScreenSizeConfig.safeBlockHorizontal * 100,
                      height: ScreenSizeConfig.safeBlockVertical * 25,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(45, 15, 101, 1),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(320, 40, 10, 10),
                        child: Text(
                          'Do it Later',
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0),
                        )),
                    Container(
                      padding: EdgeInsets.fromLTRB(150, 35, 10, 10),
                      child: Image(
                        image: AssetImage('assets/photofy_logo1.png'),
                        height: ScreenSizeConfig.safeBlockVertical * 15,
                        width: ScreenSizeConfig.safeBlockHorizontal * 30,
                      ),
                    ),

                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: ScreenSizeConfig.safeBlockVertical * 25,
                      width: ScreenSizeConfig.safeBlockHorizontal * 5,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showpassport = false;
                        });

                      },
                      child: Text(
                        'License',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(45, 15, 101, 1),
                          padding: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          textStyle: TextStyle(
                            fontSize: 16,
                            letterSpacing: 1,
                          )),
                      //color: Colors.black38,
                    ),
                    SizedBox(
                      // height: ScreenSizeConfig.safeBlockVertical*25,
                      width: ScreenSizeConfig.safeBlockHorizontal * 5,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showpassport = true;
                        });
                        //showpassport = true;
                      },
                      child: Text(
                        'ID/Passport',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey[200],
                          padding: EdgeInsets.symmetric(
                              horizontal: 37, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          textStyle: TextStyle(
                            fontSize: 16,
                            letterSpacing: 1,
                          )),
                    ),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      children: [
                        Container(
                          height: ScreenSizeConfig.safeBlockVertical * 45,
                          width: ScreenSizeConfig.safeBlockHorizontal * 75,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                        ),
                        Container(
                          //alignment: Alignment.topRight,
                          padding: EdgeInsets.fromLTRB(200, 10, 10, 10),
                          child: Text(
                            'License',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenSizeConfig.safeBlockVertical * 5,
                        ),
                        Container(
                          //alignment: Alignment.topRight,
                          padding: EdgeInsets.fromLTRB(80, 150, 10, 10),
                          child: Text(
                            'No License Found',
                            style: TextStyle(
                              color: Colors.grey[350],
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.fromLTRB(80, 270, 10, 10),
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      //contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 1),
                                      scrollable: true,
                                      title: Text('Select Country'),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                                      ),
                                      content: Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child:
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Container(
                                              height: ScreenSizeConfig.safeBlockVertical*4,
                                              width: ScreenSizeConfig.safeBlockHorizontal*75,
                                              color: Colors.grey[300],
                                              padding: EdgeInsets.all(1.0),
                                              child:
                                              DropdownButton(
                                                hint: Text('Choose License Country'), // Not necessary for Option 1
                                                value: _selectedLocation,
                                                icon: const Icon(Icons.arrow_drop_down),
                                                iconSize: 24,
                                                isExpanded: true,
                                                dropdownColor: Colors.white,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    _selectedLocation = newValue;
                                                  });
                                                },
                                                items: _locations.map((location) {
                                                  return DropdownMenuItem(
                                                    child: new Text(location),
                                                    value: location,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                            SizedBox(
                                              height: ScreenSizeConfig.safeBlockVertical*3,
                                             // width: ScreenSizeConfig.safeBlockHorizontal*2,
                                            ),
                                            new Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    //padding: EdgeInsets.fromLTRB(100, 150, 10, 10),
                                                    height: ScreenSizeConfig.safeBlockVertical*12,
                                                    //width: ScreenSizeConfig.safeBlockHorizontal*30,
                                                    //color: Colors.grey[300],
                                                    child: DottedBorder(
                                                      borderType: BorderType.RRect,
                                                      radius: Radius.circular(12),
                                                      padding: EdgeInsets.all(4),
                                                      strokeWidth: 2,
                                                      color: Colors.grey,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.all(Radius.circular(12)),
                                                        child: Container(
                                                          padding: EdgeInsets.fromLTRB(0, 35, 0, 1),
                                                          height: ScreenSizeConfig.safeBlockVertical*10,
                                                          width: ScreenSizeConfig.safeBlockHorizontal*30,
                                                          color: Colors.white,
                                                          child: Text(' Front of License',
                                                            style: TextStyle(
                                                              color: Colors.grey,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                    ),
                                                  ),
                                                  ),
                                                  SizedBox(
                                                    width: ScreenSizeConfig.safeBlockHorizontal*3,
                                                  ),
                                                  Container(
                                                    //padding: EdgeInsets.fromLTRB(100, 150, 10, 10),
                                                    height: ScreenSizeConfig.safeBlockVertical*12,
                                                    //width: ScreenSizeConfig.safeBlockHorizontal*30,
                                                    //color: Colors.grey[300],
                                                    child: DottedBorder(
                                                      borderType: BorderType.RRect,
                                                      radius: Radius.circular(12),
                                                      padding: EdgeInsets.all(4),
                                                      strokeWidth: 2,
                                                      color: Colors.grey,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.all(Radius.circular(12)),
                                                        child: Container(
                                                          padding: EdgeInsets.fromLTRB(0, 35, 0, 1),
                                                          height: ScreenSizeConfig.safeBlockVertical*10,
                                                          width: ScreenSizeConfig.safeBlockHorizontal*30,
                                                          color: Colors.white,
                                                          child: Text(' Back of License',
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 16,
                                                          ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                            ),
                                            SizedBox(
                                              height: ScreenSizeConfig.safeBlockVertical*3,
                                            ),
                                        new Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                        Container(
                                          //padding: EdgeInsets.fromLTRB(100, 150, 10, 10),
                                          height: ScreenSizeConfig.safeBlockVertical*3,
                                          width: ScreenSizeConfig.safeBlockHorizontal*50,
                                          child: Text('License Number',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                            ],
                                        ),
                                            SizedBox(
                                              height: ScreenSizeConfig.safeBlockVertical*2,
                                            ),
                                            new Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[

                                                Container(
                                                  //padding: EdgeInsets.fromLTRB(100, 150, 10, 10),
                                                  height: ScreenSizeConfig.safeBlockVertical*6,
                                                  width: ScreenSizeConfig.safeBlockHorizontal*68,
                                                  child:
                                                  TextField(
                                                    autocorrect: true,
                                                    decoration: InputDecoration(
                                                      hintText: 'Enter License Number',
                                                      //prefixIcon: Icon(Icons.lock_outline_rounded),
                                                      hintStyle: TextStyle(color: Colors.grey),
                                                      //suffixIcon: Icon(Icons.visibility),
                                                      filled: true,
                                                      fillColor: Colors.black12,
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                                        borderSide: BorderSide(color: Colors.white12, width: 2),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                        borderSide: BorderSide(color: Colors.white12, width: 2),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: ScreenSizeConfig.safeBlockVertical*3,
                                            ),
                                            new Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[

                                                Container(
                                                  //padding: EdgeInsets.fromLTRB(100, 150, 10, 10),
                                                  height: ScreenSizeConfig.safeBlockVertical*4,
                                                  width: ScreenSizeConfig.safeBlockHorizontal*50,
                                                  child: Text('Expiry Date',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: ScreenSizeConfig.safeBlockVertical*2,
                                            ),
                                        new Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              height: ScreenSizeConfig.safeBlockVertical*4,
                                              width: ScreenSizeConfig.safeBlockHorizontal*15,
                                              color: Colors.grey[300],
                                              padding: EdgeInsets.all(1.0),
                                              child:
                                              DropdownButton(
                                                hint: Text(' MM'), // Not necessary for Option 1
                                                value: _selectedLocation,
                                                icon: const Icon(Icons.arrow_drop_down),
                                                iconSize: 24,
                                                isExpanded: true,
                                                dropdownColor: Colors.white,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    _selectedLocation = newValue;
                                                  });
                                                },
                                                items: _locations.map((location) {
                                                  return DropdownMenuItem(
                                                    child: new Text(location),
                                                    value: location,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                            Text(' / '),
                                            Container(
                                              height: ScreenSizeConfig.safeBlockVertical*4,
                                              width: ScreenSizeConfig.safeBlockHorizontal*15,
                                              color: Colors.grey[300],
                                              padding: EdgeInsets.all(1.0),
                                              child:
                                              DropdownButton(
                                                hint: Text(' YY'), // Not necessary for Option 1
                                                value: _selectedLocation,
                                                icon: const Icon(Icons.arrow_drop_down),
                                                iconSize: 24,
                                                isExpanded: true,
                                                dropdownColor: Colors.white,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    _selectedLocation = newValue;
                                                  });
                                                },
                                                items: _locations.map((location) {
                                                  return DropdownMenuItem(
                                                    child: new Text(location),
                                                    value: location,
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                            ],
                                        ),
                                            SizedBox(
                                              height: ScreenSizeConfig.safeBlockVertical*4,
                                              //width: ScreenSizeConfig.safeBlockHorizontal*15,
                                            ),
                                        new Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              //height: ScreenSizeConfig.safeBlockVertical*4,
                                              width: ScreenSizeConfig.safeBlockHorizontal*15,
                                            ),
                                        Container(
                                          height: ScreenSizeConfig.safeBlockVertical*5,
                                          width: ScreenSizeConfig.safeBlockHorizontal*40,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Upload',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                primary: Color.fromRGBO(45, 15, 101, 1),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 40, vertical: 5),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12.0),
                                                ),
                                                textStyle: TextStyle(
                                                  fontSize: 16,
                                                  letterSpacing: 1,
                                                )),
                                          ),
                                        ),
                                            ],
                                        ),
                                        ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Text(
                              'Upload',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(45, 15, 101, 1),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 45, vertical: 7),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 1,
                                )),
                            //color: Colors.black38,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
                SizedBox(
                  height: ScreenSizeConfig.safeBlockVertical * 2,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Upload',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black12,
                      padding: EdgeInsets.symmetric(
                          horizontal: 80, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      textStyle: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1.2,
                      )),
                  //color: Colors.black38,
                ),
              ],
            ),
            if(showpassport)
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        width: ScreenSizeConfig.safeBlockHorizontal * 100,
                        height: ScreenSizeConfig.safeBlockVertical * 25,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(45, 15, 101, 1),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(320, 40, 10, 10),
                          child: Text(
                            'Do it Later',
                            style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0),
                          )),
                      Container(
                        padding: EdgeInsets.fromLTRB(150, 35, 10, 10),
                        child: Image(
                          image: AssetImage('assets/photofy_logo1.png'),
                          height: ScreenSizeConfig.safeBlockVertical * 15,
                          width: ScreenSizeConfig.safeBlockHorizontal * 30,
                        ),
                      ),

                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: ScreenSizeConfig.safeBlockVertical * 25,
                        width: ScreenSizeConfig.safeBlockHorizontal * 5,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showpassport = false;
                          });
                          //showpassport = false;
                        },
                        child: Text(
                          'License',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.grey[200],
                            padding: EdgeInsets.symmetric(
                                horizontal: 60, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            textStyle: TextStyle(
                              fontSize: 16,
                              letterSpacing: 1,
                            )),
                        //color: Colors.black38,
                      ),
                      SizedBox(
                        // height: ScreenSizeConfig.safeBlockVertical*25,
                        width: ScreenSizeConfig.safeBlockHorizontal * 5,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showpassport = true;
                          });
                          //showpassport= true;
                        },
                        child: Text(
                          'ID/Passport',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(45, 15, 101, 1),
                            padding: EdgeInsets.symmetric(
                                horizontal: 37, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            textStyle: TextStyle(
                              fontSize: 16,
                              letterSpacing: 1,
                            )),
                      ),
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        children: [
                          Container(
                            height: ScreenSizeConfig.safeBlockVertical * 45,
                            width: ScreenSizeConfig.safeBlockHorizontal * 75,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                          ),
                          Container(
                            //alignment: Alignment.topRight,
                            padding: EdgeInsets.fromLTRB(145, 10, 10, 10),
                            child: Text(
                              'ID/Passport',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSizeConfig.safeBlockVertical * 5,
                          ),
                          Container(
                            //alignment: Alignment.topRight,
                            padding: EdgeInsets.fromLTRB(60, 150, 10, 10),
                            child: Text(
                              'No ID/Passport Found',
                              style: TextStyle(
                                color: Colors.grey[350],
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.fromLTRB(80, 270, 10, 10),
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        //contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 1),
                                        scrollable: true,
                                        title: Text('Select ID Type'),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                                        ),
                                      content: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child:
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              Container(
                                                height: ScreenSizeConfig.safeBlockVertical*4,
                                                width: ScreenSizeConfig.safeBlockHorizontal*75,
                                                color: Colors.grey[300],
                                                padding: EdgeInsets.all(1.0),
                                                child:
                                                DropdownButton(
                                                  hint: Text('Choose type of ID'), // Not necessary for Option 1
                                                  value: _selectedLocation,
                                                  icon: const Icon(Icons.arrow_drop_down),
                                                  iconSize: 24,
                                                  isExpanded: true,
                                                  dropdownColor: Colors.white,
                                                  onChanged: (String? newValue) {
                                                    setState(() {
                                                      _selectedLocation = newValue;
                                                    });
                                                  },
                                                  items: _locations.map((location) {
                                                    return DropdownMenuItem(
                                                      child: new Text(location),
                                                      value: location,
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                              SizedBox(
                                                height: ScreenSizeConfig.safeBlockVertical*3,
                                              ),
                                              new Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    height: ScreenSizeConfig.safeBlockVertical*4,
                                                    width: ScreenSizeConfig.safeBlockHorizontal*50,
                                                    //color: Colors.grey[300],
                                                    //padding: EdgeInsets.all(1.0),
                                                    child: Text('Select Country',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: ScreenSizeConfig.safeBlockVertical*1,
                                              ),
                                              new Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    height: ScreenSizeConfig.safeBlockVertical*4,
                                                    width: ScreenSizeConfig.safeBlockHorizontal*68,
                                                    color: Colors.grey[300],
                                                    padding: EdgeInsets.all(1.0),
                                                    child:
                                                    DropdownButton(
                                                      hint: Text('Choose your Country'), // Not necessary for Option 1
                                                      value: _selectedLocation,
                                                      icon: const Icon(Icons.arrow_drop_down),
                                                      iconSize: 24,
                                                      isExpanded: true,
                                                      dropdownColor: Colors.white,
                                                      onChanged: (String? newValue) {
                                                        setState(() {
                                                          _selectedLocation = newValue;
                                                        });
                                                      },
                                                      items: _locations.map((location) {
                                                        return DropdownMenuItem(
                                                          child: new Text(location),
                                                          value: location,
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: ScreenSizeConfig.safeBlockVertical*3,
                                              ),
                                              new Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    //padding: EdgeInsets.fromLTRB(100, 150, 10, 10),
                                                    height: ScreenSizeConfig.safeBlockVertical*11,
                                                    //width: ScreenSizeConfig.safeBlockHorizontal*,
                                                    //color: Colors.grey[300],
                                                    child: DottedBorder(
                                                      borderType: BorderType.RRect,
                                                      radius: Radius.circular(12),
                                                      padding: EdgeInsets.all(4),
                                                      strokeWidth: 2,
                                                      color: Colors.grey,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.all(Radius.circular(12)),
                                                        child: Container(
                                                          padding: EdgeInsets.fromLTRB(0, 30, 0, 1),
                                                          height: ScreenSizeConfig.safeBlockVertical*10,
                                                          width: ScreenSizeConfig.safeBlockHorizontal*30,
                                                          color: Colors.white,
                                                          child: Text('     Front of ID',
                                                            style: TextStyle(
                                                              color: Colors.grey,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: ScreenSizeConfig.safeBlockHorizontal*3,
                                                  ),
                                                  Container(
                                                    //padding: EdgeInsets.fromLTRB(100, 150, 10, 10),
                                                    height: ScreenSizeConfig.safeBlockVertical*11,
                                                    //width: ScreenSizeConfig.safeBlockHorizontal*30,
                                                    //color: Colors.grey[300],
                                                    child: DottedBorder(
                                                      borderType: BorderType.RRect,
                                                      radius: Radius.circular(12),
                                                      padding: EdgeInsets.all(4),
                                                      strokeWidth: 2,
                                                      color: Colors.grey,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.all(Radius.circular(12)),
                                                        child: Container(
                                                          padding: EdgeInsets.fromLTRB(0, 30, 0, 1),
                                                          height: ScreenSizeConfig.safeBlockVertical*10,
                                                          width: ScreenSizeConfig.safeBlockHorizontal*30,
                                                          color: Colors.white,
                                                          child: Text('      Back of ID',
                                                            style: TextStyle(
                                                              color: Colors.grey,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: ScreenSizeConfig.safeBlockVertical*3,
                                              ),
                                              new Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[

                                                  Container(
                                                    //padding: EdgeInsets.fromLTRB(100, 150, 10, 10),
                                                    height: ScreenSizeConfig.safeBlockVertical*4,
                                                    width: ScreenSizeConfig.safeBlockHorizontal*50,
                                                    child: Text('ID Number',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: ScreenSizeConfig.safeBlockVertical*1,
                                              ),
                                              new Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[

                                                  Container(
                                                    //padding: EdgeInsets.fromLTRB(100, 150, 10, 10),
                                                    height: ScreenSizeConfig.safeBlockVertical*6,
                                                    width: ScreenSizeConfig.safeBlockHorizontal*68,
                                                    child:
                                                    TextField(
                                                      autocorrect: true,
                                                      decoration: InputDecoration(
                                                        hintText: 'Enter ID Number',
                                                        //prefixIcon: Icon(Icons.lock_outline_rounded),
                                                        hintStyle: TextStyle(color: Colors.grey),
                                                        //suffixIcon: Icon(Icons.visibility),
                                                        filled: true,
                                                        fillColor: Colors.black12,
                                                        enabledBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                          borderSide: BorderSide(color: Colors.white12, width: 2),
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                          borderSide: BorderSide(color: Colors.white12, width: 2),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: ScreenSizeConfig.safeBlockVertical*3,
                                              ),
                                              new Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[

                                                  Container(
                                                    //padding: EdgeInsets.fromLTRB(100, 150, 10, 10),
                                                    height: ScreenSizeConfig.safeBlockVertical*4,
                                                    width: ScreenSizeConfig.safeBlockHorizontal*50,
                                                    child: Text('Expiry Date',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              new Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[

                                                  Container(
                                                    height: ScreenSizeConfig.safeBlockVertical*4,
                                                    width: ScreenSizeConfig.safeBlockHorizontal*15,
                                                    color: Colors.grey[300],
                                                    padding: EdgeInsets.all(1.0),
                                                    child:
                                                    DropdownButton(
                                                      hint: Text(' MM'), // Not necessary for Option 1
                                                      value: _selectedLocation,
                                                      icon: const Icon(Icons.arrow_drop_down),
                                                      iconSize: 24,
                                                      isExpanded: true,
                                                      dropdownColor: Colors.white,
                                                      onChanged: (String? newValue) {
                                                        setState(() {
                                                          _selectedLocation = newValue;
                                                        });
                                                      },
                                                      items: _locations.map((location) {
                                                        return DropdownMenuItem(
                                                          child: new Text(location),
                                                          value: location,
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                  Text(' / '),
                                                  Container(
                                                    height: ScreenSizeConfig.safeBlockVertical*4,
                                                    width: ScreenSizeConfig.safeBlockHorizontal*15,
                                                    color: Colors.grey[300],
                                                    padding: EdgeInsets.all(1.0),
                                                    child:
                                                    DropdownButton(
                                                      hint: Text(' YY'), // Not necessary for Option 1
                                                      value: _selectedLocation,
                                                      icon: const Icon(Icons.arrow_drop_down),
                                                      iconSize: 24,
                                                      isExpanded: true,
                                                      dropdownColor: Colors.white,
                                                      onChanged: (String? newValue) {
                                                        setState(() {
                                                          _selectedLocation = newValue;
                                                        });
                                                      },
                                                      items: _locations.map((location) {
                                                        return DropdownMenuItem(
                                                          child: new Text(location),
                                                          value: location,
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: ScreenSizeConfig.safeBlockVertical*4,
                                                //width: ScreenSizeConfig.safeBlockHorizontal*14,
                                              ),
                                              new Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  SizedBox(
                                                    //height: ScreenSizeConfig.safeBlockVertical*4,
                                                    width: ScreenSizeConfig.safeBlockHorizontal*15,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.fromLTRB(10, 5, 10, 1),
                                                    height: ScreenSizeConfig.safeBlockVertical*5,
                                                    width: ScreenSizeConfig.safeBlockHorizontal*40,
                                                    child: ElevatedButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        'Upload',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      style: ElevatedButton.styleFrom(
                                                          primary: Color.fromRGBO(45, 15, 101, 1),
                                                          padding: EdgeInsets.symmetric(
                                                              horizontal: 40, vertical: 5),
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(8.0),
                                                          ),
                                                          textStyle: TextStyle(
                                                            fontSize: 16,
                                                            letterSpacing: 1,
                                                          )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Text(
                                'Upload',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(45, 15, 101, 1),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 45, vertical: 7),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  textStyle: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 1,
                                  )),
                              //color: Colors.black38,
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                  SizedBox(
                    height: ScreenSizeConfig.safeBlockVertical * 2,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Upload',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black12,
                        padding: EdgeInsets.symmetric(
                            horizontal: 80, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        textStyle: TextStyle(
                          fontSize: 18,
                          letterSpacing: 1.2,
                        )),
                    //color: Colors.black38,
                  ),
                ],
              ),

            Positioned(
              top: 80,
              left: 150,
              //height: ScreenSizeConfig.safeBlockVertical*30,
              //width: ScreenSizeConfig.safeBlockHorizontal*30,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: ScreenSizeConfig.safeBlockVertical * 30,
                    width: ScreenSizeConfig.safeBlockHorizontal * 30,
                    //child: Icon(CustomIcons.option, size: 20,),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: ScreenSizeConfig.safeBlockVertical * 15,
                    width: ScreenSizeConfig.safeBlockHorizontal * 15,
                    child: Image.asset(
                      'assets/takepicture.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      //backgroundColor: Colors.grey[50],
    );
  }
}

