import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/pages/home/components/about.dart';
import 'package:my_portfolio/pages/home/components/carousel.dart';
import 'package:my_portfolio/pages/home/components/drawer.dart';
import 'package:my_portfolio/pages/home/components/footer.dart';
import 'package:my_portfolio/pages/home/components/header.dart';
import 'package:my_portfolio/pages/home/components/service.dart';
import 'package:my_portfolio/provider/home.dart';
import 'package:my_portfolio/utils/globals.dart';
import 'package:my_portfolio/utils/screen_helper.dart';

import 'components/education.dart';
import 'components/experience.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home>
    with SingleTickerProviderStateMixin {
  late HomeProvider _homeProvider;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    _homeProvider = ref.read(homeProvider);
    super.initState();
  }

  Widget _buildPage() {
    return Scaffold(
      endDrawer: const CustomDrawer(),
      body: Center(
        child: Stack(
          children: [
            ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ScreenHelper.isDesktop(context) ? 30 : 20,
                    ),
                    Carousel(
                      key: _homeProvider.homeKey,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    AboutSection(
                      key: _homeProvider.aboutKey,
                    ),
                    EducationSection(
                      key: _homeProvider.educationKey,
                    ),
                    ExperienceSection(
                      key: _homeProvider.experienceKey,
                    ),
                    ServiceSection(
                      key: _homeProvider.servicesKey,
                    ),
                    Footer(
                      key: _homeProvider.contactKey,
                    )
                  ],
                ),
              ),
            ),
            const Header(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Globals.scaffoldKey,
        body: _buildPage(),
    );
  }
}
