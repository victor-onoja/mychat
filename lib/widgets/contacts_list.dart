import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychat/screens/small_chat_screen.dart';
import 'package:mychat/widgets/colors.dart';
import 'package:mychat/widgets/info.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SmallChatScreen()));
                },
                child: ListTile(
                  title: Text(info[index]['name'].toString(),
                      style: GoogleFonts.openSansCondensed(fontSize: 18)),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      info[index]['message'].toString(),
                      style: GoogleFonts.openSansCondensed(fontSize: 15),
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        NetworkImage(info[index]['profilePic'].toString()),
                  ),
                  trailing: Text(
                    info[index]['time'].toString(),
                    style: GoogleFonts.openSansCondensed(
                        fontSize: 13, color: textColor),
                  ),
                ),
              ),
              const Divider(
                color: appBarColor,
              )
            ],
          );
        }),
        itemCount: info.length,
      ),
    );
  }
}
