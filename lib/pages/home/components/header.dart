import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/models/header_item.dart';
import 'package:my_portfolio/provider/home.dart';
import 'package:my_portfolio/utils/constants.dart';
import 'package:my_portfolio/utils/globals.dart';
import 'package:my_portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Container(
        padding: const EdgeInsets.only(top: 15),
        child: Row(
          children: [
            Image.asset(
              AppConstants.logo,
              width: 100,
              height: 100,
            ),
          ],
        ),
      );
    });
  }
}

class HeaderRow extends StatelessWidget {
  const HeaderRow({Key? key}) : super(key: key);

  static List<NameOnTap> get headerItems => [
        NameOnTap(
          title: "Home",
          iconData: Icons.home,
          onTap: () {},
        ),
        NameOnTap(
          title: "About Me",
          onTap: () {},
          iconData: Icons.info,
        ),
        NameOnTap(
          title: "Education",
          onTap: () {},
          iconData: Icons.school,
        ),
        NameOnTap(
          title: "Experience",
          onTap: () {},
          iconData: Icons.work,
        ),
        NameOnTap(
          title: "Services",
          onTap: () {},
          iconData: Icons.work,
        ),
        /*
        NameOnTap(
          title: "Projects",
          onTap: () {},
          iconData: Icons.work,
        ),
        */
        NameOnTap(
          title: "Contact",
          onTap: () {},
          iconData: Icons.contact_mail,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: const [
        Condition.largerThan(name: MOBILE),
      ],
      child: Consumer(
        builder: (context, ref, child) {
          return Row(children: [
            ...headerItems
                .map(
                  (item) => MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      margin: const EdgeInsets.only(right: 30.0),
                      child: GestureDetector(
                        onTap: () {
                          item.onTap();
                          HomeProvider _homeProvider = ref.read(homeProvider);
                          _homeProvider.scrollBasedOnHeader(item);
                        },
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            color: null,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ]);
        },
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: buildHeader(context),
      mobile: buildMobileHeader(context),
      tablet: buildHeader(context),
    );
  }

  // mobile header
  Widget buildMobileHeader(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeaderLogo(),
            GestureDetector(
              onTap: () {
                Globals.scaffoldKey.currentState?.openEndDrawer();
              },
              child: const Icon(
                Icons.menu,
                size: 28.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Lets plan for mobile and smaller width screens
  Widget buildHeader(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(
            horizontal: ScreenHelper.isDesktop(context) ? 20 : 16.0),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderLogo(),
            HeaderRow(),
          ],
        ),
      ),
    );
  }
}
