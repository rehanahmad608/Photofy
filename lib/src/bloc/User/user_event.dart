part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class Signin extends UserEvent {
  final String username, password;
  Signin({required this.username, required this.password});
}

class Signup extends UserEvent {
  final String email, phoneNumber, password, username, status, countrycode, dateOfBirth;
  Signup(
      {required this.email, required this.phoneNumber, required this.password, required this.username, required this.countrycode, required this.dateOfBirth, required this.status });
}

// ignore: must_be_immutable
class ConfirmingEmail extends UserEvent {
  final String email;// token;
  User user;
  ConfirmingEmail(
      {required this.email,  required this.user}); //required this.token,
}

class ConfirmedEmail extends UserEvent {
  final User user;
  ConfirmedEmail({required this.user});
}

class ForgotPassword extends UserEvent {
  final String email;
  ForgotPassword({required this.email});
}

class ResetPassword extends UserEvent {
  final String email, password, token;
  ResetPassword(
      {required this.email, required this.password, required this.token});
}

class EditAccount extends UserEvent {
  final File? image;
  final String fName;
  final String lName;
  final String phoneNum;
  final String email;
  final User user;

  EditAccount(
      {required this.image,
      required this.user,
      required this.email,
      required this.fName,
      required this.lName,
      required this.phoneNum});
}

class License extends UserEvent {
  final File? dlBack;
  final File? dlFront;
  final String dlNumber;
  final String dlExpiry;
  final String issuingCountry;
  final User user;
  License({
    required this.user,
    required this.dlBack,
    required this.dlFront,
    required this.dlExpiry,
    required this.dlNumber,
    required this.issuingCountry,
  });
}

class Passport extends UserEvent {
  final File? nicBack;
  final File? nicFront;
  final String nicNumber;

  final String nicExpiry;
  final String issuingCountry;
  final User user;
  Passport({
    required this.user,
    required this.nicBack,
    required this.nicFront,
    required this.nicExpiry,
    required this.nicNumber,
    required this.issuingCountry,
  });
}

class UploadProfilePicture extends UserEvent {
  final File image;
  final User user;
  UploadProfilePicture({required this.image, required this.user});
}

class Logout extends UserEvent {}
