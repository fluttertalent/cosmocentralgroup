
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cosmopolitan/screens/whoiswho/who_is_who.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'all_employee_model.dart';

class ApplyFilter extends StatefulWidget {
  const ApplyFilter({Key? key, this.name}) : super(key: key);
  final String? name;
  @override
  State<ApplyFilter> createState() => _ApplyFilterState();
}
class _ApplyFilterState extends State<ApplyFilter> {
  String categoryValue = '';
  var categories = [
    '',
    'CAM',
    'CDP',
    'Cosmo JHB',
    'Central Square',
    'Shared Services',
    'Stronger Together',
    'Central Castle Gate',
    'Cosmo Project Management',
    'Cosmo Consult & Land Development',
  ];
  String locationValue = "";
  var locations = [
    '',
    'CDP',
    'Site',
    'Office',
    'Route 82',
    'New Town',
    'Bedford view',
    'Sky City (Egon)',
    'Sky City (Alvin & Joseph)',
    'Lion Pride (Johan & Irene)',
  ];
  bool loading = false;
  AllEmployees allEmployees = AllEmployees();

  filterEmployees(categories, locations, name) async {
    setState(() {
      loading = true;
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    log("get token");
    log("Token: $token");

    log("Api Calling..... ");

    var api = "https://hqsupplys.com/public/api/employee/search?category==$categories||location==$locations||name==$name";
    var response = await http.post(
        Uri.parse(api),
        headers: {
          'Accept': "application/json",
          'Content-Type': "application/json",
          'Authorization' : "Bearer $token",
        },
        body: jsonEncode(
          {
            'category': '$categories',
            'location': '$locations',
            'name': '$name'
          })
    );
    print(response.statusCode);
    print("Body: ${response.body}");
    if (response.statusCode == 200) {
      setState(() {
     //   allEmployees = allEmployeesFromJson(response.body);
      });
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => WhoIsWho(category: categoryValue,location: locationValue,)));
    } else {
      print("Server Error! ");
    }
    log("Api Okey... ");
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Apply Filter",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xFF33343C),
          ),
        ),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(
              'assets/icons/east.svg',
              width: 20,
              color: const Color(0xff3F3F3F),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.8,
        shadowColor: Colors.grey.withOpacity(0.3),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Category',
              style: TextStyle(
                  color: Color(0xFF33343C),
                  fontWeight: FontWeight.w600,
                  fontSize: 13.5),
            ),
            const SizedBox(
              height: 5.9,
            ),
            DropdownButton(
               isExpanded: true,
              value: categoryValue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: categories.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  categoryValue = newValue!;
                });
              },
            ),


            const SizedBox(
              height: 20,
            ),
            const Text(
              'Location',
              style: TextStyle(
                  color: Color(0xFF33343C),
                  fontWeight: FontWeight.w600,
                  fontSize: 13.5),
            ),
            const SizedBox(
              height: 5.9,
            ),
            DropdownButton(
              isExpanded: true,
              value: locationValue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: locations.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  locationValue = newValue!;
                });
              },
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WhoIsWho(category: categoryValue,location: locationValue,)));
              },
              child: Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFF243690)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 14.0, vertical: 16),
                  child: Text(
                    'Apply',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

