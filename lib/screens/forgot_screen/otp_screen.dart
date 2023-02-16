import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:cosmopolitan/screens/forgot_screen/widget/otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../common/custom_button.dart';
import '../common/custom_textfield.dart';
import '../create_new_password/create_new_password.dart';
import 'forgot_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key, required this.email}) : super(key: key);
final String email;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController1 = TextEditingController();
  TextEditingController otpController2 = TextEditingController();
  TextEditingController otpController3 = TextEditingController();
  TextEditingController otpController4 = TextEditingController();
  bool loading = false;

  var formKey = GlobalKey<FormState>();

  otpVerify(email, otp) async {
    setState(() {
      loading = true;
    });
    try {
      final responce = await http.post(
          Uri.parse('https://hqsupplys.com/public/api/otp/verify'),
          headers: {
            'Content-Type': "application/json",
            'Accept': "application/json",

          },
          body: jsonEncode(
              {
                'otp': '$otp',
                'email': '$email'
              }));

      print(responce.statusCode);

      if (responce.statusCode == 200) {
        log("OTP Verify!");
        print("Body: ${responce.body}");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
            return CreateNewPassword(email: '$email',);
          }),
        );

      } else {

        log("Enter Valid otp");
      }
      setState(() {
        loading = false;
      });
    } catch (e) {
      print("Catch Error________________");
      print(e.toString());
      setState(() {
        loading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/images/cos logo.png"),
                  Image.asset(
                      "assets/images/Central-Developments-Logo_CMYK_Charcoal 1.png"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "OTP Verification",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(
                    text:
                        "Please enter 4 Digits Code we sent to you email\nat ",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.grey),
                    children: [
                      TextSpan(
                        text: widget.email,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.black),
                      )
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OtpTextField(
                      controller: otpController1,
                      keyboardType: TextInputType.number,
                      onChanged: (v) {
                        if (v.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                    OtpTextField(
                      controller: otpController2,
                      keyboardType: TextInputType.number,
                      onChanged: (v) {
                        if (v.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                    OtpTextField(
                      controller: otpController3,
                      keyboardType: TextInputType.number,
                      onChanged: (v) {
                        if (v.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                    OtpTextField(
                      controller: otpController4,
                      keyboardType: TextInputType.number,
                      onChanged: (v) {
                        if (v.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              loading ? Center(
                child: SizedBox(
                    width: 80,
                    child: LoadingIndicator(
                        indicatorType: Indicator.ballBeat,
                        colors: [
                          Theme.of(context).primaryColor,
                        ],
                        strokeWidth: 2,
                        pathBackgroundColor:
                        Theme.of(context).primaryColor)),
              ) :
              CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    otpVerify(
                      widget.email, otpController1.text+otpController2.text+otpController3.text+otpController4.text
                    );
                  };

                },
                title: "VERIFY",
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Didn’t receive the code? "),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotScreen(),));
                    },
                    child: Text(
                      "Resend Again",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF243690),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
