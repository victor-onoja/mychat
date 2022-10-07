import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:mychat/widgets/colors.dart';

class BigScreenProfileBar extends StatelessWidget {
  const BigScreenProfileBar({Key? key}) : super(key: key);

  static final customCacheManager = CacheManager(Config('customCacheKey',
      stalePeriod: const Duration(days: 15), maxNrOfCacheObjects: 100));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.077,
      width: MediaQuery.of(context).size.width * 0.25,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          border: Border(right: BorderSide(color: messageColor)),
          color: appBarColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(90),
            child: CachedNetworkImage(
              imageUrl:
                  'https://www.socialketchup.in/wp-content/uploads/2020/05/fi-vill-JOHN-DOE.jpg',
              cacheManager: customCacheManager,
              key: UniqueKey(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) => const CircularProgressIndicator(),
              fit: BoxFit.cover,
              height: 30,
              width: 30,
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.comment,
                    color: textColor,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert_sharp,
                    color: textColor,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
