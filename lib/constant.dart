import "package:flutter/material.dart";
import "package:ui_ecommerce/sized_config.dart";

const kPrimaryColor = Colors.green;
const kBgColor = Color.fromARGB(255, 217, 217, 217);
const kPrimaryLightColor = Color(0xffffecdf);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color.fromARGB(255, 72, 248, 19), Color(0xffffecdf)],
);

const kSecoundaryColor = Color(0xff979797);
const kTextColor = Color.fromARGB(255, 0, 0, 0);
const kAnimationDuration = Duration(milliseconds: 200);

const Color inActiveIconColor = Color(0xffb6b6b6);

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
// email
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
// pw
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
// complete
const String kNameNullError = "Please enter your First Name";
const String kPhoneNumberNullError = "Please enter your Phone Number";
const String kAddressNullError = "Please enter your Address";

final headingStyle = TextStyle(
  fontSize: getPropScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final otpDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(
    vertical: getPropScreenWidth(15),
  ),
  enabledBorder: otpInput(),
  focusedBorder: otpInput(),
  border: otpInput(),
);

OutlineInputBorder otpInput() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: kTextColor),
  );
}

final defaultDuration = Duration(milliseconds: 250);

// const for dee more

TextStyle seeMoreStyle = TextStyle(
    fontSize: getPropScreenWidth(16),
    fontWeight: FontWeight.bold,
    color: kPrimaryColor);
