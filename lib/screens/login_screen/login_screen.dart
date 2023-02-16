import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:loading_indicator/loading_indicator.dart';
import '../common/custom_button.dart';
import '../common/custom_textfield.dart';
import '../dashboard/dashboard.dart';
import '../forgot_screen/forgot_screen.dart';

import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _value = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loading = false;
  var formKey = GlobalKey<FormState>();
  bool isVisible = true;
  late final SharedPreferences prefs;
  void initState(){

  }
  // LoginFunction(email, password)async{
  //   var headers = {
  //     'Authorization': 'Basic cHJvamVjdEBnb2Rlc2lnbi5wazpEQU5QIFVxdGYgeXAxaSBxakxyIGZQVnQgMm52ZQ=='
  //   };
  //   var request = http.MultipartRequest('POST',
  //       Uri.parse('https://employeehub.cosmocentralgroup.co.za/wp-json/cosmopolitan_rest_api/v1/authenticate-user'));
  //   request.fields.addAll({
  //
  //     'username': '$email',
  //     'password': '$password'
  //   });
  //
  //   request.headers.addAll(headers);
  //
  //   http.StreamedResponse response = await request.send();
  //   // successfully
  //   if (response.statusCode == 200) {
  //     //   print(await response.stream.bytesToString());
  //     var res = await response.stream.bytesToString();
  //     var body = jsonDecode(res);
  //     print("Body  ==$body");
  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (context) => const Dashboard()));
  //   }
  //   // invalid credentials
  //   if(response.statusCode == 401){
  //     var res = await response.stream.bytesToString();
  //     var body = jsonDecode(res);
  //     var message = body['message'];
  //     print("$message");
  //     Fluttertoast.showToast(msg: "$message");
  //   }
  //   else {
  //     print(response.reasonPhrase);
  //   }
  // }

  login(email, password) async {
    setState(() {
      loading = true;
    });
    try {
      final response = await http.post(
          Uri.parse('https://employeehub.cosmocentralgroup.co.za/wp-json/cosmopolitan_rest_api/v1/authenticate-user'),
           headers : {
             'Authorization': 'Basic cHJvamVjdEBnb2Rlc2lnbi5wazpEQU5QIFVxdGYgeXAxaSBxakxyIGZQVnQgMm52ZQ==',
             'content-Type': 'application/x-www-form-urlencoded',
      },
      body:(
          {
            'username': '$email',
            'password': '$password'
          }
      ),
      );

      print(response.statusCode);
      if (response.statusCode == 200) {
        log("Login Success!");
        var data = jsonDecode(response.body);
        prefs = await SharedPreferences.getInstance();
        await prefs.setBool('loggedIn', true);
        await prefs.setString('username', data['username']);
        await prefs.setString('email', data['email']);
        await prefs.setString('user_id', data['ID'].toString());
        log("Body ===: $data");
        Fluttertoast.showToast(msg: 'Login Success!');
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Dashboard()));
      }
      if (response.statusCode == 401) {
        log("invalid!");
        var data = jsonDecode(response.body);
        var error = data['message'];
        log("error ===: $error");
        Fluttertoast.showToast(msg: error);
      }

      // else  {
      //   Fluttertoast.showToast(msg: "Enter Valid Email and Password");
      //   log("Your Email password is wrong please try again");
      // }
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
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Image.asset("assets/images/cos logo.png"),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.3,
                        child: Image.asset(
                            "assets/images/Central-Developments-Logo_CMYK_Charcoal 1.png"),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Welcome Back",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  const Text(
                    "Login to your account",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Username or Email Address",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
    // validator: (value) {
    // if (value!.isEmpty) {
    // return "Password is Required";    // } },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Username or Email Address',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Password",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obsecure: true,
                    suffixIcon: const Icon(Icons.visibility),
                  ),
                  // Row(
                  //   children: [
                  //     Checkbox(
                  //       value: _value,
                  //       onChanged: (v) {
                  //         setState(() {
                  //           _value = v!;
                  //         });
                  //       },
                  //       checkColor: Colors.grey.shade400,
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(3),
                  //       ),
                  //     ),
                  //     // const Text(
                  //     //   "Remember me",
                  //     //   style: TextStyle(fontWeight: FontWeight.w500),
                  //     // )
                  //   ],
                  // ),
                  const SizedBox(
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
                        login(
                            emailController.text,
                            passwordController.text
                        );
                      };
                    },
                    title: "LOGIN",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Center(
                  //   child: TextButton(
                  //     onPressed: () {
                  //       Navigator.push(context, MaterialPageRoute(builder: (_) {
                  //         return ForgotScreen();
                  //       }));
                  //     },
                  //     child: const Text(
                  //       "Forget Password?",
                  //       style: TextStyle(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w600,
                  //         color: Color(0xFF243690),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
