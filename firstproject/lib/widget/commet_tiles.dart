
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/assets.dart';

class Comment {
  final String author;
  final String content;
  final String time;

  Comment(this.author, this.content, this.time);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Comment &&
          runtimeType == other.runtimeType &&
          author == other.author &&
          content == other.content &&
          time == other.time;

  @override
  int get hashCode => author.hashCode ^ content.hashCode ^ time.hashCode;
}
class CommentTile extends StatelessWidget {
  final Comment comment;
  final VoidCallback onReplyPressed;
  final List<Comment> replies;
  final void Function(Comment) onReplyAdded;

  CommentTile({
    required this.comment,
    required this.onReplyPressed,
    required this.replies,
    required this.onReplyAdded,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkmode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
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
                  TextButton(
                    onPressed: onReplyPressed,
                    child: Text('Reply',
                        style: w500_14.copyWith(
                            fontSize: 12.spMax, color: AppColor.blue)),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Show replies by default
        ...replies.map((reply) => Padding(
          padding: EdgeInsets.only(left: 40.0),
          child: CommentTile(
            comment: reply,
            onReplyPressed: () {},
            replies: [],
            onReplyAdded: (newReply) {},
          ),
        )),
      ],
    );
  }
}
