import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychat/widgets/colors.dart';
import 'package:mychat/widgets/contacts_list.dart';

class SmallScreen extends StatelessWidget {
  const SmallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appBarColor,
          title: Row(
            children: [
              Text(
                'myChat',
                style: GoogleFonts.openSansCondensed(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const Icon(
                Icons.message_rounded,
                color: textColor,
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: (() {}),
                icon: const Icon(
                  Icons.search_sharp,
                  color: textColor,
                )),
            IconButton(
                onPressed: (() {}),
                icon: const Icon(
                  Icons.more_vert_sharp,
                  color: textColor,
                ))
          ],
          bottom: TabBar(
            indicatorColor: otherColor,
            indicatorWeight: 4,
            labelColor: otherColor,
            unselectedLabelColor: textColor,
            tabs: [
              Tab(
                child: Text(
                  'Messages',
                  style: GoogleFonts.openSansCondensed(
                      fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'Cruise',
                  style: GoogleFonts.openSansCondensed(
                      fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                  child: Text(
                'Calls',
                style:
                    GoogleFonts.openSansCondensed(fontWeight: FontWeight.bold),
              ))
            ],
          ),
        ),
        body: const ContactsList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: appBarColor,
          child: const Icon(
            Icons.comment_sharp,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
