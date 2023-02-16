import 'dart:convert';
import 'dart:developer';

import 'package:cosmopolitan/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

TextEditingController firstNameController = TextEditingController();
// TextEditingController lastNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
  String user_id = '';
  bool loading = false;

  editProfile(fname, /*lname*/ email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    user_id = (await preferences.getString('user_id'))!;
    print(user_id);
    // var token = preferences.getString('token');
    // log("get token");
    // log("Token: $token");
    if(user_id !=''){
      log("Api Calling..... ");
      var api = "https://employeehub.cosmocentralgroup.co.za/wp-json/cosmopolitan_rest_api/v1/update_user";
      var response = await http.post(
      Uri.parse(api),
      headers: {
        'Accept': "application/json",
        'content-Type': 'application/x-www-form-urlencoded',
      // 'Authorization' : "Bearer $token",
      },
      body:
      {'name': '$fname',
      // 'lname': '$lname',
      'email': '$email',
      'user_id':user_id})
      ;
    print(response.statusCode);
    print("Body: ${response.body}");

    if (response.statusCode == 200) {

      firstNameController.clear();
      // lastNameController.clear();
      emailController.clear();
      Fluttertoast.showToast(msg: 'Update Success');
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Dashboard()));

    } else {
      print("Server Error! ");
    }
      log("Api Okey... ");
      setState(() {
        loading = false;
      });
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120,
        leading: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: double.maxFinite,
              child: Row(),
            ),
            Positioned(
              left: 1,
              child: Row(
                children: [
                  const SizedBox(
                    width: 17.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      'assets/icons/east.svg',
                      width: 20,
                      color: const Color(0xff3F3F3F),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  const Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xFF33343C),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0.8,
        shadowColor: Colors.grey.withOpacity(0.3),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Name',
              style: TextStyle(
                  color: Color(0xFF33343C),
                  fontWeight: FontWeight.w600,
                  fontSize: 13),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xffDEDEDE),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: TextFormField(
                controller: firstNameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Color(0xFF444444)),
                  hintText: 'Bella',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            // Text(
            //   'Last Name',
            //   style: TextStyle(
            //       color: Color(0xFF33343C),
            //       fontWeight: FontWeight.w600,
            //       fontSize: 13),
            // ),
            // const SizedBox(
            //   height: 5.0,
            // ),
            // Container(
            //   height: 50.h,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(8),
            //     border: Border.all(
            //       color: Color(0xffDEDEDE),
            //     ),
            //   ),
            //   padding: EdgeInsets.symmetric(
            //     horizontal: 30,
            //   ),
            //   child: TextFormField(
            //     controller: lastNameController,
            //     keyboardType: TextInputType.name,
            //     decoration: InputDecoration(
            //       hintStyle: TextStyle(color: Color(0xFF444444)),
            //       hintText: 'Alex',
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 10.0,
            ),
            // const Text(
            //   'Date of Birth',
            //   style: TextStyle(
            //       color: Color(0xFF33343C),
            //       fontWeight: FontWeight.w600,
            //       fontSize: 13),
            // ),
            const Text(
              'Email',
              style: TextStyle(
                  color: Color(0xFF33343C),
                  fontWeight: FontWeight.w600,
                  fontSize: 13),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xffDEDEDE),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Color(0xFF444444)),
                  hintText: 'example@example.com',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            InkWell(
              onTap: (){
                editProfile(firstNameController.text, /*lastNameController.text8*/ emailController.text);
              },
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color(0xFF243690),
                    borderRadius: BorderRadius.circular(5)),
                child: const Text(
                  'Update Profile',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
