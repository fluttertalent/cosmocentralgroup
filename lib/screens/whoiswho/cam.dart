
import 'package:cosmopolitan/screens/whoiswho/apply_filter2.dart';
import 'package:cosmopolitan/screens/whoiswho/widget/tile_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Cam extends StatelessWidget {
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
                    "Cam",
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
              false,
              title: 'All CAM ',
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ApplyFilter2()));
              },
              child: TileList(
                false,
                title: 'Admin and Asset Management',
              ),
            ),
            TileList(
              false,
              title: 'Business Development',
            ),
            TileList(
              false,
              title: 'Marketing',
            ),
            TileList(
              false,
              title: 'Operations North',
            ),
            TileList(
              false,
              title: 'Operations South',
            ),
            TileList(
              false,
              title: 'Swot',
            ),
          ],
        ),
      ),
    );
  }
}
