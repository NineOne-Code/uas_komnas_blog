import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uas_komnas_blog/commons/commons.dart';
import 'package:uas_komnas_blog/controllers/controllers.dart';
import 'package:uas_komnas_blog/ui/main/widgets/main_widgets.dart';

class Header extends StatelessWidget {
  final GlobalKey<ScaffoldState> scafoldkey;
  const Header({Key? key, required this.scafoldkey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MenuController _controller = Get.put(MenuController());
    return Container(
      width: double.infinity,
      color: kDarkBlackColor,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: kMaxWidth),
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
                  Row(
                    children: [
                      if (!Responsive.isDesktop(context))
                        IconButton(
                          onPressed: () =>
                              _controller.openOrCloseDrawer(scafoldkey),
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                width: 2,
                                color: kPrimaryColor.withOpacity(.8),
                              )),
                            ),
                            child: const Text('NineOne',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                    letterSpacing: 3)),
                          ),
                          const Text('Blog',
                              style: TextStyle(
                                fontSize: 18,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w900,
                              )),
                        ],
                      ),
                      const Spacer(),
                      if (Responsive.isDesktop(context)) const WebMenu(),
                      const Spacer(),
                      const Socialmedia(),
                    ],
                  ),
                  const SizedBox(
                    height: kDefaultPadding * 2,
                  ),
                  const Text(
                    'Hi Gaes!',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: Column(
                      children: const [
                        Text(
                          'Blog ini dibuat untuk memenuhi Nilai Akhir Semester\nMata Kuliah Komputer Masyarakat 2021/2022',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Dosen Pengampu: Ulya Anisatur R. M.Kom',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FittedBox(
                    child: TextButton(
                      onPressed: () {
                        // https://unmuhjember.ac.id/images/logo/logo%20baru%20y.png
                        Get.find<MenuController>()
                            .launcherLink('https://unmuhjember.ac.id/id/');
                      },
                      child: Row(
                        children: const [
                          Text(
                            'Universitas Muhammadiyah Jember',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: kDefaultPadding,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (Responsive.isDesktop(context))
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
