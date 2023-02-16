import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:loading_indicator/loading_indicator.dart';
import 'package:flutter/material.dart';
import '../common/custom_button.dart';
import '../common/custom_textfield.dart';
import 'otp_screen.dart';

class ForgotScreen extends StatefulWidget {
  ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  TextEditingController emailController = TextEditingController();

  bool loading = false;

  var formKey = GlobalKey<FormState>();

  forgotPassword(email) async {
    setState(() {
      loading = true;
    });
    try {
      final responce = await http.post(
          Uri.parse('https://employeehub.cosmocentralgroup.co.za/wp-json/cosmopolitan_rest_api/v1/forgot-password'),
          headers: {
            'Authorization': 'Basic cHJvamVjdEBnb2Rlc2lnbi5wazpEQU5QIFVxdGYgeXAxaSBxakxyIGZQVnQgMm52ZQ=='
          },
          body: (
              {'username': '$email'}));

      print(responce.statusCode);

      if (responce.statusCode == 200) {
        log("success!");
        print("Body: ${responce.body}");

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
          return OtpScreen(email: '$email',);
        }));

      } else {

        log("Enter Valid Email Address");
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
          child: Form(
            key: formKey,
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
                  "Forgot Password",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Text(
                  "Reset your Password",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Email Address",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Username or Email Address',
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
                      forgotPassword(
                          emailController.text.trim(),
                      );
                    };

                  },
                  title: "Forgot",
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Go back",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF243690),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
