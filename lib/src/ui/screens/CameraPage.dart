import 'package:camera/camera.dart';
import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:photofy/src/ui/configs/ScreenSizeConfig.dart';
import 'package:photofy/src/ui/configs/Theme.dart';
import 'package:photofy/src/ui/screens/DiscoverPage.dart';
import 'package:photofy/src/ui/screens/EditorPage.dart';
import 'package:photofy/src/ui/screens/UserPage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:extended_image_library/extended_image_library.dart';
//import 'package:image_editor_pro/image_editor_pro.dart';
//import 'package:path_provider/path_provider.dart';
//import 'package:path/path.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late List<CameraDescription> _cameras;
  late CameraController _controller;
  bool _isReady = false;
  bool frontCamera = false;
  bool flash = false;
  String buttontype = "";
  Map<String, PickedFile?> imageFiles = {
    "Front": null,
    "Back": null,
    "Front ID": null,
    "Back ID": null
  };
  final ImagePicker _picker = ImagePicker();
  dynamic _pickImageError;
  bool isrecording = false;

  @override
  void initState() {
    frontCamera = false;
    flash = false;
    super.initState();
    _getBackCamera();
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _getFrontCamera() async {
    try {
      // initialize cameras.
      _cameras = await availableCameras();
      // initialize camera controllers.
      // Current bug for high / medium with samsung devices.
      _controller = CameraController(
        _cameras[1],
        ResolutionPreset.high,
      );

      await _controller.initialize();
    } on CameraException catch (_) {
      // do something on error.
    }
    if (!mounted) return;
    setState(() {
      _isReady = true;
    });
  }

  void _getBackCamera() async {
    try {
      // initialize cameras.
      _cameras = await availableCameras();
      // initialize camera controllers.
      // Current bug for high / medium with samsung devices.
      _controller = CameraController(
        _cameras[0],
        ResolutionPreset.high,
      );

      await _controller.initialize();
    } on CameraException catch (_) {
      // do something on error.
    }
    if (!mounted) return;
    setState(() {
      _isReady = true;
    });
  }

  void _setFlashOn() async {
    print('Flash ON');
    try {
      // initialize cameras.
      _cameras = await availableCameras();
      // initialize camera controllers.
      // Current bug for high / medium with samsung devices.
      _controller.setFlashMode(FlashMode.torch);
      await _controller.initialize();
    } on CameraException catch (_) {
      // do something on error.
    }
    if (!mounted) return;
    setState(() {
      _isReady = true;
    });
  }

  void _setFlashOff() async {
    print("Flash OFF");
    try {
      // initialize cameras.
      _cameras = await availableCameras();
      // initialize camera controllers.
      // Current bug for high / medium with samsung devices.
      _controller.setFlashMode(FlashMode.off);
      await _controller.initialize();
    } on CameraException catch (_) {
      // do something on error.
    }
    if (!mounted) return;
    setState(() {
      _isReady = true;
    });
  }

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
            //  backgroundColor:
            // MaterialStateProperty.all<Color?>?(theme.primaryColor),
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
      height: ScreenSizeConfig.safeBlockVertical * 28,
      width: ScreenSizeConfig.safeBlockHorizontal * 100,
      child: Wrap(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Center(
              child: Text('Select a photo',
                  style: theme.textTheme.headline3?.merge(TextStyle(
                    color: Colors.white,
                  ))),
            ),
          ),
          Divider(thickness: 2),
          // selectImageButton(
          //     'Take Photo', Icons.camera_alt, ImageSource.camera),
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
            // backgroundColor:
            // MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.3),),
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

  void _takePhoto() async {
    late File _image;
    print("pic");
    try {
      // Ensure that the camera is initialized.
      _cameras = await availableCameras();
      // Attempt to take a picture and then get the location
      // where the image file is saved.
      final image = await _controller.takePicture();
      // If the picture was taken, display it on a new screen.
      await Navigator.of(this.context).push(
        MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(
            // Pass the automatically generated path to
            // the DisplayPictureScreen widget.
            imagePath: image.path,
          ),
        ),
      );
      File tmpFile = File(image.path);
      tmpFile = await tmpFile.copy(tmpFile.path);

      setState(() {
        _image = tmpFile;
      });
    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  }

  late File _video;
  void _recordVideo() async {
    print("video");
    try {
      // Ensure that the camera is initialized.
      _cameras = await availableCameras();
      // Attempt to take a picture and then get the location
      // where the image file is saved

      await _controller.startVideoRecording();
    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  }
// Future<void> getimageditor() =>
//       Navigator.push(context, MaterialPageRoute(builder: (context) {
//         return ImageEditorPro(
//           appBarColor: Colors.black87,
//           bottomBarColor: Colors.black87,
//           pathSave: null,
//         );
//       })).then((geteditimage) {
//         if (geteditimage != null) {
//           setState(() {
//             _image = geteditimage;
//           });
//         }
//       }).catchError((er) {
//         print(er);
//       });
  // imgFromGallery() async {
  //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);

  //   if (image != null) {
  //     setState(() {
  //       imglyEditor(image.path);
  //     });
  //   }
  // }
  // void imglyEditor(image) async {
  //   await PESDK.openEditor(image: image);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: getFooter(),
      body: getBody(),
    );
  }

  Widget cameraPreview() {
    return AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: CameraPreview(_controller));
  }

  Widget getBody() {
    var size = MediaQuery.of(this.context).size;
    if (_isReady == false || !_controller.value.isInitialized) {
      return Container(
        decoration: BoxDecoration(color: Colors.white),
        width: size.width,
        height: size.height,
        child: Center(
            child: SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ))),
      );
    }

    return Container(
      width: size.width,
      height: size.height,
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          child: cameraPreview()),
    );
  }

  Widget getFooter() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        this.context,
                        MaterialPageRoute(builder: (context) => UserPage()),
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.3)),
                      child: Icon(
                        Icons.person,
                        color: Colors.yellow,
                        size: 23,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        this.context,
                        MaterialPageRoute(builder: (context) => DiscoverPage()),
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.3)),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 23,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black.withOpacity(0.3)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (frontCamera == true) {
                                  frontCamera = false;
                                } else {
                                  frontCamera = true;
                                }
                              });
                              frontCamera
                                  ? _getFrontCamera()
                                  : _getBackCamera();
                            },
                            child: Icon(
                              Icons.refresh,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (flash == true) {
                                  flash = false;
                                } else {
                                  flash = true;
                                }
                              });
                              flash ? _setFlashOn() : _setFlashOff();
                            },
                            child: Icon(
                              Icons.flash_on,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  showDialog(
                      context: this.context,
                      builder: (BuildContext context) {
                        return new AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          backgroundColor: Colors.black.withOpacity(0.3),
                          content: uploadimages(context),
                        );
                      });
                },
                icon: Icon(
                  Icons.image,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              GestureDetector(
                onLongPress: () {
                  _recordVideo();
                  setState(() {
                    isrecording = true;
                  });
                },
                onLongPressUp: () async {
                  if (_controller.value.isRecordingVideo) {
                    XFile videoFile = await _controller.stopVideoRecording();
                    await Navigator.of(this.context).push(MaterialPageRoute(
                      builder: (context) => DisplayVideoScreen(
                        videoPath: videoFile.path,
                      ),
                    ));
                    //print(videoFile.path);//and there is more in this XFile object
                  }
                  setState(() {
                    isrecording = false;
                  });
                },
                onTap: () {
                  if (!isrecording) {
                    _takePhoto();
                  }
                },
                child: isrecording
                    ? Icon(
                        Icons.radio_button_on,
                        color: Colors.red,
                        size: 80,
                      )
                    : Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 7, color: Colors.white)),
                      ),
              ),
              SizedBox(
                width: 15,
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.emoji_emotions,
                  color: Colors.white,
                  size: 28,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.3),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.close),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.crop),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditorPage(
                          imagePath: imagePath,
                        )),
              );
              // imglyEditor(imagePath);
              // PESDK.openEditor(image: imagePath);
            },
            icon: Icon(Icons.forward),
          ),
        ],
      ),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Container(
        child: Column(
          children: [
            Container(
              width: ScreenSizeConfig.safeBlockHorizontal * 100,
              height: ScreenSizeConfig.safeBlockVertical * 80,
              child: Image.file(
                File(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.save,
          color: Colors.white,
          size: 29,
        ),
        backgroundColor: Colors.blue.withOpacity(0.3),
        //tooltip: 'Save Picture',
        elevation: 5,
        //splashColor: Colors.grey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayVideoScreen extends StatefulWidget {
  final String videoPath;

  const DisplayVideoScreen({Key? key, required this.videoPath})
      : super(key: key);

  @override
  State<DisplayVideoScreen> createState() => _DisplayVideoScreenState();
}

class _DisplayVideoScreenState extends State<DisplayVideoScreen> {
  late VideoPlayerController _videoController;
  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.3),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.close),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.cut),
          ),
          IconButton(
            onPressed: () {
              //  Navigator.push( context,MaterialPageRoute(builder: (context) => EditorPage(imagePath: widget.videoPath,)),
              //  );
            },
            icon: Icon(Icons.forward),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: ScreenSizeConfig.safeBlockHorizontal * 100,
                  height: ScreenSizeConfig.safeBlockVertical * 80,
                  child: _videoController.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _videoController.value.aspectRatio,
                          child: VideoPlayer(_videoController),
                        )
                      : Container(),
                ),
                Container(
                  alignment: AlignmentDirectional.center,
                  width: ScreenSizeConfig.safeBlockHorizontal * 100,
                  height: ScreenSizeConfig.safeBlockVertical * 80,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _videoController.value.isPlaying
                            ? _videoController.pause()
                            : _videoController.play();
                      });
                    },
                    child: CircleAvatar(
                      radius: 33,
                      backgroundColor: Colors.black38,
                      child: Icon(
                        _videoController.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow_sharp,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.save,
          color: Colors.white,
          size: 29,
        ),
        backgroundColor: Colors.blue.withOpacity(0.3),
        //tooltip: 'Save Picture',
        elevation: 5,
        //splashColor: Colors.grey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
