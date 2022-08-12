import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photofy/src/ui/configs/ScreenSizeConfig.dart';
import 'package:photofy/src/ui/configs/Theme.dart';
//import 'package:camera/camera.dart';
import 'dart:io';

class EditorPage extends StatefulWidget {
 final String imagePath;

  const EditorPage({Key? key, required this.imagePath}) : super(key: key);

  @override
  _EditorPageState createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
 final String imagePath = "";
  String buttontype = "";
  Map<String,PickedFile?>imageFiles = {"Image":null};
 final ImagePicker _picker = ImagePicker();
  dynamic _pickImageError;

   Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: source,

      );
      setState(() {

        //setImageExt.add(pickedFile);
      imageFiles[buttontype] = pickedFile as PickedFile?;
      });

    } catch (e) {
      setState(() {

        _pickImageError = e;
        print(_pickImageError.toString());
      });

    }
  }
  
   Widget selectImageButton(String text, IconData icon, ImageSource source) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(5),
        width: ScreenSizeConfig.safeBlockHorizontal * 100,
        height: ScreenSizeConfig.safeBlockVertical * 8,
        child: ElevatedButton(
          onPressed: () async {
            await pickImage(source);
            Navigator.of(this.context).pop();
          },
          style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all<Color>(theme.primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          child: SizedBox.expand(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  text,
                ),
                Icon(icon, size: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }
 Widget uploadimages(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(10),
      //                   color: Colors.black.withOpacity(0.3)),
      height: ScreenSizeConfig.safeBlockVertical * 34,
      width: ScreenSizeConfig.safeBlockHorizontal * 100,
      child: Wrap(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Center(
              child: Text(
                'Select a photo',
                style: theme.textTheme.headline3?.merge(TextStyle(
                  color: Colors.white,
                ))
              ),
            ),
          ),
          Divider(thickness: 2),
          selectImageButton(
              'Take Photo', Icons.camera_alt, ImageSource.camera),
          selectImageButton(
              'Choose from Gallery', Icons.image, ImageSource.gallery),
          cancelButton(),
        ],
      ),
    );
  }
   Widget cancelButton() {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        width: ScreenSizeConfig.safeBlockHorizontal * 100,
        height: ScreenSizeConfig.safeBlockVertical * 10,
        child: ElevatedButton(
          onPressed: () async {
            Navigator.of(this.context).pop();
          },
          style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.3),),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            // foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          ),
          child: Center(
            child: Text(
              'Cancel',
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 6,
      child: Scaffold(
        appBar: AppBar(
        backgroundColor: photofyPurple.withOpacity(0.5),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.close),
        ),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: Icon(Icons.save),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.forward),
          ),
        ],
          ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: ScreenSizeConfig.safeBlockVertical*60,
                width: ScreenSizeConfig.safeBlockHorizontal*100,
                child: (widget.imagePath == "")?
                                Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  buttontype = "Image";
                                                  showDialog(context: context, builder: (BuildContext context)
                                                  {
                                                    return new AlertDialog(
                                                      //title: new Text("My Super title"),
                                                      backgroundColor:Colors.black.withOpacity(0.3),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.all(Radius.circular(10.0))),
                                                      content: uploadimages(context),
                                                    );
                                                  });
                                                },
                                                child: (imageFiles["Image"] != null)
                                                    ? Container(
                                                    child: Image.file(
                                                      File(imageFiles["Image"]!.path),
                                                      fit: BoxFit.fitWidth,
                                                      width: ScreenSizeConfig.safeBlockHorizontal*99.99,
                                                      height: ScreenSizeConfig.safeBlockVertical*60,
                                                    ))
                                                    :
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text('Add a Photo',
                                                            style: theme.textTheme.bodyText1?.merge(TextStyle(
                                                              fontWeight: FontWeight.w400,
                                                              color: Colors.grey,
                                                              fontSize: 30,
                                                            ))
                                                        ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                        )     
                :
                Image.file(File(widget.imagePath)),
              ),
              Container(
                height: ScreenSizeConfig.safeBlockVertical*29,
                child: TabBarView(children: [
                Container(
                  color: Colors.red,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(width: ScreenSizeConfig.safeBlockHorizontal*2,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        color:Colors.yellow,
                                        height: ScreenSizeConfig.safeBlockVertical*20,
                                        width: ScreenSizeConfig.safeBlockHorizontal*20,
                                      ),
                                      SizedBox(height: ScreenSizeConfig.safeBlockVertical*2,),
                                      Text('Preset 1',
                                      style: TextStyle(
                                        color:Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      )
                                    ],
                                  ),
                                  SizedBox(width: ScreenSizeConfig.safeBlockHorizontal*2,),
                                   Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        color:Colors.yellow,
                                        height: ScreenSizeConfig.safeBlockVertical*20,
                                        width: ScreenSizeConfig.safeBlockHorizontal*20,
                                      ),
                                      SizedBox(height: ScreenSizeConfig.safeBlockVertical*2,),
                                      Text('Preset 2',
                                      style: TextStyle(
                                        color:Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      )
                                    ],
                                  ),
                                  SizedBox(width: ScreenSizeConfig.safeBlockHorizontal*2,),
                                   Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        color:Colors.yellow,
                                        height: ScreenSizeConfig.safeBlockVertical*20,
                                        width: ScreenSizeConfig.safeBlockHorizontal*20,
                                      ),
                                      SizedBox(height: ScreenSizeConfig.safeBlockVertical*2,),
                                      Text('Preset 3',
                                      style: TextStyle(
                                        color:Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ),
                ),
                 Container(
                  color: Colors.blue,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Tools'),
                           
                          ],
                        ),
                      ],
                    ),
                    ),
                ),
                Container(
                  color: Colors.green,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Styles'),
                           
                          ],
                        ),
                      ],
                    ),
                    ),
                ),
                Container(
                  color: Colors.yellow,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Frames'),
                           
                          ],
                        ),
                      ],
                    ),
                    ),
                ),
                 Container(
                  color: Colors.pink,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Stickers'),
                           
                          ],
                        ),
                      ],
                    ),
                    ),
                ),
                 Container(
                  color: Colors.purple,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Magic'),
                           
                          ],
                        ),
                      ],
                    ),
                    ),
                ),
                ]),
                
              ),
              Container(
                color: Colors.black,
                height: ScreenSizeConfig.safeBlockVertical*5,
                child: TabBar(
                  isScrollable: true,
                  indicator: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  tabs:[
                  Tab(text: 'Presets',),
                  Tab(text: 'Tools',),
                  Tab(text: 'Styles',),
                  Tab(text: 'Frames',),
                  Tab(text: 'Stickers',),
                  Tab(text: 'Magic',),
                ]),
              ),
            ],
          ),
    
        ),
      ),
    );
  }
}
