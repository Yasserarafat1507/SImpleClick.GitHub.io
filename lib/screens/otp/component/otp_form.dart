import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_ecommerce/components/my_button.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/home/home.dart';
import 'package:ui_ecommerce/sized_config.dart';

class OtpForm extends StatefulWidget {
  OtpForm({super.key});

  

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final _formKey =  GlobalKey<FormState>();

  final List<String?> otp =List.filled(4, null);
  

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:
              List.generate(
              otp.length, 
              (index) => OtpField(otp: otp, index: index,)
              ),
          ),
          SizedBox(height: SizedConfig.screenHeight * 0.15),
          MyButton(text: "Continue", press: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              print("${otp.join()}");
              }
              if (otp.isNotEmpty) {
                Navigator.pushNamed(context, HomeScreen.routesName);
              }
          })
        ],
      ),
    );
  }
}

class OtpField extends StatefulWidget {
  const OtpField({
    super.key,
    required this.otp, required this.index,
  });

  final int index;
  final List<String?> otp;

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  // late TextEditingController _controller;

  // @override
  // void initState() {
  //   super.initState();

  //   _controller = TextEditingController();
  //   _controller.addListener(() {
  //     if (_controller.text.isEmpty && widget.index > 0) {
  //       FocusScope.of(context).previousFocus();
  //     }
  //   });
  // }

  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getPropScreenWidth(60),
          child: Column(
            children: [
              TextFormField(
                onSaved: (newValue) =>  setState(() => widget.otp[widget.index] = newValue),
                onChanged: (value) {
                if (value.isEmpty && widget.index > 0) {
                    FocusScope.of(context).previousFocus();
                  } else if (value.isEmpty && widget.otp == 0) {
                    FocusScope.of(context).requestFocus();
                  } else if (widget.index == widget.otp.length - 1) {
                    FocusScope.of(context).unfocus();
                  } else {
                    FocusScope.of(context).nextFocus();
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "";
                  }
                },
                keyboardType: TextInputType.number,
                obscureText: true,
                maxLength: 1,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                buildCounter: (context, {
                  required currentLength, 
                  required isFocused, 
                  required maxLength}) => null,
                style: TextStyle(
                  fontSize: getPropScreenWidth(24),
                ),
                textAlign: TextAlign.center,
                decoration: otpDecoration
              ),
            ],
          ),
          ),
      ],
    );
  }
}
