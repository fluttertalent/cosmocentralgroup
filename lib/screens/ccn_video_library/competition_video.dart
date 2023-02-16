import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

class CompetitionVideo extends StatefulWidget{
  final url;
  final txt;
  final date;
  const CompetitionVideo({Key? key, this.url, this.txt, this.date}) : super(key: key);
  @override
  State<CompetitionVideo> createState() => _CompetitionVideo();
}

class _CompetitionVideo extends State<CompetitionVideo> {

  late VideoPlayerController _controller;
  @override
  void initState(){
    super.initState();
    _controller = VideoPlayerController.network(
        widget.url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
  }

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
                  Text(
                    widget.txt,
                    style: const TextStyle(
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
      body: Container(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Center(
                    child: _controller.value.isInitialized
                        ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                        : Container(),
                  ),
                  GestureDetector(
                    onTap: (){
                      print('start');
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: _controller.value.isPlaying ? Image.asset(
                            'assets/icons/play_circle_filled_black_24dp 1.png'):Image.asset(
                            'assets/icons/play_circle_filled_black_24dp 1.png'),
                      ),
                    ),
                  ),

                ],
              ),
              const SizedBox(
                height: 9.0,
              ),
              Text(
                widget.txt,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFF333333)),
              ),
              Text(
                'Posted on ${widget.date}',
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFF555555)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
