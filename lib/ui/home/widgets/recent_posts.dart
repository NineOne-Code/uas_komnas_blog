import 'package:flutter/material.dart';
import 'package:uas_komnas_blog/commons/commons.dart';
import 'package:uas_komnas_blog/ui/home/widgets/home_widgets.dart';

class RecentPosts extends StatelessWidget {
  const RecentPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SidebarContainer(
      title: 'Recent Post',
      child: Column(
        children: [
          RecentPostCard(
            title: 'Our “Secret” Formula to Online Workshops',
            image: 'images/recent_1.png',
            onTap: () {},
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          RecentPostCard(
            title: 'Digital Product Innovations from Warsaw with Love',
            image: 'images/recent_2.png',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class RecentPostCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;
  const RecentPostCard({
    Key? key,
    required this.title,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(image),
            ),
            const SizedBox(
              width: kDefaultPadding,
            ),
            Expanded(
              flex: 5,
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
          ],
        ),
      ),
    );
  }
}
