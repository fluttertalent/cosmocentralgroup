import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContainerTile extends StatelessWidget {
  const ContainerTile({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(bottom: 13.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFFDEDEDE))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.5,
                  color: Color(0xFF33343C)),
            ),
            SvgPicture.asset(
              'assets/icons/Vector (5).svg',
              color: Color(0xFF3F3F3F),
            )
          ],
        ),
      ),
    );
  }
}
