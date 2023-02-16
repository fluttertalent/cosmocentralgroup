import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback ? onTap;
  final String ? title;
  const CustomButton({Key? key, this.onTap, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF243690),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(title!,style: TextStyle(
            fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white
          ),),
        ),
      ),
    );
  }
}
