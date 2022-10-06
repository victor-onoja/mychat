import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychat/widgets/chat_list.dart';
import 'package:mychat/widgets/colors.dart';
import 'package:mychat/widgets/info.dart';

class SmallChatScreen extends StatelessWidget {
  const SmallChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: textColor),
        backgroundColor: appBarColor,
        title: Text(
          info[0]['name'].toString(),
          style: GoogleFonts.openSansCondensed(
              color: textColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.video_call_sharp)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: Column(children: [
        const Expanded(child: ChatList()),
        TextField(
          decoration: InputDecoration(
              filled: true,
              fillColor: textColor,
              prefixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.emoji_emotions),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.camera_alt),
                    Icon(Icons.attach_file),
                    Icon(Icons.money),
                  ],
                ),
              ),
              hintText: 'Type a message',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      const BorderSide(width: 0, style: BorderStyle.none)),
              contentPadding: const EdgeInsets.all(10)),
        )
      ]),
    );
  }
}
