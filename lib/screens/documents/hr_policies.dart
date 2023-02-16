
import 'dart:convert';

import 'package:cosmopolitan/screens/documents/widget/doc_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HrPolicies extends StatefulWidget {
  final category ;
  final location ;
  const HrPolicies({Key? key,this.category,this.location}) : super(key: key);
  @override
  State<HrPolicies> createState() => _HrPolicies();
}

class _HrPolicies extends State<HrPolicies> {

  var hr_data = [];
  var hr_lng = 0;
  bool loading = true;
  List<Widget> docTileList = [];
  gethrdocs() async {
    print('gethrdocs');
    var headers = {'Authorization': 'Basic cHJvamVjdEBnb2Rlc2lnbi5wazpEQU5QIFVxdGYgeXAxaSBxakxyIGZQVnQgMm52ZQ=='};
    var request = http.Request('GET',
        Uri.parse('https://employeehub.cosmocentralgroup.co.za/wp-json/cosmopolitan_rest_api/v1/get-documents'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      List<Widget> tempTileList = [];
      var res = await response.stream.bytesToString();
      var body = jsonDecode(res);
      for(var item in body){
        var tmp = item['categories'];
        if(tmp !=false && item['categories'][0]['name'] == 'HR Policies') {
          tempTileList.add(
            DocListTile(
              title: item['title'],url: item['sf_file_url'],
            )
          );
        }
      }
      setState(() {
        loading = false;
        docTileList = tempTileList;
      });
    } else {
      print(response.reasonPhrase);
    }
  }
  void initState(){
    gethrdocs();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 6,
       ),
        loading? Container():
        Expanded(
        child:ListView(
         children:docTileList,
        ),
        )
      ]);
  }
}
