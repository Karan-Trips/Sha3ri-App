import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class ChatDetailsPage extends StatefulWidget {
  final int chatId;
  final String chatName;
  final String chatImage;
  final bool status;

  const ChatDetailsPage(
      {super.key,
      required this.chatId,
      required this.chatName,
      required this.chatImage,
      required this.status});

  @override
  State<ChatDetailsPage> createState() => _ChatDetailsPageState();
}

class _ChatDetailsPageState extends State<ChatDetailsPage> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final List<types.Message> _messages = [];
  final types.User _user = types.User(id: 'user-id');

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: 'message-id-${_messages.length + 1}',
      text: message.text,
    );

    setState(() {
      _messages.insert(0, textMessage);
    });
    _textController.clear();
  }

  Future<void> _handleImageSelection() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final types.Message imageMessage = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: 'image-message-id-${_messages.length + 1}',
        name: image.name,
        size: File(image.path).lengthSync(),
        uri: image.path,
      );
      setState(() {
        _messages.insert(0, imageMessage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
          title: Row(children: [
            CircleAvatar(
              radius: 16.r,
              backgroundImage: AssetImage(widget.chatImage),
            ).wrapPaddingRight(15.w),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                widget.chatName,
                style: w600_16.copyWith(
                    fontSize: 14.sp,
                    color: isDarkMode ? AppColor.white : AppColor.black),
              ),
              Row(children: [
                Icon(size: 7.h, Icons.circle, color: const Color(0xff1DB173))
                    .wrapPaddingRight(5.w),
                Text(widget.status ? "Online" : "Offline",
                    style: w400_14.copyWith(color: const Color(0xff1DB173)))
              ])
            ])
          ]),
          actions: [
            Image.asset(Assets.more_vert, height: 24.h, width: 24.w)
                .wrapPaddingRight(16.w)
          ]),
      body: Chat(
        theme: isDarkMode
            ? DarkChatTheme(backgroundColor: AppColor.black)
            : DefaultChatTheme(),
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user,
        hideBackgroundOnEmojiMessages: true,
        useTopSafeAreaInset: true,
        usePreviewData: true,
        customBottomWidget: Container(
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(width: .92.w, color: AppColor.lightgrey)),
          ),
          child: Row(
            children: [ 
              Expanded(
                child: TextFormField(
                    controller: _textController,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(91.r),
                      ),
                      filled: true,
                      fillColor: isDarkMode
                          ? Color.fromARGB(255, 37, 43, 49)
                          : Color(0xffF5F6F7),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(91.r),
                      ),
                      prefixIcon: IconButton(
                        icon: Icon(Icons.attach_file_sharp),
                        onPressed: () => _handleImageSelection(),
                      ),
                      hintText: 'Write a message',
                      contentPadding: EdgeInsets.only(left: 20.w),
                    ),
                    textInputAction: TextInputAction.send,
                    onFieldSubmitted: (text) {
                      if (text.isNotEmpty) {
                        _handleSendPressed(types.PartialText(text: text));
                      }
                    }).wrapPaddingLeft(15.w).wrapPaddingVertical(10.h),
              ),
              GestureDetector(
                      onTap: () {
                        if (_textController.text.isNotEmpty) {
                          _handleSendPressed(
                              types.PartialText(text: _textController.text));
                        }
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xff388DEB)),
                          padding: EdgeInsets.all(9.r),
                          child: Image.asset(Assets.send,
                              height: 22.h, width: 22.w)))
                  .wrapPaddingLeft(11.w)
            ],
          ),
        ),
      ),
    );
  }
}
