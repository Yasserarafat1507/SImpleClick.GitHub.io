import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/error_form.dart';
import 'package:ui_ecommerce/components/my_button.dart';
import 'package:ui_ecommerce/components/my_suffix_icon.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/login_succses/succses_screen.dart';
import 'package:ui_ecommerce/sized_config.dart';

class completeForm extends StatefulWidget {
  completeForm({super.key});

  @override
  State<completeForm> createState() => _completeFormState();
}

class _completeFormState extends State<completeForm> {
  String? name;

  String? phoneNumber;

  String? address;

  final _formKey = GlobalKey<FormState>();

  List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            NameField(),
            SizedBox(
              height: getPropScreenHeight(20),
            ),
            phoneNumberField(),
            SizedBox(
              height: getPropScreenHeight(20),
            ),
            addresFormField(),
            SizedBox(
              height: getPropScreenHeight(20),
            ),
            ErrorForm(errors: errors),
            SizedBox(
              height: getPropScreenHeight(20),
            ),
            MyButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }

                if (errors.isEmpty) {
                  Navigator.pushNamed(
                    context,
                    SuccsesScreen.routesName,
                    arguments: {"name": "John Doe"}, // Argumen harus disediakan
                  );
                }
              },
            ),
          ],
        ));
  }

  TextFormField addresFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kAddressNullError)) {
          setState(() {
            errors.remove(kAddressNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kAddressNullError)) {
          setState(() {
            errors.add(kAddressNullError);
          });
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Addrest",
          hintText: "Enter Your Addrest",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: CostumSuffixIcon(
            icon: "assets/icons/Location point.svg",
            width: 20,
          )),
    );
  }

  TextFormField phoneNumberField() {
    return TextFormField(
      onSaved: (newValue) => phoneNumber = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPhoneNumberNullError)) {
          setState(() {
            errors.remove(kPhoneNumberNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPhoneNumberNullError)) {
          setState(() {
            errors.add(kPhoneNumberNullError);
          });
        }
        return null;
      },
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          labelText: "Phone Number",
          hintText: "Enter Your First Name",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: CostumSuffixIcon(
            icon: "assets/icons/Phone.svg",
            width: 20,
          )),
    );
  }

  TextFormField NameField() {
    return TextFormField(
      onSaved: (newValue) => name = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kNameNullError)) {
          setState(() {
            errors.remove(kNameNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kNameNullError)) {
          setState(() {
            errors.add(kNameNullError);
          });
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Name",
          hintText: "Enter Your Name",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: CostumSuffixIcon(
            icon: "assets/icons/User.svg",
            width: 20,
          )),
    );
  }
}
