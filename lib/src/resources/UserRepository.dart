import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:photofy/src/bloc/User/user_bloc.dart';
import 'package:photofy/src/models/User.dart';
// import 'package:photofy/src/ui/screens/ConfirmEmail.dart';
import 'dart:async';

import 'UserProvider.dart';

class UserRepository {
  final userProvider = UserProvider();
  Future<dynamic> signin(String email, String password) =>
      userProvider.signin(email, password);
  Future<User> signup(String username, String countrycode, String dateOfBirth, String status, String email, String phoneNumber, String password) =>
      userProvider.signup(username, countrycode, dateOfBirth, status, email, phoneNumber, password);
  Future<bool> confirmEmail(String email, String token) =>
      userProvider.confirmEmail(email, token);
  // ignore: non_constant_identifier_names
  Future<String> forgotPassword(String email) =>
      userProvider.forgotPassword(email);
  Future<String> resetPassword(String email, String password, String token) =>
      userProvider.resetPassword(email, password, token);
  Future<User> editProfile({required User user, required File image}) =>
      userProvider.editProfile(user: user, image: image);
  Future<User> license(
          {required User user, required File dlBack, required File dlFront}) =>
      userProvider.license(user: user, imgdlBack: dlBack, imgdlFront: dlFront);
  Future<User> passport(
          {required User user,
          required File nicBack,
          required File nicFront}) =>
      userProvider.passport(
          user: user, imgnicBack: nicBack, imgnicFront: nicFront);
  // Future<User> getUser(String userId) => userProvider.getUser(userId);
  // Future<String> signin(String phoneNum) => userProvider.signin(phoneNum);
  // Future<String> signup(String fName, String lName, String phoneNum) =>
  //     userProvider.signup(fName, lName, phoneNum);
  // Future<void> signout() => userProvider.signout();
  // Future<User> verify(String userId, String code) =>
  //     userProvider.verifyUser(userId, code);
  // Future<void> resendOtp(String phoneNum) => userProvider.resendOtp(phoneNum);
  // Future<String> uploadProilePicture(String userId, File image) =>
  //     userProvider.uploadProfilePicture(userId, image);
  // Future<User> editProile({@required User user, @required File image}) =>
  //     userProvider.editProfile(user: user, image: image);
}
