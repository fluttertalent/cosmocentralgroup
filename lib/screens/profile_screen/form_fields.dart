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
    return Container(
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
          )),
    );
  }
}
