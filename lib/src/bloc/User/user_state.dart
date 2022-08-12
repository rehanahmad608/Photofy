part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class ShowSplashScreen extends UserState {}

class UserLoading extends UserState {}

class UserRegistered extends UserState {
  final bool confirmed;
  final User user;
  UserRegistered({required this.confirmed, required this.user});
}

class UserResndingOTP extends UserState {}

// class UserImageUploading extends UserState {
//   final User user;
//   UserImageUploading({@required this.user});
// }

// class UserVerify extends UserState {
//   final String userId;
//   final bool isSignup;
//   final String phoneNum;
//   final bool shouldPush;
//   UserVerify({
//     @required this.userId,
//     @required this.isSignup,
//     @required this.phoneNum,
//     @required this.shouldPush,
//   });
// }

// class UserResendOTP extends UserState {
//   final userId;
//   final isSignup;
//   final phoneNum;
//   UserResendOTP(
//       {@required this.userId,
//       @required this.isSignup,
//       @required this.phoneNum});
// }

// class UserUploadPicture extends UserState {
//   final User user;
//   UserUploadPicture({@required this.user});
// }

class UserLoggedIn extends UserState {
  final User user;
  UserLoggedIn({required this.user});
}

class LogInError extends UserState {
  final String error;
  LogInError({required this.error});
}

class ChangePassword extends UserState {
  final String token, email;
  ChangePassword({required this.token, required this.email});
}

class UserEditAccountLoading extends UserState {
  final User user;
  UserEditAccountLoading({required this.user});
}

class EditAccountError extends UserState {
  final String error;
  final User user;
  EditAccountError({required this.error, required this.user});
}

class LicenseError extends UserState {
  final String error;
  final User user;
  LicenseError({required this.error, required this.user});
}

class PassportError extends UserState {
  final String error;
  final User user;
  PassportError({required this.error, required this.user});
}
