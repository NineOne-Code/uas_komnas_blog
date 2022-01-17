import 'package:flutter/material.dart';
import 'package:uas_komnas_blog/commons/commons.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(kDefaultPadding),
      child: const Center(
        child: Text(
          'Make with Flutter💙 by NineOne',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
