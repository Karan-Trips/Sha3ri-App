import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/widget/side_buttons.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/app_text_filed.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentSheet extends StatelessWidget {
  final List<Comment> comments = [
    Comment('Lisa Lindsey', 'Beautiful', '2d'),
    Comment('Annie Ogawa', 'very interesting', '2d'),
    Comment(
        'Lisa Lindsey',
        'It is a long established fact that a reader will be distracted by the readable content',
        '2d'),
    Comment(
        'Lauren Luther',
        'It is a long established fact that a reader will be distracted by the readable content',
        '2d'),
    Comment(
        'Lauren Luther', 'It is a long established fact that a reader', '2d'),
  ];

  final Map<Comment, List<Comment>> replies = {
    Comment('Lisa Lindsey', 'Beautiful', '2d'): [
      Comment('Annie Ogawa', 'Indeed it is!', '1d'),
      Comment('Lauren Luther', 'Absolutely!', '1d'),
    ],
    Comment('Annie Ogawa', 'very interesting', '2d'): [
      Comment('Lisa Lindsey', 'I agree!', '1d'),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Comments (12.5K)",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        SizedBox(height: 15.h),
        Expanded(
          child: ListView.builder(
            itemCount: comments.length,
            itemBuilder: (context, index) {
              final comment = comments[index];
              return Column(
                children: [
                  CommentTile(comment: comment),
                  if (replies.containsKey(comment))
                    ...replies[comment]!
                        .map((reply) => Padding(
                              padding: EdgeInsets.only(left: 40.0),
                              child: CommentTile(comment: reply),
                            ))
                        .toList(),
                ],
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: Color(0xffEDEDED), width: 0.92))),
          child: Row(
            children: [
              Expanded(
                child: AppTextField(
                  label: 'Write a message',
                  prefixIcon: IconButton(
                      onPressed: () {}, icon: Icon(Icons.attach_file_sharp)),
                  hint: 'Write a message',
                  keyboardAction: TextInputAction.send,
                  contentPadding: EdgeInsets.only(left: 20.w),
                ).wrapPaddingOnly(left: 15.w, right: 10.w),
              ),
              SideButtons(color: Colors.blue, image: Assets.share_white)
                  .wrapPaddingRight(15.w)
            ],
          ),
        )
      ],
    );
  }
}

class Comment {
  final String author;
  final String content;
  final String time;

  Comment(this.author, this.content, this.time);
}

class CommentTile extends StatelessWidget {
  final Comment comment;

  CommentTile({required this.comment});

  @override
  Widget build(BuildContext context) {
    bool isDarkmode = Theme.of(context).brightness == Brightness.dark;
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(Assets.cmt_girl),
      ),
      title: Text(
        comment.author,
        style: w500_14.copyWith(
            fontSize: 12.spMax,
            color: isDarkmode ? AppColor.white : AppColor.black),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(comment.content),
          SizedBox(height: 5.h),
          Row(
            children: [
              Text(comment.time,
                  style: w500_14.copyWith(
                      fontSize: 12.spMax, color: AppColor.lightgrey)),
              SizedBox(width: 8),
              Text('Reply',
                  style: w500_14.copyWith(
                      fontSize: 12.spMax, color: AppColor.blue)),
            ],
          ),
        ],
      ),
    );
  }
}
