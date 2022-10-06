import 'package:flutter/material.dart';
import 'package:mychat/widgets/big_screen_chat_app_bar.dart';
import 'package:mychat/widgets/big_screen_profile_bar.dart';
import 'package:mychat/widgets/big_screen_search_bar.dart';
import 'package:mychat/widgets/chat_list.dart';
import 'package:mychat/widgets/colors.dart';
import 'package:mychat/widgets/contacts_list.dart';

class BigScreen extends StatelessWidget {
  const BigScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  BigScreenProfileBar(),
                  BigScreenSearchBar(),
                  ContactsList()
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: const BoxDecoration(
                color: messageColor,
                image: DecorationImage(
                    image: AssetImage('assets/chatbg.png'), fit: BoxFit.cover)),
            child: Column(
              children: [
                BigScreenChatAppBar(),
                Expanded(child: ChatList()),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: appBarColor)),
                      color: appBarColor),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.emoji_emotions_outlined,
                            color: textColor,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.attach_file_sharp,
                            color: textColor,
                          )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 15),
                        child: TextField(
                          decoration: InputDecoration(
                              fillColor: textColor,
                              filled: true,
                              hintText: 'Type a message',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      width: 0, style: BorderStyle.none)),
                              contentPadding: const EdgeInsets.only(left: 20)),
                        ),
                      )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.mic,
                            color: textColor,
                          )),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
