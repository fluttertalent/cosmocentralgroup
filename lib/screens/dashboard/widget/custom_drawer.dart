
import 'package:cosmopolitan/screens/about_us/about_us.dart';
import 'package:cosmopolitan/screens/about_us/webviewdisplay.dart';
import 'package:cosmopolitan/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../profile_screen/edit_profile.dart';
import '../../profile_screen/profile.dart';
import 'custom_list_tile.dart';
import 'dart:developer';

import 'package:http/http.dart' as http;

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}
class _CustomDrawerState extends State<CustomDrawer> {
  late SharedPreferences preferences;
  String name = '';
  String email = '';
  void initState() {

  }
  initShared()async{
    setState(() async {
      preferences = await SharedPreferences.getInstance();
      name = preferences.getString('username')!;
      email = preferences.getString('email')!;
    });
  }

  logout() async {
    try {

      // var token = preferences.getString('token');
      // log("get token");
      // log("Token: $token");
      // final responce = await http.post(
      //     Uri.parse('https://hqsupplys.com/public/api/logout'),
      //     headers: {
      //       'Accept': "application/json",
      //       'Content-Type': "application/json",
      //       // 'Authorization' : "Bearer $token",
      //     },
      // );
      // print(responce.statusCode);
      // if (responce.statusCode == 200) {
      //   log("Logout success!");
      //   Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(builder: (context) => LoginScreen()));
      //   // preferences.remove('token');
      // } else {
      //   log("logout not successful");
      // }
      preferences = await SharedPreferences.getInstance();
      preferences.setString('name','');
      preferences.setString('email','');
      preferences.setBool('loggedin',false);
      log('logout successful');
      Fluttertoast.showToast(msg: 'Logout Success!');
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
    } catch (e) {
      print("Catch Error________________");
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      child: Drawer(
        child: Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              child: DrawerHeader(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15.0,
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 30,
                        child: SvgPicture.asset(
                          'assets/images/avatar.svg',
                          width: double.maxFinite,
                          height: double.maxFinite,
                        )),
                    const SizedBox(
                      height: 5.0,
                    ),
                    FutureBuilder(future:initShared(),
                      builder:(context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: Column(
                                children: const [
                                  Text("Loading..."),
                                  CircularProgressIndicator(),
                                ],
                              ));
                        } else {
                          return
                            Column(
                              children: [
                                Text(
                                  name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF343434),
                                      fontSize: 16.5),
                                ),
                                Text(
                                  email,
                                  style: TextStyle(
                                      color: const Color(0xFF666666)
                                          .withOpacity(0.5),
                                      fontSize: 13),
                                )
                              ],
                            );
                        }
                      }
                    ),

                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => EditProfile()));
                    },
                    child: const CustomListTile(
                      imageUrl: 'assets/icons/account_circle_black_24dp.svg',
                      title: 'Edit Profile',
                    ),
                  ),
                  GestureDetector(
                    onTap:(){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => WebViewDisplay(title: 'Employee Self Service', selectedUrl: 'https://cosmocentraless.co.za/webselfservice#/signin',)));
                    },
                    child: const CustomListTile(
                      imageUrl: 'assets/icons/edit_black_24dp (1) 1.svg',
                      title: 'Employee Self Service',
                    ),
                  ),

                  GestureDetector(
                    onTap:(){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => WebViewDisplay(title: 'Recruitment System', selectedUrl: 'https://hrlf.cosmopro.co.za/forms',)));
                    },
                    child: const CustomListTile(
                    imageUrl: 'assets/icons/Group (6).svg',
                    title: 'Recruitment System',
                  ),
                  ),

                  GestureDetector(
                    onTap:(){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => WebViewDisplay(title: 'Family Marketplace', selectedUrl: 'https://cosmocentral.bidpro.co.za/',)));
                    },
                    child: const CustomListTile(
                      imageUrl: 'assets/icons/Vector (1).svg',
                      title: 'Family Marketplace',
                    ),
                  ),
                  GestureDetector(
                    onTap:(){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => WebViewDisplay(title: 'Cosmopolitan careers', selectedUrl: 'https://cosmopolitancareers.pnet.co.za/applicant/index.php',)));
                    },
                    child: const CustomListTile(
                      imageUrl: 'assets/icons/Vector (2).svg',
                      title: 'Careers',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AboutUs()));
                    },
                    child: const CustomListTile(
                      imageUrl: 'assets/icons/Vector (3).svg',
                      title: 'About us',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      logout();
                    },
                    child: const CustomListTile(
                      imageUrl: 'assets/icons/Vector (4).svg',
                      title: 'Logout',
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/cos logo.png',
                        width: 80.0,
                      ),
                      const SizedBox(
                        width: 7.0,
                      ),
                      Image.asset(
                        'assets/images/Central-Developments-Logo_CMYK_Charcoal 1.png',
                        width: 50,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
