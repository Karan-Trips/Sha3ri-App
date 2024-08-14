import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/widget/commet_tiles.dart';
import 'package:flutter_demo_structure/widget/side_buttons.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentSheet extends StatefulWidget {
  @override
  _CommentSheetState createState() => _CommentSheetState();
}

class _CommentSheetState extends State<CommentSheet> {
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

  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  void _handleSubmit(String text) {
    if (text.isNotEmpty) {
      final newReply = Comment('Current User', text, 'Just now');
      setState(() {
        replies[comments.last]?.add(newReply);
        _textController.clear();
      });
    }
  }

  void _focusOnTextField() {
    FocusScope.of(context).requestFocus(_focusNode);
  }

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
                  CommentTile(
                    comment: comment,
                    onReplyPressed: () {
                      _focusOnTextField(); // Focus on TextFormField when replying
                    },
                    replies: replies[comment] ?? [],
                    onReplyAdded: (newReply) {
                      setState(() {
                        replies[comment]?.add(newReply);
                      });
                    },
                  ),
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
                child: TextFormField(
                  controller: _textController,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    labelText: 'Write a message',
                    prefixIcon: IconButton(
                        onPressed: () {}, icon: Icon(Icons.attach_file_sharp)),
                    hintText: 'Write a message',
                    contentPadding: EdgeInsets.only(left: 20.w),
                  ),
                  textInputAction: TextInputAction.send,
                  onFieldSubmitted: _handleSubmit,
                ).wrapPaddingOnly(left: 15.w, right: 10.w),
              ),
              SideButtons(
                color: Colors.blue,
                image: Assets.share_white,
                onPressed: () {
                  final text = _textController.text;
                  _handleSubmit(text);
                },
              ).wrapPaddingRight(15.w)
            ],
          ),
        ),
      ],
    );
  }
}
