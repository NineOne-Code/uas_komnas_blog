import 'dart:developer';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_komnas_blog/models/models.dart';
import 'package:uas_komnas_blog/services/services.dart';
import 'package:uas_komnas_blog/ui/pdf/pdf.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MenuController extends GetxController {
  final RxInt _selectedIndex = 0.obs;
  final RxInt _recentBlogPost = LocalStorage().getRecentPost().obs;
  final RxList<BlogModels> _rawBlogPosts = blogPosts.obs;
  final RxList<int> _likes = LocalStorage().getLikes().obs;

  int get selectedIndex => _selectedIndex.value;
  List<BlogModels> get getBlogPosts => _rawBlogPosts;
  List<int>? get likes => _likes;
  List<String> get menuItems => ["Blog"];

  List<CategoryModel> getCategories() {
    List<CategoryModel> _list = [];
    Set<String> _rawSet = {...getBlogPosts.map((e) => e.category!).toList()};
    for (var item in _rawSet) {
      _list.add(CategoryModel(
          name: item,
          length: getBlogPosts
              .where((element) => element.category == item)
              .length));
    }
    return _list;
  }

  BlogModels? get getRecentPost => blogPosts
          .where((element) => element.id == _recentBlogPost.value)
          .isEmpty
      ? null
      : blogPosts.where((element) => element.id == _recentBlogPost.value).first;

  void openOrCloseDrawer(GlobalKey<ScaffoldState> scafoldkey) {
    if (scafoldkey.currentState != null) {
      if (scafoldkey.currentState!.isDrawerOpen) {
        scafoldkey.currentState!.openEndDrawer();
      } else {
        scafoldkey.currentState!.openDrawer();
      }
    }
  }

  void setMenuIndex(int index) {
    _selectedIndex.value = index;
  }

  void likePost(int bolgId) {
    LocalStorage().likePost(blogId: bolgId);
    _likes.value = LocalStorage().getLikes();
  }

  void dislikePost(int bolgId) {
    LocalStorage().dislikePost(blogId: bolgId);
    _likes.value = LocalStorage().getLikes();
  }

  void setRecentPost(int blogId) {
    LocalStorage().setRecentPost(blogId: blogId);
    _recentBlogPost.value = LocalStorage().getRecentPost();
  }

  void readMorePDF({required String asset, required int blogId}) {
    setRecentPost(blogId);
    Get.to(() => PDFScreen(asset: asset));
  }

  void downloadPdf({required String paths, required String title}) {
    html.AnchorElement anchorElement = html.AnchorElement(href: paths);
    anchorElement.download = title;
    anchorElement.click();
  }

  void launcherLink(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  void setBlogPost({String? byCategory, String? bySearch}) {
    if (byCategory != null && byCategory.isNotEmpty) {
      _rawBlogPosts.value = [];
      _rawBlogPosts.value = blogPosts
          .where((element) => element.category!.contains(byCategory))
          .toList();
    } else if (bySearch != null && bySearch.isNotEmpty) {
      _rawBlogPosts.value = [];
      _rawBlogPosts.value = blogPosts
          .where((element) =>
              element.title!.toLowerCase().contains(bySearch.toLowerCase()))
          .toList();
    } else {
      _rawBlogPosts.value = blogPosts;
    }
  }

  String getThumbnail({required String youtubeUrl}) {
    String videoId = YoutubePlayerController.convertUrlToId(youtubeUrl)!;
    return YoutubePlayerController.getThumbnail(videoId: videoId);
  }
}
