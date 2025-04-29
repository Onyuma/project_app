class Biodata {
  late String firstName;
  late String lastName;
  late String emailAddress;
  late int phoneNumber;
  late String gender;
  late String userName;

  Biodata.fromUser(Map<String, dynamic> userData) {
    firstName = userData['firstName'];
    lastName = userData['lastName'];
    emailAddress = userData['emailAddress'];
    phoneNumber = userData['phoneNumber'];
    gender = userData['gender'];
    userName = userData['userName'];
  }

  Biodata.fromDb(Map<String, dynamic> userData) {
    firstName = userData['first_name'];
    lastName = userData['last_name'];
    emailAddress = userData['email_address'];
    phoneNumber = userData['phone_number'];
    gender = userData['gender'];
    userName = userData['user_name'];
  }

  Map<String, dynamic> intoDb() {
    return <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'email_address': emailAddress,
      'phone_number': phoneNumber,
      'gender': gender,
      'user_name': userName
    };
  }

  static List<String> genderList = [
    'Male',
    'Female',
  ];
}
