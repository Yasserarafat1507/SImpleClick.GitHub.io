import 'package:flutter/material.dart';
import 'package:ui_ecommerce/components/error_form.dart';
import 'package:ui_ecommerce/components/my_button.dart';
import 'package:ui_ecommerce/components/my_suffix_icon.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/forgot/forgot_screen.dart';
import 'package:ui_ecommerce/screens/login_succses/succses_screen.dart';
import 'package:ui_ecommerce/sized_config.dart';

class SingInForm extends StatefulWidget {
  const SingInForm({super.key});

  @override
  State<SingInForm> createState() => _SingInFormState();
}

class _SingInFormState extends State<SingInForm> {

  final _formKey = GlobalKey<FormState>();
  String? email;
  bool remember = false;
  String? password;
  final List<String>  errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
                child: Column(
                  children: [
                    //Email
                    emailForm(),
                    SizedBox(height: getPropScreenHeight(30)),
                    //Password
                    pwForm(),
                    SizedBox(height: getPropScreenHeight(30)),
                    //Remember
                    rememberMe(),
                    SizedBox(height: getPropScreenHeight(20)),
                    // Error Form
                    ErrorForm(errors: errors),
                    SizedBox(height: getPropScreenHeight(20)),
                    //Login Button
                    MyButton(text: "Sing In", press: () {
                      if  (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                      if (errors.isEmpty) {
                        Navigator.pushNamed(context, SuccsesScreen.routesName);
                      }
                    })
                  ]
                )
              );
  }

  Row rememberMe() {
    return Row(
                  children: [
                    Checkbox(
                      value: remember,
                      onChanged: (value) {
                            setState(() {
                              remember = value!;
                            });
                      },
                      activeColor:  kPrimaryColor,
                    ),
                    const Text("Remember me",),
                    const Spacer(),
                    GestureDetector(
                    onTap :() {
                      Navigator.pushNamed(context, ForgotScreen.routesName);
                    },
                    child: const Text(
                      "Forgot Password", 
                      style: TextStyle(
                        decoration: TextDecoration.underline
                        ),
                      ),
                    ),
                  ],
                );
  }

  TextFormField pwForm() {
    return TextFormField(
                      onChanged: (value){
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

  TextFormField emailForm() {
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