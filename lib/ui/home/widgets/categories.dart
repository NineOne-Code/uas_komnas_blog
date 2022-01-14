import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_komnas_blog/commons/commons.dart';
import 'package:uas_komnas_blog/controllers/controllers.dart';
import 'package:uas_komnas_blog/models/models.dart';
import 'package:uas_komnas_blog/ui/home/widgets/home_widgets.dart';

class Categories extends StatelessWidget {
  final List<CategoryModel> categories;
  const Categories({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SidebarContainer(
      title: 'Kategori Tugas',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var category in categories)
            Category(
              title: category.name,
              numOfItems: category.length,
            ),
        ],
      ),
    );
  }
}

class Category extends StatefulWidget {
  final String title;
  final int numOfItems;
  // final VoidCallback onTap;
  const Category({
    Key? key,
    required this.title,
    required this.numOfItems,
  }) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
      decoration: BoxDecoration(
        color: isSelected ? kDarkBlackColor : Colors.transparent,
      ),
      child: TextButton(
          onPressed: () {
            if (!isSelected) {
              Get.find<MenuController>().setBlogPost(byCategory: widget.title);
            } else {
              Get.find<MenuController>().setBlogPost();
            }
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Text.rich(
            TextSpan(
              text: widget.title.toUpperCase(),
              style: TextStyle(color: isSelected ? kBgColor : kDarkBlackColor),
              children: [
                TextSpan(
                  text: ' ${widget.numOfItems}',
                  style: TextStyle(
                      color: isSelected ? kBgColor : kDarkBlackColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )),
    );
  }
}
