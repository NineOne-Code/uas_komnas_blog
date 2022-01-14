import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:uas_komnas_blog/commons/commons.dart';
import 'package:uas_komnas_blog/controllers/controllers.dart';

class Socialmedia extends StatelessWidget {
  const Socialmedia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isMobile(context))
          IconButton(
            onPressed: () => Get.find<MenuController>()
                .launcherLink('https://wa.me/6283847702844'),
            icon: const Icon(
              Ionicons.logo_whatsapp,
              color: Colors.white,
            ),
          ),
        if (!Responsive.isMobile(context))
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            child: IconButton(
              onPressed: () => Get.find<MenuController>()
                  .launcherLink('https://instagram.com/ibrahim.attamimi'),
              icon: const Icon(
                Ionicons.logo_instagram,
                color: Colors.white,
              ),
            ),
          ),
        if (!Responsive.isMobile(context))
          IconButton(
            onPressed: () => Get.find<MenuController>()
                .launcherLink('https://github.com/NineOne-Code'),
            icon: const Icon(
              Ionicons.logo_github,
              color: Colors.white,
            ),
          ),
        const SizedBox(
          width: kDefaultPadding,
        ),
        // ElevatedButton(
        //   onPressed: () {},
        //   style: TextButton.styleFrom(
        //     padding: EdgeInsets.symmetric(
        //       horizontal: kDefaultPadding * 1.5,
        //       vertical:
        //           kDefaultPadding / (Responsive.isDesktop(context) ? 1 : 2),
        //     ),
        //   ),
        //   child: const Text("Let's Talk"),
        // ),
      ],
    );
  }
}
