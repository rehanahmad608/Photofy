import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:photofy/src/models/User.dart';

// final serverUrl = 'https://weell.co/v1/';
final serverUrl = 'https://penguinity.herokuapp.com/';

class UserProvider {
  // final baseServer = serverUrl + 'User/';
  final baseServer = serverUrl + 'users_auth/';
  // '​User​/';

  // final baseUrl = 'https://weell.co/v1/User/';
  final baseUrl = 'http://api.weell.transviti.com/v1/User/';

  final headers = {
    "Accept": "application/json",
    "content-type": "application/json"
  };

  Future<dynamic> signin(String username, String password) async {
    print("User Provider: SignIn");
    print(username);

    // final fcm = FirebaseMessaging.instance;
    // final token = await fcm.getToken();
    // print('FCM Token: $token');

    try {
      final url = Uri.parse(baseServer + 'signin');

      final body = jsonEncode({"username": username, "password": password});
      print("Before Response");
      final response = await http.post(url, body: body, headers: headers);
      print(response.toString());
      print(response.statusCode);

     // final responseBody = jsonDecode(response.body);
     final responseBody = { "username": username, "password": password};

     // print(responseBody);
      if (response.statusCode == 200) {
        return responseBody;
        // if (responseBody['Status_Code'] == 200) {
        //   return responseBody['Data'];
        // } else {
        //   throw responseBody['Data']['Message'];
        // }
       // print("signin successfull");
      } else {
        throw "status code error signin";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<User> signup(String username, String countrycode, String dateOfBirth,
      String status, String email, String phoneNumber, String password) async {
    // final fcm = FirebaseMessaging.instance;
    // final token = await fcm.getToken();
    // print('FCM Token: $token');
    print("User Provider: SignUp");
    try {
      // print(baseServer + 'register');
      final url = Uri.parse(baseServer + 'signup');

      // print(email + phoneNumber + password);
      // "FirstName": "",
      // "LastName": "",
      // "DateOfBirth": "2021-09-19T11:10:08.577Z",
      // "UdId": "",
      // "NicNumber": "",
      // "NicExpiry": "2021-09-19T11:10:08.577Z ",
      // "NicFront": "",
      // "NicBack": "",
      // "IssuingCountry": "",
      // "State": "",
      // "DlNumber": "",
      // "DlExpiry": "2021-09-19T11:10:08.577Z",
      // "DlFront": "",
      // "DlBack": "",
      // "Image": ""
      final body = jsonEncode({
        "email": email,
        "username": username,
        "country_code": countrycode,
        "date_of_birth": dateOfBirth,
        "status": status,
        "mobile_no": phoneNumber,
        "password": password,
      });
      final response = await http.post(url, body: body, headers: headers);
      // print(response.toString());

      print("Status: ${response.statusCode}");
      //final responseBody = jsonDecode(response.body);
      //print(responseBody);
      // print(responseBody);
      // final responseData = responseBody['data'];
      if (response.statusCode == 200) {
        // print("inside if cond");
        User user;
        // final dataInResponseBody = responseBody['Data'];
        //  if (responseBody['Message'] == "Register Successfully") {
        final dataInResponseBody = {
          
          "email": email,
          "username": username,
          "password": password,
          "country_code": countrycode,
          "date_of_birth": dateOfBirth,
          "status": status,
          "mobile_no": phoneNumber,

        };
        //print("craeted json body");
        try {
          // print("User Provider: ${dataInResponseBody['Token']}");
          user = User.fromJson(dataInResponseBody);
          //print("try success");
        } catch (e) {
          print(e.toString());
          print("Mapping failed");
          user = User.fromJson(dataInResponseBody);
        }
       // print("sending user return");
        return user;
        //  }
        //  else if (responseBody['Message'] == "User already Exist") {
        //   //Todo: any function regarding user already exist
        //   throw responseBody['Message'];
        // } else {
        //   throw responseBody['Message'];
        // }

        // print(user.getToken);

      }
      // return responseBody['data'];
      else {
        throw "if cond fails";
       //print("if cond fails");
      }
    } catch (e) {
      throw e.toString();
    }
    // return '123';
  }

  Future<bool> confirmEmail(String email, String token) async {
    // final fcm = FirebaseMessaging.instance;
    // final token = await fcm.getToken();
    // print('FCM Token: $token');
    print("User Provider: ConfirmEmail");
    try {
      print("Printing token: $token");

      final url = Uri.parse(baseServer + 'confirm-email');
      print(url.toString());
      final body = jsonEncode({
        "Token": token,
        "Email": email,
      });
      final response = await http.post(url, body: body, headers: headers);
      print(response.toString());

      print("Status: ${response.statusCode}");
      final responseBody = jsonDecode(response.body);
      print(responseBody);
      // final responseData = responseBody['data'];
      if (response.statusCode == 200) {
        print(responseBody);
        if (responseBody['Status_Code'] == 200) {
          return responseBody['Data']['Succeeded'];
        } else {
          throw responseBody['Message'];
        }
      } else {
        throw responseBody['Message'];
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> signout() async {
    return;
  }

  Future<String> forgotPassword(String email) async {
    print("User Provider: ForgetPassword");
    print(email);

    try {
      String newurl = serverUrl + "User/forgot-password?email=" + email;

      final response = await http.post(Uri.parse(newurl), headers: headers);
      print(response.toString());

      final responseBody = jsonDecode(response.body);
      print(responseBody);

      if (responseBody['status_code'] == 200)
        return responseBody['data'];
      else {
        throw responseBody['message'];
      }
    } on Exception catch (e) {
      print("error");
      print(e.toString());
      throw e.toString();
    }
  }

  Future<String> resetPassword(
      String email, String password, String token) async {
    print("User Provider: ResetPassword");
    try {
      String newurl = serverUrl + "User/reset-password";
      print(password);

      final body = jsonEncode({
        "Password": password,
        "Email": email,
        "Token": token,
      });

      final response =
          await http.post(Uri.parse(newurl), body: body, headers: headers);
      print(response.toString());

      final responseBody = jsonDecode(response.body);
      print(responseBody);
      if (responseBody['status_code'] == 200)
        return responseBody['data']['Succeeded'].toString();
      else {
        throw responseBody['message'];
      }
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }

  Future<User> editProfile({required User user, required File image}) async {
    print("User Provider: Update User");
    // await Future.delayed(Duration(seconds: 1));
    String base64Image = '';
    // print(user.getFirstName);
    print(user.getEmail);
    print(user.getPhoneNumber);
    //print(user.getId);

    try {
      // ignore: unnecessary_null_comparison
      if (image != null) {
        List<int> imageBytes = await image.readAsBytes();
        base64Image = base64Encode(imageBytes);
      }
      //convert image into Base64
      final url = Uri.parse(baseServer + 'update-user');
      final body = jsonEncode({
        //  "Id": user.getId,
        // "Email": user.getEmail,
        "PhoneNumber": user.getPhoneNumber,
        //"FirstName": user.getFirstName,
        // "LastName": user.getLastName,

        // ignore: unnecessary_null_comparison
        'Image': image == null ? null : base64Image,
      });
      print(body);
      final response = await http.post(url, body: body, headers: headers);
      final responseBody = jsonDecode(response.body);
      print(responseBody);

      if (response.statusCode == 200) {
        print("name");
        return User.fromJson(responseBody);
      } else {
        print("error is this");
        throw responseBody['message'];
      }
    } catch (e) {
      print("exception error");
      print(e.toString());
      throw e.toString();
    }
  }

  Future<User> license(
      {required User user,
      required File imgdlBack,
      required File imgdlFront}) async {
    print("User Provider: License Update");
    // await Future.delayed(Duration(seconds: 1));
    String base64ImageFront = '', base64ImageBack = '';

    //print(user.getId);
    // print(user.getDlExpiry);
    // print(user.getDlFront);
    // print(user.getDlBack);
    // print(user.getIssuingCountry);

    try {
      // ignore: unnecessary_null_comparison
      if (imgdlBack != null && imgdlFront != null) {
        List<int> imageBytes = await imgdlBack.readAsBytes();
        base64ImageBack = base64Encode(imageBytes);
        List<int> imageBytes2 = await imgdlFront.readAsBytes();
        base64ImageFront = base64Encode(imageBytes2);
      }
      print(baseServer);
      //convert image into Base64
      final url = Uri.parse(baseServer + 'update-user');
      final body = jsonEncode({
        // "Id": user.getId,
        // "DlNumber": user.getDlNumber,
        // "LastName": user.getLastName,
        // ignore: unnecessary_null_comparison
        "DlFront": imgdlFront == null ? null : base64ImageFront,
        // ignore: unnecessary_null_comparison
        "DlBack": imgdlBack == null ? null : base64ImageBack,
        // "IssuingCountry": user.getIssuingCountry,
        "DlExpiry": "2021-11-03T13:03:38.509Z",
      });
      print(body);
      final response = await http.post(url, body: body, headers: headers);
      final responseBody = jsonDecode(response.body);
      print(responseBody);
      print("This is response Body");
      if (response.statusCode == 200) {
        print("name");
        return User.fromJson(responseBody);
      } else {
        print("error is this");
        throw responseBody['message'];
      }
    } catch (e) {
      print("exception error");
      print(e.toString());
      throw e.toString();
    }
  }

  Future<User> passport(
      {required User user,
      required File imgnicBack,
      required File imgnicFront}) async {
    print("User Provider: Passport update");
    // await Future.delayed(Duration(seconds: 1));
    String base64ImageFront = '', base64ImageBack = '';

    // print(user.getId);
    // print(user.getNicExpiry);
    // print(user.getNicFront);
    // print(user.getNicBack);
    // print(user.getIssuingCountry);

    try {
      // ignore: unnecessary_null_comparison
      if (imgnicBack != null && imgnicFront != null) {
        List<int> imageBytes = await imgnicBack.readAsBytes();
        base64ImageBack = base64Encode(imageBytes);
        List<int> imageBytes2 = await imgnicFront.readAsBytes();
        base64ImageFront = base64Encode(imageBytes2);
      }
      //convert image into Base64
      final url = Uri.parse(baseServer + 'update-user');
      final body = jsonEncode({
        //    "Id": user.getId,
        // "LastName": user.getLastName,
        // ignore: unnecessary_null_comparison

        //  "NicNumber": user.getNicNumber,
        "NicExpiry": "2021-11-03T13:03:38.509Z",
        // ignore: unnecessary_null_comparison
        "NicFront": imgnicFront == null ? null : base64ImageFront,
        // ignore: unnecessary_null_comparison
        "NicBack": imgnicBack == null ? null : base64ImageBack,
        // "IssuingCountry": user.issuingCountry,
      });
      print(body);
      final response = await http.post(url, body: body, headers: headers);
      final responseBody = jsonDecode(response.body);
      print(responseBody);

      if (response.statusCode == 200) {
        print("name");
        return User.fromJson(responseBody);
      } else {
        print("error is this");
        throw responseBody['message'];
      }
    } catch (e) {
      print("exception error");
      print(e.toString());
      throw e.toString();
    }
  }

//  Future<User> usserupdate(String email, String phoneNumber, String fName,
//     String lName, ) async {
//     // final fcm = FirebaseMessaging.instance;
//     // final token = await fcm.getToken();
//     // print('FCM Token: $token');
//     print("User Provider: SignUp");
//     try {
//       // print(baseServer + 'register');
//       final url = Uri.parse(baseServer + 'update-user');

//       print(email + phoneNumber + fName + lName);
//       // "FirstName": "",
//       // "LastName": "",
//       // "DateOfBirth": "2021-09-19T11:10:08.577Z",
//       // "UdId": "",
//       // "NicNumber": "",
//       // "NicExpiry": "2021-09-19T11:10:08.577Z ",
//       // "NicFront": "",
//       // "NicBack": "",
//       // "IssuingCountry": "",
//       // "State": "",
//       // "DlNumber": "",
//       // "DlExpiry": "2021-09-19T11:10:08.577Z",
//       // "DlFront": "",
//       // "DlBack": "",
//       // "Image": ""
//       final body = jsonEncode({
//         "Email": email,
//         "PhoneNumber": phoneNumber,
//         "FirstName": fName,
//         "LastName": lName,

//       });
//       final response = await http.post(url, body: body, headers: headers);
//       print(response.toString());

//       print("Status: ${response.statusCode}");
//       final responseBody = jsonDecode(response.body);
//       // print(responseBody);
//       // final responseData = responseBody['data'];
//       if (response.statusCode == 200) {
//         // print(responseBody);
//         User user;
//         if (responseBody['Message'] == "Register Successfully") {
//           try {
//             print("User Provider: ${responseBody['Token']}");
//             user = User.fromJson(responseBody);
//           } catch (e) {
//             print(e.toString());
//             print("Mapping failed");
//             user = User.fromJson(responseBody);
//           }
//           return user;
//         } else if (responseBody['Message'] == "User already Exist") {
//           //Todo: any function regarding user already exist
//           throw responseBody['Message'];
//         } else {
//           throw responseBody['Message'];
//         }

//         // print(user.getToken);

//       }
//       // return responseBody['data'];
//       else {
//         throw responseBody['Message'];
//       }
//     } catch (e) {
//       throw e.toString();
//     }
//     // return '123';
//   }

}
