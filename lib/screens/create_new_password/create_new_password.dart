import 'package:flutter/material.dart';

import '../common/custom_button.dart';
import '../common/custom_textfield.dart';
import '../success_screen/success_screen.dart';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:loading_indicator/loading_indicator.dart';
class CreateNewPassword extends StatefulWidget {
   CreateNewPassword({Key? key, required this.email}) : super(key: key);
final String email;
  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool loading = false;

  var formKey = GlobalKey<FormState>();

  bool isVisible = true;

  newPassword(email, password) async {
    setState(() {
      loading = true;
    });
    try {
      final responce = await http.post(
          Uri.parse('https://hqsupplys.com/public/api/forget/password'),
          headers: {
            'Content-Type': "application/json",
            'Accept': "application/json",

          },
          body: jsonEncode(
              {'email': '$email',
                'password': '$password'}));

      print(responce.statusCode);

      if (responce.statusCode == 200) {
        log("Login Success!");
        print("Body: ${responce.body}");

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ResetSuccess()));
      } else {

        log("Enter New Password");
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
          padding: EdgeInsets.all(20),
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
                  "Reset New Password",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Text(
                  "Please enter your new password",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "New Password",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                 CustomTextField(
                  controller: passwordController,
                  hintText: 'Enter new Password',
                  obsecure: true,
                  suffixIcon: Icon(Icons.visibility),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Confirm Password",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: confirmPasswordController,
                  hintText: 'Re-Enter Password',
                  obsecure: true,
                  suffixIcon: Icon(Icons.visibility),
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
                      if(passwordController.text == confirmPasswordController.text) {
                        newPassword(
                            widget.email, passwordController.text);
                      }
                      else {
                        Text("Passwords must be same");
                      }
                    };
                  },
                  title: "RESET",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
