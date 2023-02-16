import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TileList extends StatelessWidget {
  TileList(
    this.iscolor, {
    required this.title,
  });
  final String title;
  bool iscolor = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color:
                      iscolor == true ? Color(0xFF243690) : Color(0xFF444444)),
            ),
            SvgPicture.asset('assets/icons/arrow_for.svg'),
          ],
        ),
      ),
    );
  }
}
