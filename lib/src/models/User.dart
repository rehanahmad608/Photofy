// import 'package:flutter/cupertino.dart';

class User {
  //late String id;
  //late String token;
  late String username;
  //late String firstName;
  //late String lastName;
  late String email;
  late String phoneNumber;
  late String password;
  late String dateOfBirth;
  late String countrycode;
  late String status;
  //late String udid;
  //late String nicNumber;
  //late String nicExpiry;
  //late String nicFront;
  //late String nicBack;
  //late String issuingCountry;
  //late String state;
  //late String dlNumber;
  //late String dlExpiry;
  //late String dlFront;
  //late String dlBack;
  //late String image;

  User({
    // required this.id,
    // required this.token,
    required this.username,
    // required this.firstName,
    // required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.dateOfBirth,
    required this.countrycode,
    required this.status,
    // required this.udid,
    // required this.nicNumber,
    // required this.nicExpiry,
    // required this.nicFront,
    // required this.nicBack,
    // required this.issuingCountry,
    // required this.state,
    // required this.dlNumber,
    // required this.dlExpiry,
    // required this.dlFront,
    // required this.dlBack,
    // required this.image,
  });

  User.fromJson(Map<String, dynamic> json) {
    print("state is json");
    //this.id = json['Id'] ?? '';
    //print("response id : ${this.id}");

    //this.token = json['Token'] ?? '';
    //print("response id : ${this.token}");
    // print("User Model: ${json['Token']}");
    this.username = json['userName'] ?? '';
    //this.firstName = json['FirstName'] ?? '';
    //this.lastName = json['LastName'] ?? '';
    this.email = json['email'] ?? '';
    this.phoneNumber = json['mobile_no'] ?? '';
    this.password = json['password'] ?? '';
    print("response id : ${this.password}");
    this.dateOfBirth = json['date_of_birth'] ?? '';
    this.status = json['status'] ?? '';
    this.countrycode = json['country_code'] ?? '';
    //this.udid = json['UdId'] ?? '';
    //this.nicNumber = json['NicNumber'] ?? '';
    //this.nicExpiry = json['NicExpiry'] ?? '';
    //this.nicFront = json['NicFront'] ?? '';
    //this.nicBack = json['NicBack'] ?? '';
    //this.issuingCountry = json['IssuingCountry'] ?? '';
    //this.state = json['State'] ?? '';
    //print("response id : ${this.state}");
    //this.dlNumber = json['DlNumber'] ?? '';
    //this.dlExpiry = json['DlExpiry'] ?? '';
    //this.dlFront = json['DlFront'] ?? '';
    //this.dlBack = json['DlBack'] ?? '';
    //this.image = json['Image'] ?? '';

    // if (json['myLocations'] != null) {
    //   Iterable l = json['myLocations']['mySaveLocations'];
    //   if (l != null && l.isNotEmpty) {
    //     sl.savedLocationList = List<SavedLocations>.from(
    //         l.map((model) => SavedLocations.fromJson(model)));
    //   } else {
    //     sl.savedLocationList = [];
    //   }
    // } else {
    //   sl.savedLocationList = [];
    // }

    // print(this.getName +
    //     ' ' +
    //     this.getmobileNum +
    //     ' ' +
    //     sl.savedLocationList.length.toString());
  }

  // String get getId => this.id;
  // String get getToken => this.token;
  String get getUsername => this.username;
  // String get getFirstName => this.firstName;
  // String get getLastName => this.lastName;
  String get getEmail => this.email;
  //String get getName => this.firstName + ' ' + this.lastName;
  String get getPhoneNumber => this.phoneNumber;
  String get getDateOfBirth => this.dateOfBirth;
  String get getCountryCode => this.countrycode;
  String get getStatus => this.status;
  //String get getUdId => this.udid;
  // String get getNicNumber => this.nicNumber;
  // String get getNicExpiry => this.nicExpiry;
  // String get getNicFront => this.nicFront;
  // String get getNicBack => this.nicBack;
  // String get getIssuingCountry => this.issuingCountry;
  // String get getState => this.state;
  // String get getDlNumber => this.dlNumber;
  // String get getDlExpiry => this.dlExpiry;
  // String get getDlFront => this.dlFront;
  // String get getDlBack => this.dlBack;
  // String get getImage => this.image;
}
