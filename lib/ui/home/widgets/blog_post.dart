import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uas_komnas_blog/commons/commons.dart';
import 'package:uas_komnas_blog/controllers/controllers.dart';
import 'package:uas_komnas_blog/models/models.dart';
import 'package:uas_komnas_blog/services/services.dart';
import 'package:uas_komnas_blog/ui/pdf/pdf.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class BlogPostCard extends StatefulWidget {
  final BlogModels blog;
  const BlogPostCard({Key? key, required this.blog}) : super(key: key);

  @override
  State<BlogPostCard> createState() => _BlogPostCardState();
}

class _BlogPostCardState extends State<BlogPostCard> {
  YoutubePlayerController? _youtubePlayerController;

  @override
  void initState() {
    // TODO: implement initState
    if ((widget.blog.asset!['type'] as String).contains('video')) {
      String videoId =
          YoutubePlayerController.convertUrlToId(widget.blog.asset!['url']!)!;

      _youtubePlayerController = YoutubePlayerController(
        initialVideoId: videoId,
        params: const YoutubePlayerParams(
          loop: true,
          showFullscreenButton: true,
          autoPlay: false,
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      margin: const EdgeInsets.only(bottom: kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.78,
            child: (widget.blog.asset!['type'] as String).contains('video')
                ? YoutubePlayerIFrame(
                    controller: _youtubePlayerController,
                  )
                : Image.network(
                    widget.blog.asset!['url']!,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            children: [
              Text(
                widget.blog.category!.toUpperCase(),
                style: const TextStyle(
                  color: kDarkBlackColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: kDefaultPadding,
              ),
              Text(
                widget.blog.date!,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: Text(
              widget.blog.title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: Responsive.isDesktop(context) ? 32 : 24,
                color: kDarkBlackColor,
                height: 1.3,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            widget.blog.description!,
            maxLines: 4,
            style: const TextStyle(height: 1.5),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Obx(() => Row(
                children: [
                  TextButton(
                    onPressed: () => Get.find<MenuController>().readMorePDF(
                      asset: widget.blog.asset!['pdf']!,
                      blogId: widget.blog.id!,
                    ),
                    child: Container(
                      padding:
                          const EdgeInsets.only(bottom: kDefaultPadding / 4),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: kPrimaryColor, width: 3),
                        ),
                      ),
                      child: const Text(
                        'Read More',
                        style: TextStyle(color: kDarkBlackColor),
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: !Get.find<MenuController>()
                            .likes!
                            .contains(widget.blog.id!)
                        ? () =>
                            Get.find<MenuController>().likePost(widget.blog.id!)
                        : () => Get.find<MenuController>()
                            .dislikePost(widget.blog.id!),
                    icon: Icon(
                      Get.find<MenuController>()
                              .likes!
                              .contains(widget.blog.id!)
                          ? Icons.thumb_up_alt_rounded
                          : Icons.thumb_up_outlined,
                      color: kDarkBlackColor,
                    ),
                  ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: SvgPicture.asset('icons/feather_message-square.svg'),
                  // ),
                  IconButton(
                    onPressed: () => Get.find<MenuController>().downloadPdf(
                        paths: widget.blog.asset!['pdf']!,
                        title: widget.blog.title!),
                    icon: const Icon(
                      Icons.file_download_outlined,
                      color: kDarkBlackColor,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
