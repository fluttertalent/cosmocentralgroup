import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class UpcomingBirthdays extends StatefulWidget {
  const UpcomingBirthdays({Key? key}) : super(key: key);
  @override
  State<UpcomingBirthdays> createState() => _UpcomingBirthdaysState();
}
class _UpcomingBirthdaysState extends State<UpcomingBirthdays> {

  var birthdays;
  bool loading = true;
  List<Widget> birthdayList = [];
  List months = ['January','Febrary','March','April','May','June','July','August','September','October','November','December'];

  getbirthdays() async {
    print('getbirthdays');
    var headers = {'Authorization': 'Basic cHJvamVjdEBnb2Rlc2lnbi5wazpEQU5QIFVxdGYgeXAxaSBxakxyIGZQVnQgMm52ZQ=='};
    var request = http.Request('GET',
        Uri.parse('https://employeehub.cosmocentralgroup.co.za/wp-json/cosmopolitan_rest_api/v1/get_birthdays'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      birthdays = body;
      List<Widget> tempList = [];
      List<Widget> itemList = [];
      for(var birthday in birthdays){
        var dateTime1 = DateFormat('yy/MM/dd').parse(birthday['date']);
        itemList = [];
        for(var item in birthday['data']){
          print(item);
          itemList.add(
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: const Color(0xFFDEDEDE))),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: (item['featured_image'] != false)? SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.network(
                                item['featured_image'],
                                fit: BoxFit.fill,
                            ),
                          ):Container()
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        SizedBox(
                          height: 90,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color(0xFF333333),
                                ),
                              ),
                              Text(
                                item['extp_position'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.5,
                                  color: Color(0xFF555555),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                item['categories'][0]['name'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Color(0xFF243690),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                )
              ],
            )
          );
        }
        tempList.add(
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                '${dateTime1.day} ${months[dateTime1.month-1]}, ${dateTime1.year}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xFFD21E24),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                    itemList,
                ),
              ),
            ],
          )
        );
      }
      setState((){
        birthdayList = tempList;
        loading = false;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  void initState(){
    getbirthdays();
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
                    width: 14.0,
                  ),
                  const Text(
                    "Birthdays",
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
          padding: const EdgeInsets.only(left: 25.0),
          child: loading? Center(
              child:Column(
                children: const [
                  Text("Loading..."),
                  CircularProgressIndicator(),
                ],
              )):Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                  birthdayList
            ,
          ),
        ),
      ),
    );
  }
}
