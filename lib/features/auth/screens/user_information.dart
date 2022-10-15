import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mychat/widgets/colors.dart';

class UserInform extends StatefulWidget {
  static const String routename = '/user-info';
  const UserInform({Key? key}) : super(key: key);

  static final customCacheManager = CacheManager(Config('customCacheKey',
      stalePeriod: const Duration(days: 15), maxNrOfCacheObjects: 100));

  @override
  State<UserInform> createState() => _UserInformState();
}

class _UserInformState extends State<UserInform> {
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.contain,
                  imageUrl:
                      'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png',
                  cacheManager: UserInform.customCacheManager,
                  key: UniqueKey(),
                  imageBuilder: (context, imageProvider) {
                    return CircleAvatar(
                      backgroundImage: imageProvider,
                      radius: 64,
                    );
                  },
                ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.add_a_photo)),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  width: size.width * 0.5,
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    style: GoogleFonts.openSansCondensed(
                        fontWeight: FontWeight.bold, color: textColor),
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: 'Enter your name',
                        hintStyle: GoogleFonts.openSansCondensed(
                            fontWeight: FontWeight.bold, color: textColor)),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
