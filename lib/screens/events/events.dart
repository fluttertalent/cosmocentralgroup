import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);
  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  var events;
  bool loading = true;
  List<Widget> eventList = [];
  List months = ['January','Febrary','March','April','May','June','July','August','September','October','November','December'];

  getEvents() async {
    print('getEvents');
    var headers = {'Authorization': 'Basic cHJvamVjdEBnb2Rlc2lnbi5wazpEQU5QIFVxdGYgeXAxaSBxakxyIGZQVnQgMm52ZQ=='};
    var request = http.Request('POST',
        Uri.parse('https://employeehub.cosmocentralgroup.co.za/wp-json/cosmopolitan_rest_api/v1/get-events'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      events = body;
      List<Widget> tempList = [];
      for(var event in events){
        var parsedDate = DateTime.parse(event['meta_value']);
        var mon = parsedDate.month;
        var day = parsedDate.day;
        print(months[mon-1]);
        tempList.add(
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5)),
              child: Container(
                decoration: const BoxDecoration(color: Color(0xFF243690)),
                child: Padding(
                      padding: const EdgeInsets.symmetric(
                      horizontal: 19.0, vertical: 17),
                      child:
                        Container(
                            width: MediaQuery.of(context).size.width*0.2,
                            child:  Column(
                              children: [
                                Text(
                                  '$day',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 32,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Text(
                                  '${months[mon-1]}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                        )
                ),
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            Flexible(
              child:SizedBox(
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    event['post_title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF33343C),
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // Text(
                  //   '@ Head Office Training Room',
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.w400,
                  //     color: Color(0xFF006940),
                  //     fontSize: 12.5,
                  //   ),
                  // ),

                  Text(
                    '${event['meta_value']} - ${event['_eventorganiser_schedule_start_finish']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF666666),
                      fontSize: 13.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // Text(
                  //   '#Family Meeting',
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.w500,
                  //     color: Color(0xFF243690),
                  //     fontSize: 13,
                  //   ),
                  // ),
                ],
              ),
            ),
            )
          ],
        )]));
      }
      setState((){
        eventList = tempList;
        loading = false;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  void initState(){
    getEvents();
  }
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
                  const Text(
                    "Events",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  // showModalBottomSheet(
                  //     isScrollControlled: true,
                  //     shape: const RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.only(
                  //           topLeft: Radius.circular(25),
                  //           topRight: Radius.circular(25)),
                  //     ),
                  //     context: context,
                  //     builder: (context) => SizedBox(
                  //           height: MediaQuery.of(context).size.height - 400,
                  //           child: Column(
                  //             mainAxisSize: MainAxisSize.min,
                  //             children: [
                  //               Stack(
                  //                 clipBehavior: Clip.none,
                  //                 children: [
                  //                   Container(
                  //                     width: double.maxFinite,
                  //                     height: 140,
                  //                     decoration: const BoxDecoration(
                  //                         borderRadius: BorderRadius.only(
                  //                             topLeft: Radius.circular(25),
                  //                             topRight: Radius.circular(25)),
                  //                         color: Color(0xFF243690)),
                  //                   ),
                  //                   Positioned(
                  //                     top: 34,
                  //                     left: 15,
                  //                     right: 15,
                  //                     child: Container(
                  //                       width: double.maxFinite,
                  //                       child: Column(
                  //                         mainAxisSize: MainAxisSize.min,
                  //                         children: [
                  //                           Text(
                  //                             'CDP Family Meeting',
                  //                             style: TextStyle(
                  //                                 color: Colors.white,
                  //                                 fontSize: 20,
                  //                                 fontWeight: FontWeight.w600),
                  //                           ),
                  //                           const SizedBox(
                  //                             height: 20,
                  //                           ),
                  //                           ClipRRect(
                  //                             borderRadius:
                  //                                 BorderRadius.circular(1),
                  //                             child: Stack(
                  //                               children: [
                  //                                 Image.asset(
                  //                                   'assets/images/Map of Birmingham (City).png',
                  //                                 ),
                  //                                 Positioned(
                  //                                     top: 20,
                  //                                     left: 20,
                  //                                     right: 20,
                  //                                     bottom: 20,
                  //                                     child: Padding(
                  //                                       padding:
                  //                                           const EdgeInsets
                  //                                               .all(35.0),
                  //                                       child: SvgPicture.asset(
                  //                                         'assets/icons/location.svg',
                  //                                       ),
                  //                                     )),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                           const SizedBox(
                  //                             height: 7,
                  //                           ),
                  //                           const SizedBox(
                  //                             width: 10.0,
                  //                           ),
                  //                           const SizedBox(
                  //                             height: 10.0,
                  //                           ),
                  //                           Container(
                  //                             child: Row(
                  //                               children: [
                  //                                 Column(
                  //                                   crossAxisAlignment:
                  //                                       CrossAxisAlignment
                  //                                           .start,
                  //                                   children: const [
                  //                                     // Text(
                  //                                     //   'Venue',
                  //                                     //   style: TextStyle(
                  //                                     //       fontWeight:
                  //                                     //           FontWeight.w500,
                  //                                     //       fontSize: 13,
                  //                                     //       color: Color(
                  //                                     //           0xFF9D9D9D)),
                  //                                     // ),
                  //                                     // const SizedBox(
                  //                                     //   height: 13,
                  //                                     // ),
                  //                                     // Text(
                  //                                     //   'Categories',
                  //                                     //   style: TextStyle(
                  //                                     //       fontWeight:
                  //                                     //           FontWeight.w500,
                  //                                     //       fontSize: 13,
                  //                                     //       color: Color(
                  //                                     //           0xFF9D9D9D)),
                  //                                     // ),
                  //                                     // const SizedBox(
                  //                                     //   height: 13,
                  //                                     // ),
                  //                                     // Text(
                  //                                     //   'Date',
                  //                                     //   style: TextStyle(
                  //                                     //       fontWeight:
                  //                                     //           FontWeight.w500,
                  //                                     //       fontSize: 13,
                  //                                     //       color: Color(
                  //                                     //           0xFF9D9D9D)),
                  //                                     // ),
                  //                                     SizedBox(
                  //                                       height: 13,
                  //                                     ),
                  //                                   ],
                  //                                 ),
                  //                                 Spacer(),
                  //                                 Spacer(),
                  //                                 Column(
                  //                                   crossAxisAlignment:
                  //                                       CrossAxisAlignment.end,
                  //                                   children: const [
                  //                                     // Text(
                  //                                     //   'Head Office Training Room',
                  //                                     //   style: TextStyle(
                  //                                     //       fontWeight:
                  //                                     //           FontWeight.w500,
                  //                                     //       fontSize: 14.5,
                  //                                     //       color: Color(
                  //                                     //           0xFF444444)),
                  //                                     // ),
                  //                                     // const SizedBox(
                  //                                     //   height: 13,
                  //                                     // ),
                  //                                     // Text(
                  //                                     //   'Family Meeting',
                  //                                     //   style: TextStyle(
                  //                                     //       fontWeight:
                  //                                     //           FontWeight.w500,
                  //                                     //       fontSize: 14.5,
                  //                                     //       color: Color(
                  //                                     //           0xFF444444)),
                  //                                     // ),
                  //                                     // const SizedBox(
                  //                                     //   height: 13,
                  //                                     // ),
                  //                                     // Text(
                  //                                     //   '14 Oct 2022 8:30 am – 10:00 am',
                  //                                     //   style: TextStyle(
                  //                                     //       fontWeight:
                  //                                     //           FontWeight.w500,
                  //                                     //       fontSize: 14.5,
                  //                                     //       color: Color(
                  //                                     //           0xFF444444)),
                  //                                     // ),
                  //                                     SizedBox(
                  //                                       height: 13,
                  //                                     ),
                  //                                   ],
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   Positioned(
                  //                     top: 10,
                  //                     left: 60,
                  //                     right: 60,
                  //                     child: Row(
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.center,
                  //                       children: [
                  //                         Container(
                  //                           width: 50,
                  //                           height: 5,
                  //                           decoration: BoxDecoration(
                  //                               borderRadius:
                  //                                   BorderRadius.circular(10),
                  //                               color: Color(0xFF8C9DF6)),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //         ));
                },
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: const Color(0xFFDEDEDE))),
                  child: loading? Container(
                      child:Column(
                        children: const [
                          Text("Loading..."),
                          CircularProgressIndicator(),
                        ],
                      ))
                   : Column(
                    children:
                      eventList
                    ,
                  )
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
