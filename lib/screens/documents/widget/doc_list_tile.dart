import 'package:cosmopolitan/screens/documents/widget/pdfviewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:open_file/open_file.dart';

class DocListTile extends StatelessWidget {

  final String title;
  final String url;
  const DocListTile({required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: 9),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color(0xFFDEDEDE))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/Group (1).svg',
              width: 20,
            ),
            const SizedBox(
              width: 12,
            ),
            Flexible(
             child: Container(
               width: MediaQuery.of(context).size.width*0.8,
               child: Text(
                 title,
                 style: const TextStyle(
                     fontSize: 15.5,
                     fontWeight: FontWeight.w500,
                     color: Color(0xFF33343C)),
               )
             )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                  color: const Color(0xFFEEF1FF),
                  borderRadius: BorderRadius.circular(5)),
              child: GestureDetector(
                onTap:(){
                  // OpenFile.open(url);
                   Navigator.push(context,
                       MaterialPageRoute(builder: (context) => PDFViewer(url: url, title: title)));
                },
                 child: const Text(
                   'View',
                   style: TextStyle(
                       color: Color(0xFF243690),
                       fontWeight: FontWeight.w600,
                       fontSize: 13),
                 ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
