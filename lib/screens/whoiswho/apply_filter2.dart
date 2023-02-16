
import 'package:cosmopolitan/screens/whoiswho/who_is_who.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'choose_category.dart';
import 'choose_location.dart';

class ApplyFilter2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Apply Filter",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xFF33343C),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SvgPicture.asset(
            'assets/icons/east.svg',
            width: 20,
            color: Color(0xff3F3F3F),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.8,
        shadowColor: Colors.grey.withOpacity(0.3),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Category',
              style: TextStyle(
                  color: Color(0xFF33343C),
                  fontWeight: FontWeight.w600,
                  fontSize: 13.5),
            ),
            const SizedBox(
              height: 5.9,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChooseCategory()));
              },
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xFFEEF1FF).withOpacity(0.5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14.0, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Admin and Asset Management',
                        style: TextStyle(
                            color: Color(0xFF444444),
                            fontWeight: FontWeight.w500,
                            fontSize: 15.5),
                      ),
                      SvgPicture.asset('assets/icons/arrow_for.svg'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Category',
              style: TextStyle(
                  color: Color(0xFF33343C),
                  fontWeight: FontWeight.w600,
                  fontSize: 13.5),
            ),
            const SizedBox(
              height: 5.9,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChooseLocation()));
              },
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xFFEEF1FF).withOpacity(0.5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14.0, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Location',
                        style: TextStyle(
                            color: Color(0xFF444444),
                            fontWeight: FontWeight.w500,
                            fontSize: 15.5),
                      ),
                      SvgPicture.asset('assets/icons/arrow_for.svg'),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WhoIsWho()));
              },
              child: Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xFF243690)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14.0, vertical: 16),
                  child: Text(
                    'Apply',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
