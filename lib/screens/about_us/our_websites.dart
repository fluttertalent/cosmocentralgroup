import 'package:cosmopolitan/screens/about_us/webviewdisplay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OurWebsites extends StatelessWidget {
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
                    "Our Websites",
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
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFDEDEDE))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 115,
                          ),
                          Image.asset(
                            'assets/images/Central-Developments-Logo_CMYK_Charcoal 1.png',
                            width: 80,
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => WebViewDisplay(title: "central developments",selectedUrl: "https://www.centraldevelopments.co.za/",)));
                            },
                            child: SvgPicture.asset(
                                'assets/icons/launch_black_24dp 1.svg'),
                          ),

                          const SizedBox(
                            width: 13,
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xFFE8E8E8),
                    ),
                    Text(
                      'www.centraldevelopments.co.za',
                      style: TextStyle(
                          fontSize: 13,
                          color: const Color(0xFF6A6A6A).withOpacity(0.9)),
                    ),
                    const SizedBox(
                      height: 12,
                    )
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFDEDEDE))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 115,
                          ),
                          Image.asset(
                            'assets/images/cos logo.png',
                            width: 90,
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap:(){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => WebViewDisplay(title: "cosmo",selectedUrl: "https://cosmo.co.za/",)));
                            },
                            child: SvgPicture.asset(
                              'assets/icons/launch_black_24dp 1.svg'),
                          ),

                          const SizedBox(
                            width: 13,
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xFFE8E8E8),
                    ),
                    Text(
                      'www.cosmo.co.za',
                      style: TextStyle(
                          fontSize: 13,
                          color: const Color(0xFF6A6A6A).withOpacity(0.9)),
                    ),
                    const SizedBox(
                      height: 12,
                    )
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFDEDEDE))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 75,
                          ),
                          Image.asset(
                            'assets/images/cos logo.png',
                            width: 90,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Image.asset(
                            'assets/images/Central-Developments-Logo_CMYK_Charcoal 1.png',
                            width: 70,
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap:(){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => WebViewDisplay(title: "central development",selectedUrl: "https://centraldevelopments.co.za/",)));
                            },
                            child:SvgPicture.asset(
                                'assets/icons/launch_black_24dp 1.svg'),
                          ),

                          const SizedBox(
                            width: 13,
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xFFE8E8E8),
                    ),
                    Text(
                      'www.centraldevelopments.co.za',
                      style: TextStyle(
                          fontSize: 13,
                          color: const Color(0xFF6A6A6A).withOpacity(0.9)),
                    ),
                    const SizedBox(
                      height: 12,
                    )
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
