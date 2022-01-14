import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_komnas_blog/commons/commons.dart';
import 'package:uas_komnas_blog/controllers/controllers.dart';

class WebMenu extends StatelessWidget {
  const WebMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MenuController _controller = Get.put(MenuController());
    return Obx(
      () => Row(
        children: List.generate(
          _controller.menuItems.length,
          (index) => WebMenuItem(
            isActive: index == _controller.selectedIndex,
            text: _controller.menuItems[index],
            onTap: () => _controller.setMenuIndex(index),
          ),
        ),
      ),
    );
  }
}

class WebMenuItem extends StatefulWidget {
  final bool isActive;
  final String text;
  final VoidCallback onTap;
  const WebMenuItem({
    Key? key,
    required this.isActive,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  State<WebMenuItem> createState() => _WebMenuItemState();
}

class _WebMenuItemState extends State<WebMenuItem> {
  bool _isHover = false;

  Color _borderColor() {
    if (widget.isActive) {
      return kPrimaryColor;
    } else if (!widget.isActive && _isHover) {
      return kPrimaryColor.withOpacity(.4);
    } else {
      return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) {
        setState(() {
          _isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: kDefaultDuration,
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: _borderColor(),
              width: 3,
            ),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
