import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:photofy/src/models/User.dart';
import 'package:photofy/src/resources/UserRepository.dart';
// import 'package:photofy/src/ui/screens/ConfirmEmail.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());
  final _repository = UserRepository();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    //Signin
    if (event is Signin) {
      yield UserLoading();
      try {
        print("Inside user Signin try in user_bloc");
        final responseBody =
            await _repository.signin(event.username, event.password);
        print(responseBody);
       // print("Is Email Confirm: ${responseBody['IsEmailConfirm']}");
        //User user = User.fromJson(responseBody);
        User user = User.fromJson(responseBody);
        
        //         "IsAuthenticated": true,
        // "IsEmailConfirm": true,
        print(user.username);

        yield UserLoggedIn(user: user);

        // yield UserVerify(
        //     userId: userId,
        //     isSignup: false,
        //     phoneNum: event.phoneNum,
        //     shouldPush: true);
      } catch (e) {
        print('error in Signin');
        yield LogInError(error: e.toString());
      }
      //Signup
    } else if (event is Signup) {
      yield UserLoading();
      try {
        print("Inside user Signup try in user_bloc");
        User user = await _repository.signup(event.username, event.countrycode, event.dateOfBirth, event.status,
            event.email, event.phoneNumber, event.password);
        //print("User Signup response bloc: ${user.getToken}");
        // yield UserRegistered(confirmed: true, user: user);
        yield UserLoggedIn(user: user);
      } catch (e) {
        print('error in Signup');
        print("Yield login error");
        yield LogInError(error: e.toString());
      }
    }
    //  else if (event is ConfirmingEmail) {
    //   // yield UserLoading();
    //   try {
    //     print("Inside user ConfirmEmail try in user_bloc");
    //     bool isConfirmed = true;
    //        // await _repository.confirmEmail(event.email, "event.token");
    //     yield UserRegistered(confirmed: isConfirmed, user: event.user);
    //   } catch (e) {
    //     print('error in Signup');
    //     print("Yield login error");
    //     // yield LogInError(error: e.toString());
    //   }
    // } else if (event is ConfirmedEmail) {
    //   // yield UserLoading();
    //   try {
    //     print("Inside user ConfirmedEmail try in user_bloc");

    //     yield UserLoggedIn(user: event.user);
    //   } catch (e) {
    //     print('error in Signup');
    //     print("Yield login error");
    //     yield LogInError(error: e.toString());
    //   }
    // }

    //ForgotPassword
    else if (event is ForgotPassword) {
      yield UserLoading();
      try {
        print("Inside user ForgetPassword try in user_bloc");
        final token = await _repository.forgotPassword(event.email);
        yield ChangePassword(token: token, email: event.email);
      } catch (e) {
        print('error in ForgetPassword');
        yield LogInError(error: e.toString());
      }
    }

    //Edit account
    else if (event is EditAccount) {
      final newUser = User(
       // id: event.user.id,
        //token: event.user.token,
        username: event.user.username,
        password: event.user.password,
        dateOfBirth: event.user.dateOfBirth,
        // udid: event.user.udid,
        // nicBack: event.user.nicBack,
        // dlExpiry: event.user.dlBack,
        // nicExpiry: event.user.nicExpiry,
        // nicFront: event.user.nicFront,
        // nicNumber: event.user.nicNumber,
        // dlBack: event.user.dlBack,
        // dlFront: event.user.dlFront,
        // dlNumber: event.user.dlNumber,
        // issuingCountry: event.user.issuingCountry,
        // state: event.user.state,
        // image: event.user.image,
        //firstName: event.fName.isEmpty ? event.user.getFirstName : event.fName,
        //lastName: event.lName.isEmpty ? event.user.getLastName : event.lName,
        phoneNumber:
            event.phoneNum.isEmpty ? event.user.getPhoneNumber : event.phoneNum,
        email: event.email.isEmpty ? event.user.email : event.email,
        countrycode: event.user.countrycode,
        status: event.user.status,
      );
      yield UserEditAccountLoading(user: newUser);
      try {
        final updatedUser =
            await _repository.editProfile(image: event.image!, user: newUser);
        yield UserLoggedIn(user: updatedUser);
      } catch (e) {
        print(e.toString());
        yield EditAccountError(error: e.toString(), user: event.user);
      }
    }

    //license
    else if (event is License) {
      final newUser = User(
        // id: event.user.id,
        // token: event.user.token,
        username: event.user.username,
        password: event.user.password,
        dateOfBirth: event.user.dateOfBirth,
        // udid: event.user.udid,
        // nicBack: event.user.nicBack,
        // dlExpiry: event.dlExpiry,
        // nicExpiry: event.user.nicExpiry,
        // nicFront: event.user.nicFront,
        // nicNumber: event.user.nicNumber,
        // dlBack: event.user.dlBack,
        // dlFront: event.user.dlFront,
        // dlNumber: event.dlNumber,
        // issuingCountry: event.issuingCountry,
        // state: event.user.state,
        // image: event.user.image,
        // firstName: event.user.firstName,
        // lastName: event.user.lastName,
        phoneNumber: event.user.phoneNumber,
        email: event.user.email,
        countrycode: event.user.countrycode,
        status: event.user.status,
      );
      yield UserEditAccountLoading(user: newUser);
      try {
        final updatedUser = await _repository.license(
            dlBack: event.dlBack!, dlFront: event.dlFront!, user: newUser);
        yield UserLoggedIn(user: updatedUser);
      } catch (e) {
        print(e.toString());
        yield UserLoggedIn(user: event.user);
      }
    }

//Passport
    else if (event is Passport) {
      final newUser = User(
        // id: event.user.id,
        // token: event.user.token,
        username: event.user.username,
        password: event.user.password,
        dateOfBirth: event.user.dateOfBirth,
        // udid: event.user.udid,
        // nicBack: event.user.nicBack,
        // dlExpiry: event.user.dlExpiry,
        // nicExpiry: event.user.nicExpiry,
        // nicFront: event.user.nicFront,
        // nicNumber: event.user.nicNumber.isEmpty
        //     ? event.user.getNicNumber
        //     : event.nicNumber,
        // dlBack: event.user.dlBack,
        // dlFront: event.user.dlFront,
        // dlNumber: event.user.dlNumber,
        // issuingCountry: event.user.issuingCountry.isEmpty
        //     ? event.user.getIssuingCountry
        //     : event.issuingCountry,
        // state: event.user.state,
        // image: event.user.image,
        // firstName: event.user.firstName,
        // lastName: event.user.lastName,
        phoneNumber: event.user.phoneNumber,
        email: event.user.email,
        countrycode: event.user.countrycode,
        status: event.user.status,
      );
      yield UserEditAccountLoading(user: newUser);
      try {
        final updatedUser = await _repository.passport(
            nicBack: event.nicBack!, nicFront: event.nicFront!, user: newUser);
        yield UserLoggedIn(user: updatedUser);
      } catch (e) {
        print(e.toString());
        yield UserLoggedIn(user: event.user);
      }
    }

//ResetPassword
    else if (event is ResetPassword) {
      yield UserLoading();
      try {
        print("Inside user ResetPassword try in user_bloc");
        // final userId = await _repository.resetPassword(
        //     event.email, event.password, event.token);
        yield UserInitial();
      } catch (e) {
        print('error in ResetPassword');
        yield LogInError(error: e.toString());
      }
    } else if (event is Logout) {
      yield UserInitial();
    }
  }
}
