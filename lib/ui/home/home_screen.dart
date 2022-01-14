import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_komnas_blog/commons/commons.dart';
import 'package:uas_komnas_blog/controllers/controllers.dart';
import 'package:uas_komnas_blog/ui/home/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Obx(() => Column(
                children: List.generate(
                  Get.find<MenuController>().getBlogPosts.length,
                  (index) => BlogPostCard(
                    blog: Get.find<MenuController>().getBlogPosts[index],
                    key: Key(Get.find<MenuController>()
                        .getBlogPosts[index]
                        .id!
                        .toString()),
                  ),
                ),
              )),
        ),
        if (!Responsive.isMobile(context))
          const SizedBox(
            width: kDefaultPadding,
          ),
        if (!Responsive.isMobile(context))
          Expanded(
            child: Column(
              children: [
                const Search(),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Categories(
                  categories: Get.find<MenuController>().getCategoris(),
                ),
                // SizedBox(
                //   height: kDefaultPadding,
                // ),
                // RecentPosts(),
              ],
            ),
          ),
      ],
    );
  }
}
