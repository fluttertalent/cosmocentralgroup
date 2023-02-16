import 'dart:convert';

import 'package:cosmopolitan/screens/documents/hr_procedures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'event_forms.dart';
import 'hr_forms.dart';
import 'hr_policies.dart';

class Documents extends StatefulWidget {
  @override
  _DocumentsState createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
                        "Documents",
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
            bottom: const TabBar(
                indicatorWeight: 3,
                unselectedLabelColor: Color(0xFF333333),
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelStyle: TextStyle(
                  fontSize: 16,
                ),
                labelColor: Color(0xFF243690),
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                indicatorColor: Color(0xFF243690),
                tabs: [
                  Tab(
                    text: 'HR Policies',
                  ),
                  Tab(
                    text: 'HR Procedures',
                  ),
                  Tab(
                    text: 'HR Forms',
                  ),
                  Tab(
                    text: 'Event Documents',
                  ),
                ])),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 22),
          child:
              const TabBarView(
              children: [
                  HrPolicies(),
                  HrProcedures(),
                  HrForms(),
                  EventForms()
              ])
        ),
      ));
  }
}
