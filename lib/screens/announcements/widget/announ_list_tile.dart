import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../documents/widget/pdfviewer.dart';

class AnnounListTile extends StatelessWidget {
  final String title;
  final String url;
  AnnounListTile({required this.title, required this.url});
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
              'assets/icons/Group (5).svg',
              width: 20,
              color: const Color(0xFF757676),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 15.5,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF33343C)),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PDFViewer(url: url, title: title)));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                    color: const Color(0xFFEEF1FF),
                    borderRadius: BorderRadius.circular(5)),
                child: const Text(
                  'View',
                  style: TextStyle(
                      color: Color(0xFF243690),
                      fontWeight: FontWeight.w600,
                      fontSize: 13),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
