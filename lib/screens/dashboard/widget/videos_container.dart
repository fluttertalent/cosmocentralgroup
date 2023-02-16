import 'package:flutter/material.dart';

class VideosContainer extends StatelessWidget {
  const VideosContainer({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);
  final String imageUrl;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 150,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        imageUrl,
                      )),
                ),
              ),
              Container(
                width: 150,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Image.asset(
                      'assets/icons/play_circle_filled_black_24dp 1.png'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 9.0,
          ),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.5,
                color: Color(0xFF333333)),
          ),
        ],
      ),
    );
  }
}
