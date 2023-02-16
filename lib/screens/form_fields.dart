
import 'package:cosmopolitan/screens/profile_screen/change_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class form_field extends StatelessWidget {
  final String name_field;
  final String hint_text;

  const form_field({
    super.key,
    required this.name_field,
    required this.hint_text,
  });
  @override
  Widget build(BuildContext context) {
    return name_field.contains('Password')
        ? Container(
            height: 60.h,
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
                label: Text(
                  '$name_field',
                  style: TextStyle(fontSize: 12.sp),
                ),
                hintText: '$hint_text',
                border: InputBorder.none,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangePassword()));
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                          color: Color(0xFF243690),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        'Change',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : Container(
            height: 60.h,
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
                label: Text(
                  '$name_field',
                  style: TextStyle(fontSize: 12.sp),
                ),
                hintText: '$hint_text',
                border: InputBorder.none,
              ),
            ),
          );
  }
}
