import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uas_komnas_blog/commons/commons.dart';
import 'package:uas_komnas_blog/controllers/controllers.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MenuController _controller = Get.put(MenuController());
    return Drawer(
      child: Container(
        color: kDarkBlackColor,
        child: Obx(
          () => ListView(
            children: [
              DrawerHeader(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * 3.5),
                  child: SvgPicture.asset('icons/logo.svg'),
                ),
              ),
              ...List.generate(
                _controller.menuItems.length,
                (index) => DrawerItem(
                  title: _controller.menuItems[index],
                  isActive: index == _controller.selectedIndex,
                  onTap: () => _controller.setMenuIndex(index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;
  const DrawerItem({
    Key? key,
    required this.title,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        selected: isActive,
        selectedTileColor: kPrimaryColor,
        onTap: onTap,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
