import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uas_komnas_blog/commons/commons.dart';
import 'package:uas_komnas_blog/controllers/controllers.dart';
import 'package:uas_komnas_blog/ui/home/widgets/home_widgets.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SidebarContainer(
      title: "Pencarian",
      child: TextField(
        onChanged: (value) {
          Get.find<MenuController>().setBlogPost(bySearch: value);
        },
        decoration: InputDecoration(
            hintText: 'Cari Judul',
            suffixIcon: Padding(
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              child: SvgPicture.asset('icons/feather_search.svg'),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kDefaultPadding / 2),
              borderSide: const BorderSide(color: greyColor),
            )),
      ),
    );
  }
}
