import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'image_view.dart';

class Gallery extends StatelessWidget {
  var GalleryData = [];

  getGallery() async {
    var headers = {
      'Authorization':
          'Basic cHJvamVjdEBnb2Rlc2lnbi5wazpEQU5QIFVxdGYgeXAxaSBxakxyIGZQVnQgMm52ZQ=='
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://employeehub.cosmocentralgroup.co.za/wp-json/cosmopolitan_rest_api/v1/get_images'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      GalleryData = body;
      // log("Body: $body");
    } else {
      print(response.reasonPhrase);
    }
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
                        color: const Color(0xff3F3F3F),
                      ),
                    ),
                    const SizedBox(
                      width: 14.0,
                    ),
                    const Text(
                      "Gallery",
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
        body: FutureBuilder(
            future: getGallery(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return GridView.builder(
                    padding: const EdgeInsets.all(20),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.2,
                        crossAxisCount: 2,
                        crossAxisSpacing: 13,
                        mainAxisSpacing: 10),
                    itemCount: GalleryData.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ImageView(
                                        imgurl: GalleryData[index]
                                            // ['rendered'],
                                        // imgdes: GalleryData[index]['title']
                                        //     ['rendered'],
                                      )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      GalleryData[index]))),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, left: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(
                                //   GalleryData[index],
                                //   // GalleryData[index]['title']['rendered'],
                                //   style: const TextStyle(
                                //       fontSize: 14,
                                //       color: Colors.white,
                                //       fontWeight: FontWeight.w600),
                                // )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
                }
            }));
  }
}
