import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OurJourney extends StatelessWidget {
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
                    width: 8.0,
                  ),
                  const Text(
                    "Our Journey",
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
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            RichText(
              softWrap: true,
              text: TextSpan(
                  style: TextStyle(
                    wordSpacing: 8,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF555555).withOpacity(0.8),
                  ),
                  children: const [
                     TextSpan(
                        text:
                            'In 1992, Managing Director, Anton Crouse,founded Cosmopolitan Projects.Two years later,the first democratic elections in South Africa ushered in a new era for South Africa and with it an ideal environment for Cosmopolitan Projects to grow and flourish.\n\n'),
                    TextSpan(
                        text:
                            'Since 1992 Cosmopolitan Projects has completely changed the face of countless townships and suburbs as well as the lives of home owners throughout Gauteng. Areas in which some of its flagship developments have been done include Protea Glen in Soweto, Vosloorus and Windmill Park on the East Rand, Cosmo City North of Johannesburg and Naturena and Kibler Park to the South, Olievenhoutbosch in Centurion, Mahube Valley and Gem Valley in Mamelodi, Danville and Lotus Gardens in Pretoria West and Rosslyn north of Pretoria – to name but a few.\n\n'),
                    TextSpan(
                        text:
                            'Following a trend of phenomenal growth in the late 90’s, the group finance, project management, land development and construction divisions were born. Cosmopolitan Property Developments, the front-runner for Central Developments, was established to focus on the delivery of serviced stands and high-end developments.\n\n'),
                    TextSpan(
                        text:
                            'The new millennium saw unparalleled growth in the property industry, both globally and locally. During this time the foundation was laid for the establishment of Central Developments. Taking advantage of favourable market conditions, Central Developments launched several ground breaking projects which led to the establishment of the company’s cutting edge project management and marketing systems. On the back of early successes, Central Developments continued expanding throughout Gauteng focusing on high cost security developments.\n\n'),
                    TextSpan(
                        text:
                            'Today, with a proven track record the Cosmopolitan Projects and Central Developments Property Group enjoys a market leading position in its chosen residential segments of the South African property industry namely affordable and charter housing, retirement villages, secure developments and rental complexes.\n\n'),
                    TextSpan(
                        text:
                            'Cosmopolitan Projects was one of the first housing developers to venture into land development to deliver its own serviced stands, a decision that stood the company in good stead in the years to follow. When the National Home Builders Registration Council (NHBRC) was formed in 1996, Cosmopolitan Projects was the first developer to enrol 1 000 units with the organisation.\n\n')
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
