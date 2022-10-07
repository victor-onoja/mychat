import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychat/screens/small_chat_screen.dart';
import 'package:mychat/widgets/colors.dart';
import 'package:mychat/widgets/info.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key}) : super(key: key);

  static final customCacheManager = CacheManager(Config('customCacheKey',
      stalePeriod: const Duration(days: 15), maxNrOfCacheObjects: 100));

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
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: CachedNetworkImage(
                      imageUrl: info[index]['profilePic'].toString(),
                      cacheManager: customCacheManager,
                      key: UniqueKey(),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 45,
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      fit: BoxFit.cover,
                      height: 45,
                      width: 45,
                    ),
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
