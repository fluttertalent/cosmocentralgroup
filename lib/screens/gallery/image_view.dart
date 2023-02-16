import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageView extends StatelessWidget {
  final String imgurl;
  // final String imgdes;
  // ImageView({required this.imgdes, required this.imgurl});
  ImageView({required this.imgurl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SvgPicture.asset('assets/icons/cross.svg'),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Spacer(),
          Center(
            child:Image.network(
            imgurl,
            width: double.maxFinite,
            fit: BoxFit.contain,
          )
          ),
          Spacer(),
          // Text(
          //   imgdes,
          //   softWrap: true,
          //   style: const TextStyle(
          //       fontWeight: FontWeight.w600, fontSize: 17, color: Colors.white),
          // ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
