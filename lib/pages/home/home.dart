import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/pages/home/components/about.dart';
import 'package:my_portfolio/pages/home/components/carousel.dart';
import 'package:my_portfolio/pages/home/components/footer.dart';
import 'package:my_portfolio/pages/home/components/header.dart';
import 'package:my_portfolio/pages/home/components/portfolio_stats.dart';
import 'package:my_portfolio/pages/home/components/project.dart';
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

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildPage() {
    return Stack(
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
                SizedBox(
                  key: _homeProvider.portfolioKey,
                  height: 100.0,
                ),
                Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Projects",
                      style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w900,
                        fontSize: 36,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Here are some of my works",
                      style: GoogleFonts.josefinSans(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    )
                  ],
                )),
                ProjectSection(
                  projects: ProjectModel.projects,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 28.0),
                  child: PortfolioStats(),
                ),
                const SizedBox(
                  height: 50.0,
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
