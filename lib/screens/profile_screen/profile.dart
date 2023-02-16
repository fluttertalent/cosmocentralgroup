import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../form_fields.dart';
import 'edit_profile.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120,
        leading: Row(
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
                color: Color(0xff3F3F3F),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            const Text(
              "Profile",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color(0xFF33343C),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0.8,
        shadowColor: Colors.grey.withOpacity(0.3),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfile()));
                    },
                    child: Text(
                      "Edit",
                      style: TextStyle(
                          color: Color(0xFF243690),
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xFFEEF1FF).withOpacity(0.36),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 20,
                      child: SvgPicture.asset(
                        'assets/images/avatar.svg',
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bella Alex',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF343434),
                              fontSize: 14),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text("Foreman",
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontSize: 12,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              form_field(name_field: "First Name", hint_text: 'Bella'),
              SizedBox(
                height: 20.h,
              ),
              form_field(name_field: "Last Name", hint_text: 'Alex'),
              SizedBox(
                height: 20.h,
              ),
              form_field(name_field: 'Email', hint_text: '@abc.com'),
              SizedBox(
                height: 20.h,
              ),
              form_field(name_field: 'DOB', hint_text: '12-2-1992'),
              SizedBox(
                height: 20.h,
              ),
              form_field(name_field: 'Password', hint_text: '**********')
            ],
          ),
        ),
      ),
    );
  }
}
