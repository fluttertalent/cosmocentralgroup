import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import 'competition_video.dart';

class CcnVideoLibrary extends StatefulWidget{
  const CcnVideoLibrary({Key? key}) : super(key: key);
  @override
  State<CcnVideoLibrary> createState() => _CcnVideoLibrary();
}

class _CcnVideoLibrary extends State<CcnVideoLibrary> {

  var videos = [];
  var loading = true;
  getVideos() async {
    print('getbirthdays');
    var headers = {'Authorization': 'Basic cHJvamVjdEBnb2Rlc2lnbi5wazpEQU5QIFVxdGYgeXAxaSBxakxyIGZQVnQgMm52ZQ=='};
    var request = http.Request('GET',
        Uri.parse('https://employeehub.cosmocentralgroup.co.za/wp-json/cosmopolitan_rest_api/v1/get_CCN_videos'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      setState((){
        videos = body;
        loading = false;
      });
    } else {
      print(response.reasonPhrase);
    }
  }
  @override

  void initState(){
    getVideos();
  }
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
                    width: 14.0,
                  ),
                  const Text(
                    "CCN Video Library",
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
      body: loading == true? Center(
          child:Column(
            children: const [
              Text("Loading..."),
              CircularProgressIndicator(),
            ],
          )):GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10, crossAxisCount: 2, childAspectRatio: 0.8),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CompetitionVideo(url:videos[index]['post_content'], txt: videos[index]['title'],date: videos[index]['post_date'],)));
              },
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Image.network(
                              videos[index]['featured_image'],
                              fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 130,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Image.asset(
                                'assets/icons/play_circle_filled_black_24dp 1.png'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 9.0,
                    ),
                    Text(
                      videos[index]['title'],
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.5,
                          color: Color(0xFF333333)),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
