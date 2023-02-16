import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:http/http.dart' as http;

class ExecutiveTeam extends StatefulWidget {
  const ExecutiveTeam({Key? key}) : super(key: key);
  @override
  State<ExecutiveTeam> createState() => _ExecutiveTeam();
}

class _ExecutiveTeam extends State<ExecutiveTeam> {

  var executive_teams;
  getteams() async {
    print('getEmployes');
    var headers = {'Authorization': 'Basic cHJvamVjdEBnb2Rlc2lnbi5wazpEQU5QIFVxdGYgeXAxaSBxakxyIGZQVnQgMm52ZQ=='};
    var request = http.Request('GET',
        Uri.parse('https://employeehub.cosmocentralgroup.co.za/wp-json/cosmopolitan_rest_api/v1/executive-team?'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      executive_teams = jsonDecode(res);

    } else {
      print(response.reasonPhrase);
    }
  }
  List<Map<String, String>> gridItems = [
    {
      'imageUrl': 'assets/images/Frame 7.png',
      'title': 'Anton Crouse',
      'subtitle': 'Managing Director'
    },
    {
      'imageUrl': 'assets/images/Frame 7 (1).png',
      'title': 'Suzanne Coetzee',
      'subtitle': 'Director'
    },
    {
      'imageUrl': 'assets/images/Frame 7 (2).png',
      'title': 'Johann Vorster',
      'subtitle': 'Director + Co-Founder'
    },
    {
      'imageUrl': 'assets/images/Frame 7 (3).png',
      'title': 'Gerrit Brandow',
      'subtitle': 'Director'
    },
    {
      'imageUrl': 'assets/images/Frame 7 (4).png',
      'title': 'Wouter Brouwer',
      'subtitle': 'Director '
    },
    {
      'imageUrl': 'assets/images/Frame 7 (5).png',
      'title': 'Kgothatso Meka',
      'subtitle': 'Director'
    },
    {
      'imageUrl': 'assets/images/Frame 7 (6).png',
      'title': 'Johannes Basson',
      'subtitle': 'Director '
    },
    {
      'imageUrl': 'assets/images/Frame 7 (7).png',
      'title': 'Johan Badenhorst',
      'subtitle': 'Director'
    },
    {
      'imageUrl': 'assets/images/Frame 7 (8).png',
      'title': 'Roland Behrens',
      'subtitle': 'Director '
    },
    {
      'imageUrl': 'assets/images/Frame 7 (9).png',
      'title': 'Pierre Ludick',
      'subtitle': 'Director'
    },
    {
      'imageUrl': 'assets/images/Frame 7 (10).png',
      'title': 'Riaan Claassen',
      'subtitle': 'Director '
    },
    {
      'imageUrl': 'assets/images/Frame 7 (11).png',
      'title': 'Jaco Slabbert',
      'subtitle': 'Director'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120,
        leading: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            SizedBox(
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
                    "Executive Team",
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
      body:
      Container(
        child: FutureBuilder(
            future: getteams(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return  Center(
                    child: Column(
                      children: const [
                        Text("Loading..."),
                        CircularProgressIndicator(),
                      ],
                    ));
              }else{
                return
                  GridView.builder(
                    padding: const EdgeInsets.only(right: 20.0, left: 20, top: 15, bottom: 40),
                    itemCount: executive_teams.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25)),
                              ),
                              context: context,
                              builder: (context) => SizedBox(
                                height: MediaQuery.of(context).size.height - 450,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          width: double.maxFinite,
                                          height: 90,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(25),
                                                  topRight: Radius.circular(25)),
                                              color: Color(0xFF243690)),
                                        ),
                                        Positioned(
                                          top: 34,
                                          left: 15,
                                          child: Container(
                                            width: double.maxFinite,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  children: [
                                                    executive_teams[index]['featured_image'] != false?
                                                    Image.network(
                                                      executive_teams[index]['featured_image'],
                                                      width: 80,
                                                    ):
                                                        Container(
                                                          width: 80,
                                                        ),
                                                    const SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children:  [
                                                        Text(
                                                          executive_teams[index]['title'],
                                                          style: const TextStyle(
                                                              fontWeight:
                                                              FontWeight.w600,
                                                              fontSize: 15,
                                                              color: Colors.white),
                                                        ),
                                                        Text(
                                                            executive_teams[index]['team_data']['team_member_position'],
                                                          style: const TextStyle(
                                                              fontWeight:
                                                              FontWeight.w500,
                                                              fontSize: 13,
                                                              color: Colors.white),
                                                        ),
                                                        const SizedBox(
                                                          height: 50,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                                const Text(
                                                  'Anton founded Cosmopolitan Projects in 1992 and \nthe Central Developments Property Group in 2002.',
                                                  style: TextStyle(
                                                      color: Color(0xFF666666),
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                const Text(
                                                  'As Managing Director with a B.Com Marketing\ndegree from the University of Pretoria, he provides\nstrategic     direction     and      ongoing    hands-on\nmanagement   throughout   the   various  business\nfunctions of the group.',
                                                  style: TextStyle(
                                                      color: Color(0xFF666666),
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          left: 60,
                                          right: 60,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 5,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    color: const Color(0xFF8C9DF6)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFFDEDEDE)),
                              borderRadius: BorderRadius.circular(8)),
                          child: Stack(
                            children: [
                              Container(
                                width: double.maxFinite,
                                height: 60,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF243690),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        topLeft: Radius.circular(8))),
                              ),
                              Positioned(
                                top: 14,
                                left: 30,
                                right: 30,
                                child: Column(
                                  children: [
                                    executive_teams[index]['featured_image'] != false?
                                    Image.network(
                                      executive_teams[index]['featured_image']!,
                                      height: 100,
                                      width: 90,
                                      fit: BoxFit.cover,
                                    )
                                    :const SizedBox(
                                      height: 100,
                                      width: 90,
                                    ),
                                    const SizedBox(height: 6.0),
                                    Text(
                                        executive_teams[index]['title'],
                                      style: const TextStyle(
                                        color: Color(0xFF333333),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.5,
                                      ),
                                    ),
                                    Text(
                                      executive_teams[index]['team_data']['team_member_position'],
                                      style: const TextStyle(
                                        color: Color(0xFF555555),
                                        fontSize: 11,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 15,
                        childAspectRatio: 1.06),
                  );}
            })
      ));

  }
}
