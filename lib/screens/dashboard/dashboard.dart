
import 'package:cosmopolitan/screens/dashboard/widget/custom_drawer.dart';
import 'package:cosmopolitan/screens/dashboard/widget/reusable_container.dart';
import 'package:cosmopolitan/screens/dashboard/widget/videos_container.dart';
import 'package:cosmopolitan/screens/events/events.dart';
import 'package:cosmopolitan/screens/gallery/gallery.dart';
import 'package:cosmopolitan/screens/whoiswho/who_is_who.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../announcements/announcements.dart';
import '../ccn_video_library/ccn_video_library.dart';
import '../documents/documents.dart';
import '../upcoming_birthdays/upcoming_birthday.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        drawer: const CustomDrawer(),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          // leading: Padding(
          //   padding: const EdgeInsets.all(18.0),
          //   child: SvgPicture.asset(
          //     'assets/icons/filter.svg',
          //   ),
          // ),
          title: Row(
            children: [
              const SizedBox(
                width: 22.0,
              ),
              Image.asset(
                'assets/images/cos logo.png',
                color: Colors.white,
                width: 85.0,
              ),
              const SizedBox(
                width: 12.0,
              ),
              Image.asset(
                'assets/images/Central-Developments-Logo_CMYK_Charcoal 1.png',
                width: 70.0,
                color: Colors.white,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.maxFinite,
                  height: 200.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(70.0),
                          bottomRight: Radius.circular(70.0)),
                      color: Color(0xFF243690)),
                ),
                Positioned(
                    bottom: -75,
                    child: SizedBox(
                      height: 200.0,
                      width: MediaQuery.of(context).size.width,
                      child: PageView.builder(
                        onPageChanged: (index) {
                          currentIndex = index;
                          setState(() {});
                        },
                        controller: PageController(
                            initialPage: 0, viewportFraction: 0.92),
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.only(right: 20.0, left: 20.0),
                          child: Image.asset(
                            'assets/images/image 21.png',
                          ),
                        ),
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 60.0,
            ),
            DotsIndicator(
              dotsCount: 4,
              position: currentIndex.toDouble(),
              decorator: DotsDecorator(
                  color: Color(0xFFA4A4A4).withOpacity(0.44),
                  activeColor: Color(0xFF243690),
                  activeSize: Size(15.0, 8.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  spacing: EdgeInsets.all(2.5)),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const WhoIsWho(category: '',location: '',)));
                          },
                          child: const ReusableContainer(
                            iconUrl: 'assets/icons/Group.svg',
                            title: 'Who’s Who',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Documents()));
                          },
                          child: const ReusableContainer(
                            iconUrl: 'assets/icons/Group (1).svg',
                            title: 'Documents',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Gallery()));
                          },
                          child: const ReusableContainer(
                            iconUrl: 'assets/icons/Group (2).svg',
                            title: 'Gallery',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpcomingBirthdays()));
                          },
                          child: const ReusableContainer(
                            iconUrl: 'assets/icons/Group (3).svg',
                            title: 'Birthday’s',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Events()));
                          },
                          child: const ReusableContainer(
                            iconUrl: 'assets/icons/Group (4).svg',
                            title: 'Events',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Announcements()));
                          },
                          child: const ReusableContainer(
                            iconUrl: 'assets/icons/Group (5).svg',
                            title: 'Announcement',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Latest CCN Video',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17.0),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CcnVideoLibrary()));
                        },
                        child: Row(
                          children: const [
                            Text(
                              'View All',
                              style: TextStyle(
                                  color: Color(0xFF243690),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Color(0xFF243690),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        VideosContainer(
                          imageUrl: 'assets/images/image 10.png',
                          title: 'Competition video\nHow do you ...',
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        VideosContainer(
                          imageUrl: 'assets/images/image 12.png',
                          title: 'Stronger Together \nTeam Building ...',
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        VideosContainer(
                          imageUrl: 'assets/images/image 10.png',
                          title: 'Competition video\nHow do you ...',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
