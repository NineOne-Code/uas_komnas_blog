import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_komnas_blog/commons/commons.dart';
import 'package:uas_komnas_blog/controllers/controllers.dart';
import 'package:uas_komnas_blog/ui/home/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MenuController _controller = Get.find<MenuController>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Obx(() => Column(
                children: List.generate(
                  _controller.getBlogPosts.length,
                  (index) => BlogPostCard(
                    blog: _controller.getBlogPosts[index],
                    key: Key(_controller.getBlogPosts[index].id!.toString()),
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
                  categories: _controller.getCategories(),
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Obx(
                  () => _controller.getRecentPost != null
                      ? RecentPosts(blog: _controller.getRecentPost!)
                      : const SizedBox(),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
