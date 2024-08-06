import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/values/export.dart';

@RoutePage()
class FollowerPage extends StatefulWidget {
  const FollowerPage({super.key});

  @override
  State<FollowerPage> createState() => _FollowerPageState();
}

class _FollowerPageState extends State<FollowerPage> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: TextFormField(
                decoration:
                    InputDecoration(filled: true, fillColor: Color(0xffF5F6F7)),
              )),
          title: Text(
            "Follower",
            style: w600_16.copyWith(
                color: isDarkMode ? AppColor.white : AppColor.black),
          )),
    );
  }
}
