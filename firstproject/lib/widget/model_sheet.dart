import 'package:comment_tree/data/comment.dart';
import 'package:comment_tree/widgets/comment_tree_widget.dart';
import 'package:comment_tree/widgets/tree_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentSheet extends StatefulWidget {
  const CommentSheet({super.key});

  @override
  _CommentSheetState createState() => _CommentSheetState();
}

class _CommentSheetState extends State<CommentSheet> {
  final List<Comment> comments = [
    Comment(
        avatar: 'null',
        userName: 'karan',
        content: 'hello bhai-log sab thik hai na?'),
    Comment(
        avatar: 'null', userName: 'raju kumar', content: 'Tu bata apna ???'),
    Comment(
        avatar: 'null',
        userName: 'op gg',
        content:
            'There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...'),
    Comment(
        avatar: 'null',
        userName: 'kaka',
        content: 'A Dart template generator which helps teams'),
    Comment(
        avatar: 'null',
        userName: 'dino',
        content:
            'A Dart template generator which helps teams generator which helps teams'),
  ];

  final Map<Comment, List<Comment>> replies = {};
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Comment? _selectedComment;

  void _handleReply(Comment? comment, String text) {
    if (text.isNotEmpty) {
      final newReply = Comment(
        avatar: Assets.a3,
        userName: 'you',
        content: text,
      );
      setState(() {
        if (comment != null) {
          replies[comment] = (replies[comment] ?? [])..add(newReply);
        } else {
          comments.add(newReply);
        }
        _textController.clear();
        _selectedComment = null;
      });
    }
  }

  void _focusOnTextField(Comment? comment) {
    setState(() {
      _selectedComment = comment;
    });
    FocusScope.of(context).requestFocus(_focusNode);
  }

  Widget _buildCommentContent(Comment data, bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.userName ?? 'op',
                style: w500_14.copyWith(
                  fontSize: 12.sp,
                  color: isDarkMode ? AppColor.white : AppColor.black,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                data.content ?? '',
                style: w400_14.copyWith(
                  color: isDarkMode ? AppColor.white : AppColor.lightgrey,
                ),
              ),
            ],
          ),
        ),
        DefaultTextStyle(
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: Colors.grey[700],
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Row(
              children: [
                Text(
                  "2d",
                  style: w400_14.copyWith(
                    fontSize: 12.sp,
                    color: isDarkMode ? AppColor.white : AppColor.lightgrey,
                  ),
                ),
                TextButton(
                  onPressed: () => _focusOnTextField(data),
                  child: Text(
                    'Reply',
                    style: w400_14.copyWith(
                      fontSize: 12.sp,
                      color: AppColor.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          children: [
            Text(
              "Comment(${comments.length})",
              style: w600_20.copyWith(
                color: isDarkMode ? AppColor.white : AppColor.black,
              ),
            ).wrapPaddingBottom(15.h),
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    final comment = comments[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommentTreeWidget<Comment, Comment>(
                          comment,
                          replies[comment] ?? [],
                          treeThemeData:
                              TreeThemeData(lineColor: Colors.transparent),
                          avatarRoot: (context, data) => PreferredSize(
                            preferredSize: Size.fromRadius(19.r),
                            child: CircleAvatar(
                              radius: 19.r,
                              backgroundImage: AssetImage(Assets.a1),
                            ),
                          ),
                          contentRoot: (context, data) =>
                              _buildCommentContent(data, isDarkMode),
                          avatarChild: (context, data) => PreferredSize(
                            preferredSize: Size.fromRadius(19.r),
                            child: CircleAvatar(
                              radius: 19.r,
                              backgroundColor: Colors.grey,
                              backgroundImage: AssetImage(Assets.a2),
                            ),
                          ),
                          contentChild: (context, data) =>
                              _buildCommentContent(data, isDarkMode),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _textController,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.lightgrey),
                        borderRadius: BorderRadius.circular(91.r),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(91.r),
                      ),
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.attach_file_sharp),
                      ),
                      hintText: _selectedComment == null
                          ? 'Write a message'
                          : 'Replying to ${_selectedComment?.userName ?? ''}',
                      contentPadding: EdgeInsets.only(left: 20.w),
                    ),
                    textInputAction: TextInputAction.send,
                    onFieldSubmitted: (text) =>
                        _handleReply(_selectedComment, text),
                  ).wrapPaddingLeft(15.w),
                ),
                GestureDetector(
                  onTap: () =>
                      _handleReply(_selectedComment, _textController.text),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xff388DEB),
                    ),
                    padding: EdgeInsets.all(9.r),
                    child: Image.asset(
                      Assets.send,
                      height: 22.h,
                      width: 22.w,
                    ),
                  ),
                ).wrapPaddingLeft(11.w),
              ],
            ).wrapPaddingBottom(10.h),
          ],
        ).wrapPaddingHorizontal(16.w),
      ),
    );
  }
}
