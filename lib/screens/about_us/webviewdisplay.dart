import 'dart:async';

import 'package:flutter_svg/svg.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class WebViewDisplay extends StatelessWidget {
  final String title;
  final String selectedUrl;

  final Completer<WebViewController> _controller = Completer<WebViewController>();

  WebViewDisplay({
    required this.title,
    required this.selectedUrl,
  });

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
                    Text(
                      title,
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
        body: WebView(
          initialUrl: selectedUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ));
  }
}