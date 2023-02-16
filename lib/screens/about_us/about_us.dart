
import 'package:cosmopolitan/screens/about_us/executive_team.dart';
import 'package:cosmopolitan/screens/about_us/widget/container_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'group_structure.dart';
import 'our_journey.dart';
import 'our_websites.dart';


class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUs();
}

class _AboutUs extends State<AboutUs> {
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
                      color: const Color(0xff3F3F3F),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  const Text(
                    "About us",
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
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 20),
        child: Column(
          children: [
            const SizedBox(
              height: 25.0,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OurJourney()));
                },
                child: const ContainerTile(title: 'Our Journey')),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ExecutiveTeam()));
                },
                child: const ContainerTile(title: 'Executive Team')),

            GestureDetector(
              onTap:(){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GroupStructure()));
              },
              child:const ContainerTile(title: 'Group Structure'),
            ),

            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OurWebsites()));
                },
                child: const ContainerTile(title: 'Our Websites')),
          ],
        ),
      ),
    );
  }
}
