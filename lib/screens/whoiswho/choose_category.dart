
import 'package:cosmopolitan/screens/whoiswho/cam.dart';
import 'package:cosmopolitan/screens/whoiswho/widget/tile_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChooseCategory extends StatelessWidget {
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
                    width: 14.0,
                  ),
                  Text(
                    "Choose Category",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
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
        padding: const EdgeInsets.only(left: 18.0, right: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            TileList(
              true,
              title: 'All Employees',
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cam()));
              },
              child: TileList(
                false,
                title: 'CAM',
              ),
            ),
            TileList(
              false,
              title: 'CDP',
            ),
            TileList(
              false,
              title: 'Central Castle Gate',
            ),
            TileList(
              false,
              title: 'Central Square',
            ),
            TileList(
              false,
              title: 'Cosmo JHB',
            ),
            TileList(
              false,
              title: 'Cosmo Consult & Land Development',
            ),
            TileList(
              false,
              title: 'Cosmo Project Management',
            ),
            TileList(
              false,
              title: 'Shared Services',
            ),
            TileList(
              false,
              title: 'Stronger Together',
            ),
          ],
        ),
      ),
    );
  }
}
