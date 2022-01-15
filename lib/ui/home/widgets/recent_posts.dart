import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_komnas_blog/commons/commons.dart';
import 'package:uas_komnas_blog/controllers/controllers.dart';
import 'package:uas_komnas_blog/models/models.dart';
import 'package:uas_komnas_blog/ui/home/widgets/home_widgets.dart';

class RecentPosts extends StatelessWidget {
  final BlogModels blog;
  const RecentPosts({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SidebarContainer(
      title: 'Recent Post',
      child: Column(
        children: [
          RecentPostCard(
            title: blog.title!,
            id: blog.id!,
            onTap: () => Get.find<MenuController>().readMorePDF(
              asset: blog.asset!['pdf']!,
              blogId: blog.id!,
            ),
          ),
        ],
      ),
    );
  }
}

class RecentPostCard extends StatelessWidget {
  final int id;
  final String title;
  final VoidCallback onTap;
  const RecentPostCard({
    Key? key,
    required this.title,
    required this.id,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: onTap,
            child: Text(
              title,
              maxLines: 2,
              style: const TextStyle(
                color: kDarkBlackColor,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
          ),
          Obx(() => IconButton(
                onPressed: !Get.find<MenuController>().likes!.contains(id)
                    ? () => Get.find<MenuController>().likePost(id)
                    : () => Get.find<MenuController>().dislikePost(id),
                icon: Icon(
                  Get.find<MenuController>().likes!.contains(id)
                      ? Icons.thumb_up_alt_rounded
                      : Icons.thumb_up_outlined,
                  color: kDarkBlackColor,
                ),
              )),
        ],
      ),
    );
  }
}
