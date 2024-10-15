import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/error_form.dart';
import 'package:ui_ecommerce/components/my_button.dart';
import 'package:ui_ecommerce/components/my_suffix_icon.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/complit/complit_screen.dart';
import 'package:ui_ecommerce/sized_config.dart';

class signUpForm extends StatefulWidget {
  const signUpForm({super.key});

  @override
  State<signUpForm> createState() => _signUpFormState();
}

class _signUpFormState extends State<signUpForm> {
  String? email;
  String? password;
  String? confirmPassword;

  final _formKey = GlobalKey<FormState>();
  // agar semuanya yang berada di dalam form agar ke teriger ke form key jadi bisa terdaftar di dalam formkey
  List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          emailFormField(),
          SizedBox(
            height: getPropScreenHeight(30),
          ),
          pwFormField(),
          SizedBox(
            height: getPropScreenHeight(30),
          ),
          pwComfirmFormField(),
          SizedBox(
            height: getPropScreenHeight(20),
            ),
          ErrorForm(errors: errors),
          MyButton(text: "Continue", press: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
            }

            if (errors.isEmpty) {
              Navigator.pushNamed(context, ComplitScreen.routesName);
            }
          })
        ],
      ),
    );
  }

  TextFormField pwComfirmFormField() {
    return TextFormField(
                  onSaved: (newValue) => confirmPassword =  newValue,
                  onChanged: (value) {
                    if (password == value) {
                      setState(() {
                        errors.remove(kMatchPassError);
                      });
                    }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    } else if (value != password || errors.contains(kMatchPassError)) {
                      setState(() {
                        errors.add(kMatchPassError);
                      });
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password Confirmation",
                    hintText: "Re-Enter Your Password",
                    
                    floatingLabelBehavior: 
                    FloatingLabelBehavior.auto,
                    suffixIcon: 
                    CostumSuffixIcon(icon: "assets/icons/Lock.svg", width: 20,)
                    ),
                  );
  }

  TextFormField pwFormField() {
    return TextFormField(
                  onSaved: (newValue)  => password = newValue!,
                  onChanged: (value){
                    setState(() {
                      password = value;
                    });
                    if (value.isEmpty && errors.contains(kPassNullError)) {
                      setState(() {
                        errors.remove(kPassNullError);
                      });
                    } else if (value.length >= 8 && errors.contains(kShortPassError)){
                      setState(() {
                        errors.remove(kShortPassError);
                      });
                    }
                    return;
                  },
                  validator: (value) {
                    if (value!.isEmpty && !errors.contains(kPassNullError)) {
                      setState(() {
                        errors.add(kPassNullError);
                      });
                      return "";
                    } else if  (value.length < 8 && (!errors.contains(kPassNullError) && !errors.contains(kShortPassError))) {
                      setState(() {
                        errors.add(kShortPassError);
                      });
                      return "";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "Enter Your Password",
                    
                    floatingLabelBehavior: 
                    FloatingLabelBehavior.auto,
                    suffixIcon: 
                    CostumSuffixIcon(icon: "assets/icons/Lock.svg", width: 20,)
                    ),
                  );
  }

  TextFormField emailFormField() {
    return TextFormField(
                  onSaved: (newValue) =>  email = newValue!,
                  onChanged: (value) {
                    if  (value.isNotEmpty && errors.contains(kEmailNullError)) {
                      setState(() {
                        errors.remove(kEmailNullError);
                      });
                    } else if  (emailValidatorRegExp.hasMatch(value) && errors.contains(kInvalidEmailError)) {
                      setState(() {
                        errors.remove(kInvalidEmailError);
                      });
                    }
                    return;
                  },
                  validator: (value) {
                    if  (value!.isEmpty && !errors.contains(kEmailNullError)) {
                      setState(() {
                        errors.add(kEmailNullError);
                      });
                      return "";
                    } else if   (!emailValidatorRegExp.hasMatch(value) && !errors.contains(kInvalidEmailError)) {
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
                    
                    floatingLabelBehavior: 
                    FloatingLabelBehavior.auto,
                    suffixIcon: 
                    CostumSuffixIcon(icon: "assets/icons/Mail.svg", width: 25,)
                    ),
                  );
  }
}