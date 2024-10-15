import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/error_form.dart';
import 'package:ui_ecommerce/components/my_button.dart';
import 'package:ui_ecommerce/components/my_suffix_icon.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/login_succses/succses_screen.dart';
import 'package:ui_ecommerce/sized_config.dart';

class ForgotPwForm extends StatefulWidget {
  const ForgotPwForm({super.key});

  @override
  State<ForgotPwForm> createState() => _ForgotPwFormState();
}

class _ForgotPwFormState extends State<ForgotPwForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
        child: Column(
          children: [
            emailForm(),
            SizedBox(height: getPropScreenHeight(20)),
            ErrorForm(errors: errors),
            SizedBox(height: getPropScreenHeight(20)),
            MyButton(
                text: "Reset Password",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                  if (errors.isEmpty) {
                    Navigator.pushNamed(context, SuccsesScreen.routesName);
                  }
                }),
          ],
        ),
      ),
    );
  }

  TextFormField emailForm() {
    return TextFormField(
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          labelText: "Email",
          hintText: "Enter Your Email",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: CostumSuffixIcon(
            icon: "assets/icons/Mail.svg",
            width: 25,
          )),
    );
  }
}
