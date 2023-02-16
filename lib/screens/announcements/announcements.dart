import 'package:cosmopolitan/screens/announcements/widget/announ_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../documents/widget/doc_list_tile.dart';

class Announcements extends StatelessWidget {
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
                    "Announcements",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              '19 October, 2022',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF888888),
                  fontSize: 14),
            ),
            AnnounListTile(
              title: 'Annual shutdown',url:'https://employeehub.cosmocentralgroup.co.za/wp-content/uploads/2023/02/Memo-Annual-Shutdown-2023_24.pdf'
            ),
            AnnounListTile(
              title: 'MEMO: Covid-19 Protocol\nAmendment',url: 'https://employeehub.cosmocentralgroup.co.za/wp-content/uploads/2022/07/Memo-Revised-Covid-19-Protocol-11-Jul-2022.pdf',
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '19 October, 2022',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF888888),
                  fontSize: 14),
            ),
            AnnounListTile(
              title: 'MEMO: Covid-19 Protocol\nAmendment',url:'https://employeehub.cosmocentralgroup.co.za/wp-content/uploads/2022/07/Memo-Revised-Covid-19-Protocol-11-Jul-2022.pdf'
            ),
            AnnounListTile(
              title:
                  'MEMO: Economic Impact on\nour Business – Message\nfrom Anton Crouse',url:'https://employeehub.cosmocentralgroup.co.za/wp-content/uploads/2022/06/Memo-Economic-Impact-June-2022.pdf'
            ),
            AnnounListTile(
              title: 'New employee introductions',url:'https://employeehub.cosmocentralgroup.co.za/wp-content/uploads/2023/02/New-Employee-Introductions-Jan-2023.pdf'
            ),
          ],
        ),
      ),
    );
  }
}
