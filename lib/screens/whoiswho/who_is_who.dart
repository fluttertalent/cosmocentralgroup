import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cosmopolitan/screens/whoiswho/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'all_employee_model.dart';
import 'apply_filter.dart';

import 'package:http/http.dart' as http;

class WhoIsWho extends StatefulWidget {
  final category ;
  final location ;
  const WhoIsWho({Key? key,this.category,this.location}) : super(key: key);
  @override
  State<WhoIsWho> createState() => _WhoIsWhoState();
}

class _WhoIsWhoState extends State<WhoIsWho> {

  TextEditingController searchController = TextEditingController();
  late StreamController streamController;
  late Stream stream;
  List<AllEmployees?> allEmployees = <AllEmployees?>[];

  bool loading = true;
  var eployList = [];
  var page = 0;
  var name = '';
  var emplength = 0;

  getEmployes() async {
    print('getEmployes');
    var headers = {'Authorization': 'Basic cHJvamVjdEBnb2Rlc2lnbi5wazpEQU5QIFVxdGYgeXAxaSBxakxyIGZQVnQgMm52ZQ=='};
    var request = http.Request('GET',
      Uri.parse('https://employeehub.cosmocentralgroup.co.za/wp-json/cosmopolitan_rest_api/v1/get-who-is-who?per_page=10&page=${page}&category=${widget.category}&location=${widget.location}&name=$name'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      //   setState(() {
      //     loading = true;
      //   });
      emplength = body['lng'];
      eployList = body['result_arr'];
    } else {
      print(response.reasonPhrase);
    }
  }
  @override
  void initState()
  {
    print("call");
    super.initState();
  }
  //
  // searchEmployee(searchName) async {
  //   setState(() {
  //     loading = true;
  //   });
  //
  //   log("Api Calling..... ");
  //
  //   var api = "https://hqsupplys.com/public/api/employee/search?name==$searchName";
  //   var response = await http.post(
  //       Uri.parse(api),
  //       headers: {
  //         'Accept': "application/json",
  //         'Content-Type': "application/json",
  //       },
  //       body: jsonEncode(
  //           {'name': '$searchName',})
  //   );
  //   print(response.statusCode);
  //   print("Body: ${response.body}");
  //   if (response.statusCode == 200) {
  //     setState(() {
  //     //  allEmployees = allEmployeesFromJson(response.body);
  //     });
  //   } else {
  //     print("Server Error! ");
  //   }
  //   log("Api Okey... ");
  //   setState(() {
  //     loading = false;
  //   });
  // }

  Future<void> openDialer(String phoneNumber) async {
    Uri callUrl = Uri.parse('tel:=$phoneNumber');
    if (await canLaunchUrl(callUrl)) {
      await launchUrl(callUrl);
    } else {
      throw 'Could not open the dialler.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 130),
        child: AppBar(
          flexibleSpace: Column(
            children: [
              const SizedBox(
                height: 80.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child:  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: CommonTextFieldWithTitle(
                          '',
                          'Search by name',
                          searchController,
                              (val) {

                          },
                          onChanged: (val) {
                              name = val!;
                          },
                          suffixIcon: GestureDetector(
                            onTap: (){
                              // setState(() {
                              //   loading = true;
                              // });
                            },
                            child:const Icon(Icons.search),
                          )
                        ),
                      ),
                      // TextFormField(
                      //   controller: searchController,
                      //
                      //   decoration: InputDecoration(
                      //
                      //
                      //     fillColor: const Color(0xFFEDF0FF),
                      //     contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      //     onChanged: (val) {
                      //       setState(() {});
                      //     },
                      //     prefixIcon: Padding(
                      //       padding: const EdgeInsets.all(16.0),
                      //       child: SvgPicture.asset('assets/icons/search.svg',
                      //           width: 16, color: const Color(0xFF8E8E8E)),
                      //     ),
                      //     hintText: 'Search by name',
                      //     hintStyle:
                      //         const TextStyle(color: Color(0xFF8E8E8E), fontSize: 15),
                      //     filled: true,
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(8),
                      //     ),
                      //   ),
                      // ),
                    ),
                    const SizedBox(
                      width: 14.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ApplyFilter(name: searchController.text,)));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFF243690),
                        ),
                        child: SvgPicture.asset('assets/icons/filter.svg'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
                    GestureDetector(
                      onTap: ()async{
                        await  openDialer("079 493 1992");
                        print("open");
                      },
                      child: const Text(
                        "Who’s Who",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color(0xFF33343C),
                        ),
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
      ),
      body:Column(
        children: [
          Expanded(child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16.0,
                ),
                FutureBuilder(
                    future: getEmployes(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return  Center(
                          child: Column(
                            children: const [
                              Text("Loading..."),
                              CircularProgressIndicator(),
                            ],
                        ));
                      }else {
                        return Column(
                        children:
                           [
                           Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child:
                                widget.category=='' && widget.location=='' ?
                              Text(
                                'All Employees (${emplength.toString()})',
                                style: const TextStyle(
                                color: Color(0xFF243690),
                                fontWeight: FontWeight.w600,
                                fontSize: 14.5),
                              )
                                  : Text(
                              '${widget.category} ${widget.location} (${emplength.toString()})',
                                style: const TextStyle(
                                color: Color(0xFF243690),
                                fontWeight: FontWeight.w600,
                                fontSize: 14.5),)
                              ),
                             const SizedBox(
                               height: 10,
                             ),
                             GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 1,
                                  mainAxisSpacing: 10),
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                            print("length:${eployList.length}");
                            if(eployList.length>index){
                            var data = eployList[index];
                            if (data != null) {
                              if (data['title'].toString()
                                  .toLowerCase()
                                  .contains(
                                  searchController.text.toLowerCase())) {
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
                                        builder: (context) {
                                          return SizedBox(
                                            height:
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .height - 350,
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
                                                          borderRadius: BorderRadius
                                                              .only(
                                                              topLeft: Radius
                                                                  .circular(25),
                                                              topRight:
                                                              Radius.circular(
                                                                  25)),
                                                          color: Color(
                                                              0xFF243690)),
                                                    ),
                                                    Container(
                                                      width: double.maxFinite,
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize
                                                            .min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(26),
                                                            child: Image
                                                                .network(
                                                              data['featured_image']
                                                                  .toString(),
                                                              width: 100,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 7,
                                                          ),
                                                          Text(
                                                            data['title']
                                                                .toString(),
                                                            style: const TextStyle(
                                                                color: Color(
                                                                    0xFF333333),
                                                                fontSize: 16,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                          ),
                                                          const SizedBox(
                                                            width: 10.0,
                                                          ),
                                                          const SizedBox(
                                                            height: 10.0,
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 15),
                                                            child: Container(
                                                              padding: const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal: 18),
                                                              child: Row(
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      const Text(
                                                                        'Position',
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                            fontSize: 13,
                                                                            color: Color(
                                                                                0xFF9D9D9D)),
                                                                      ),
                                                                      Text(
                                                                        data['extp_position']
                                                                            .toString(),
                                                                        style: const TextStyle(
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                            fontSize: 15,
                                                                            color: Color(
                                                                                0xFF444444)),
                                                                      ),
                                                                      const SizedBox(
                                                                        height: 13,
                                                                      ),
                                                                      const Text(
                                                                        'Category',
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                            fontSize: 13,
                                                                            color: Color(
                                                                                0xFF9D9D9D)),
                                                                      ),
                                                                      Text(
                                                                        data['categories'][0]['name']
                                                                            .toString(),
                                                                        style: const TextStyle(
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                            fontSize: 15,
                                                                            color: Color(
                                                                                0xFF444444)),
                                                                      ),
                                                                      const SizedBox(
                                                                        height: 13,
                                                                      ),
                                                                      const Text(
                                                                        'Manager',
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                            fontSize: 13,
                                                                            color: Color(
                                                                                0xFF9D9D9D)),
                                                                      ),
                                                                      const Text(
                                                                        'Willem Smit',
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                            fontSize: 15,
                                                                            color: Color(
                                                                                0xFF444444)),
                                                                      ),
                                                                      const SizedBox(
                                                                        height: 13,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const Spacer(),
                                                                  const SizedBox(
                                                                    height: 100,
                                                                    child: VerticalDivider(
                                                                      width: 10,
                                                                      color:
                                                                      Color(
                                                                          0xFFDEDEDE),
                                                                    ),
                                                                  ),
                                                                  const Spacer(),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      const Text(
                                                                        'Phone',
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                            fontSize: 13,
                                                                            color: Color(
                                                                                0xFF9D9D9D)),
                                                                      ),

                                                                      InkWell(
                                                                        onTap: () {
                                                                          setState(() {
                                                                            openDialer(
                                                                                "${data['extp_phone']}");
                                                                          });
                                                                          print(
                                                                              "open");
                                                                        },
                                                                        child: Center(
                                                                          child: Text(
                                                                            data['extp_phone']
                                                                                .toString(),
                                                                            style: const TextStyle(
                                                                                fontWeight:
                                                                                FontWeight
                                                                                    .w500,
                                                                                fontSize: 15,
                                                                                color: Color(
                                                                                    0xFF444444)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height: 13,
                                                                      ),
                                                                      const Text(
                                                                        'Location',
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                            fontSize: 13,
                                                                            color: Color(
                                                                                0xFF9D9D9D)),
                                                                      ),
                                                                      const Text(
                                                                        "site",
                                                                        //  data['extp_location'][0]['name'].toString(),
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                            fontSize: 15,
                                                                            color: Color(
                                                                                0xFF444444)),
                                                                      ),
                                                                      const SizedBox(
                                                                        height: 13,
                                                                      ),
                                                                      const Text(
                                                                        'Birthday',
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                            fontSize: 13,
                                                                            color: Color(
                                                                                0xFF9D9D9D)),
                                                                      ),
                                                                      Text(
                                                                        data['extp_birthday']
                                                                            .toString(),
                                                                        style: const TextStyle(
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                            fontSize: 15,
                                                                            color: Color(
                                                                                0xFF444444)),
                                                                      ),
                                                                      const SizedBox(
                                                                        height: 13,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: 10,
                                                      left: 60,
                                                      right: 60,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Container(
                                                            width: 50,
                                                            height: 5,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    10),
                                                                color: const Color(
                                                                    0xFF8C9DF6)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  child: Container(
                                    // height: 300,
                                    // width: 250,
                                    margin: const EdgeInsets.only(right: 10,),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: const Color(0xFFDEDEDE),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 16),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                8),
                                            child: Image.network(
                                              data['featured_image'].toString(),
                                              width: 90,
                                              height: 80,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            data['title'].toString(),
                                            style: const TextStyle(
                                                color: Color(0xFF333333),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            data['extp_position'].toString(),
                                            style: const TextStyle(
                                                color: Color(0xFF555555),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            data['extp_birthday'].toString(),
                                            style: const TextStyle(
                                                color: Color(0xFF707070),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }
                            else{
                              return Container();
                            }}
                            else{
                              return Container();
                            }

                          }
                        )
                           ]
                      );
                      }
                    }
                ),

              ],
            ),
          ),),
          Padding(
          padding: const EdgeInsets.only(top:10, bottom: 10, left:55, right: 55),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    textStyle: const TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                      side: const BorderSide(color: Colors.grey),
                    ),
                  ),
                  onPressed: (){
                    if(page>0) {
                      setState(() {
                      page = page -1;
                      loading= true;
                    });
                    }
                  }, child: const Text('<', style: TextStyle(fontSize: 30, color: Colors.black),)),
              ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    textStyle: const TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                      side: const BorderSide(color: Colors.grey),
                    ),
                  ),
                  onPressed: (){
                  }, child: Text('${page+1}', style: const TextStyle(fontSize: 30),)),
              ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    textStyle: const TextStyle(color: Colors.white, ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                      side: const BorderSide(color: Colors.grey),
                    ),
                  ),
                  onPressed: (){}, child: Text('${page+2}', style: const TextStyle(fontSize: 30, color: Colors.black),)),
              ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    textStyle: const TextStyle(color: Colors.white, ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                      side: const BorderSide(color: Colors.grey),
                    ),
                  ),
                  onPressed: (){
                    setState(() {
                      page = page + 1;
                      loading= true;
                    });
                  }, child: const Text('>', style: TextStyle(fontSize: 30, color: Colors.black),))
          ],
        ),
    ),
        ],
      ),

    );
  }
}


