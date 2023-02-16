import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChangePassword extends StatelessWidget {
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
                      color: Color(0xff3F3F3F),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    "Change Password",
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
            Text(
              'Current Password',
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
                  color: Color(0xffDEDEDE),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.visibility, color: Color(0xFFA4A4A44)),
                  hintStyle: TextStyle(color: Color(0xFFA4A4A44)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 0.0),
                  hintText: 'Enter current password',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'New Password',
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
                  color: Color(0xffDEDEDE),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.visibility, color: Color(0xFFA4A4A44)),
                  hintStyle: TextStyle(color: Color(0xFFA4A4A44)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 0.0),
                  hintText: 'Enter new password',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Confirm Password',
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
                  color: Color(0xffDEDEDE),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.visibility, color: Color(0xFFA4A4A44)),
                  hintStyle: TextStyle(color: Color(0xFFA4A4A44)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 0.0),
                  hintText: 'Re-enter new password',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 15.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xFF243690),
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                'Change Password',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
