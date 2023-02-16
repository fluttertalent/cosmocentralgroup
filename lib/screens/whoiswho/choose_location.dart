
import 'package:cosmopolitan/screens/whoiswho/site.dart';
import 'package:cosmopolitan/screens/whoiswho/widget/tile_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChooseLocation extends StatelessWidget {
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
                    "Choose Location",
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
              title: 'All Location',
            ),
            TileList(
              false,
              title: 'Bedford view',
            ),
            TileList(
              false,
              title: 'CDP',
            ),
            TileList(
              false,
              title: 'Lion Pride (Johan & Irene)',
            ),
            TileList(
              false,
              title: 'Newtown',
            ),
            TileList(
              false,
              title: 'Route 82',
            ),
            TileList(
              false,
              title: 'Sky City (Egon)',
            ),
            TileList(
              false,
              title: 'Sky City (Alvin & Joseph)',
            ),
            TileList(
              false,
              title: 'Office',
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Site()));
              },
              child: TileList(
                false,
                title: 'Site',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
