// import 'package:cosmopolitan/screens/documents/widget/page_file_view.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_file_view/flutter_file_view.dart';
// import 'package:flutter_svg/svg.dart';
//
// class Docviewer extends StatefulWidget {
//   final String filePath;
//   final String title;
//   const Docviewer({required this.filePath, required this.title});
//
//   State<Docviewer> createState() => _Docviewer();
//
//
// }
//
// class _Docviewer extends State<Docviewer> {
//   FileViewController? controller;
//
//   void initState(){
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     controller = FileViewController.network('https://employeehub.cosmocentralgroup.co.za/shared-files/4774/Salary-Deduction-Authorisation-Form-1.docx');
//     return Scaffold(
//         appBar: AppBar(
//           leadingWidth: 120,
//           leading: Stack(
//             alignment: Alignment.center,
//             clipBehavior: Clip.none,
//             children: [
//               SizedBox(
//                 width: double.infinity,
//                 height: double.maxFinite,
//                 child: Row(),
//               ),
//               Positioned(
//                 left: 1,
//                 child: Row(
//                   children: [
//                     const SizedBox(
//                       width: 17.0,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: SvgPicture.asset(
//                         'assets/icons/east.svg',
//                         width: 20,
//                         color: const Color(0xff3F3F3F),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 8.0,
//                     ),
//                     Text(
//                       widget.title,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 18,
//                         color: Color(0xFF33343C),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           backgroundColor: Colors.white,
//           elevation: 0.8,
//           shadowColor: Colors.grey.withOpacity(0.3),
//         ),
//         body:
//         Container(
//             child:(widget.filePath.isNotEmpty)? FileViewPage(controller: controller!):Container()
//         )
//     );
//
//   }
// }