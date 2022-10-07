import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychat/widgets/colors.dart';
import 'package:mychat/widgets/info.dart';

class BigScreenChatAppBar extends StatelessWidget {
  const BigScreenChatAppBar({Key? key}) : super(key: key);

  static final customCacheManager = CacheManager(Config('customCacheKey',
      stalePeriod: const Duration(days: 15), maxNrOfCacheObjects: 100));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.077,
      width: MediaQuery.of(context).size.width * 0.75,
      padding: const EdgeInsets.all(10),
      color: appBarColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://pbs.twimg.com/profile_images/1419974913260232732/Cy_CUavB.jpg',
                  cacheManager: customCacheManager,
                  key: UniqueKey(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  fit: BoxFit.cover,
                  height: 30,
                  width: 30,
                ),
              ),
              // const CircleAvatar(
              //   backgroundImage: NetworkImage(
              //       'https://pbs.twimg.com/profile_images/1419974913260232732/Cy_CUavB.jpg'),
              //   radius: 30,
              // ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              Text(
                info[3]['name'].toString(),
                style: GoogleFonts.openSansCondensed(
                    fontSize: 18,
                    color: textColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: textColor,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert_sharp,
                    color: textColor,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
