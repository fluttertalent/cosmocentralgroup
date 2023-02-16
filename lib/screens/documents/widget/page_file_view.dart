// import 'package:flutter/material.dart';
// import 'package:flutter_file_view/flutter_file_view.dart';
//
// class FileViewPage extends StatefulWidget {
//   // ignore: public_member_api_docs
//   const FileViewPage({Key? key, required this.controller}) : super(key: key);
//
//   /// The [FileViewController] responsible for the file being rendered in this
//   /// widget.
//   final FileViewController controller;
//
//   @override
//   State<FileViewPage> createState() => _FileViewPageState();
// }
//
// class _FileViewPageState extends State<FileViewPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: FileView(
//               controller: widget.controller,
//               onCustomViewStatusBuilder: (_, ViewStatus status) {
//                 if (status == ViewStatus.LOADING) {
//                  return Container(
//                    width: 50,
//                    height: 50,
//                    child: CircularProgressIndicator()
//                  );
//                 }
//                 return null;
//               },
//               onCustomX5StatusBuilder: (_, X5Status status) {
//                 if (status == ViewStatus.LOADING) {
//                   return Container(
//                       width: 50,
//                       height: 50,
//                       child: CircularProgressIndicator()
//                 );
//                 }
//                 return null;
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
