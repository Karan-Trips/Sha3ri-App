// import 'package:comment_tree/data/comment.dart';
// import 'package:comment_tree/widgets/comment_tree_widget.dart';
// import 'package:comment_tree/widgets/tree_theme_data.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_demo_structure/generated/assets.dart';
// import 'package:flutter_demo_structure/values/export.dart';

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           child: CommentTreeWidget<Comment, Comment>(
//             Comment(
//                 avatar: 'null',
//                 userName: 'null',
//                 content: 'felangel made felangel/cubit_and_beyond public '),
//             [
//               Comment(
//                   avatar: 'null',
//                   userName: 'null',
//                   content: 'A Dart template generator which helps teams'),
//               Comment(
//                   avatar: 'null',
//                   userName: 'null',
//                   content:
//                       'A Dart template generator which helps teams generator which helps teams generator which helps teams'),
//               Comment(
//                   avatar: 'null',
//                   userName: 'null',
//                   content: 'A Dart template generator which helps teams'),
//               Comment(
//                   avatar: 'null',
//                   userName: 'null',
//                   content:
//                       'A Dart template generator which helps teams generator which helps teams '),
//             ],
//             treeThemeData: TreeThemeData(
//               lineColor: Colors.transparent,
//             ),
//             avatarRoot: (context, data) => PreferredSize(
//               child: CircleAvatar(
//                 radius: 18,
//                 backgroundColor: Colors.grey,
//                 backgroundImage: AssetImage(Assets.a1),
//               ),
//               preferredSize: Size.fromRadius(18),
//             ),
//             avatarChild: (context, data) => PreferredSize(
//               child: CircleAvatar(
//                 radius: 12,
//                 backgroundColor: Colors.grey,
//                 backgroundImage: AssetImage(Assets.a2),
//               ),
//               preferredSize: Size.fromRadius(12),
//             ),
//             contentChild: (context, data) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
//                     decoration: BoxDecoration(
//                         color: Colors.grey[100],
//                         borderRadius: BorderRadius.circular(12)),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'dangngocduc',
//                           style: w400_14.copyWith(color: Colors.black),
//                         ),
//                         SizedBox(
//                           height: 4,
//                         ),
//                         Text(
//                           '${data.content}',
//                           style: w500_14.copyWith(color: Colors.black),
//                         ),
//                       ],
//                     ),
//                   ),
//                   DefaultTextStyle(
//                     style: w400_14.copyWith(
//                         color: Colors.grey[700], fontWeight: FontWeight.bold),
//                     child: Padding(
//                       padding: EdgeInsets.only(top: 4),
//                       child: Row(
//                         children: [
//                           SizedBox(
//                             width: 8,
//                           ),
//                           Text('Like'),
//                           SizedBox(
//                             width: 24,
//                           ),
//                           Text('Reply'),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               );
//             },
//             contentRoot: (context, data) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
//                     decoration: BoxDecoration(
//                         color: Colors.grey[100],
//                         borderRadius: BorderRadius.circular(12)),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Karan',
//                           style: w600_20.copyWith(color: Colors.black),
//                         ),
//                         SizedBox(
//                           height: 4,
//                         ),
//                         Text(
//                           '${data.content}',
//                           style: w500_14,
//                         ),
//                       ],
//                     ),
//                   ),
//                   DefaultTextStyle(
//                     style: w400_14.copyWith(
//                         color: Colors.grey[700], fontWeight: FontWeight.bold),
//                     child: Padding(
//                       padding: EdgeInsets.only(top: 4),
//                       child: Row(
//                         children: [
//                           SizedBox(
//                             width: 8,
//                           ),
//                           Text('Like'),
//                           SizedBox(
//                             width: 24,
//                           ),
//                           Text('Reply'),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               );
//             },
//           ),
//           padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//         ),
//       ),
//     );
//   }
// }
