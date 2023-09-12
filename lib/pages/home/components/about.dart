import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/models/technology.dart';
import 'package:my_portfolio/utils/constants.dart';
import 'package:my_portfolio/utils/screen_helper.dart';
import 'package:my_portfolio/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class AboutSection extends StatefulWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth),
      tablet: _buildUi(kTabletMaxWidth),
      mobile: _buildUi(getMobileMaxWidth(context)),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Flex(
              direction:
                  constraints.maxWidth > 720 ? Axis.horizontal : Axis.vertical,
              children: [
                Expanded(
                  flex: constraints.maxWidth > 720.0 ? 1 : 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 110.0,
                      ),
                      Text(
                        "About Me",
                        style: GoogleFonts.josefinSans(
                          fontWeight: FontWeight.w900,
                          height: 1.3,
                          fontSize: 35.0,
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        "I'm Giovanni Gambale",
                        style: GoogleFonts.josefinSans(
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                          fontSize: 24.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "I'm a Software Engineer, graduated at University of Salerno on 2018, with qualification to practice Information Engineer profession (Section A) from 2023. I have worked and still work as Full Stack Developer.",
                        style: TextStyle(
                          color: kCaptionColor,
                          height: 1.5,
                          fontSize: 15.0,
                        ),
                      ),
                      const Text(
                        "I'm a computer and technology passionate individual, always love to learn new technologies and earn a job which provides me job satisfaction and self-development and help me achieve personal as well as organisational goals. In my free time I use to follow and practice various sports: soccer, basket, tennis and padel.",
                        style: TextStyle(
                          color: kCaptionColor,
                          height: 1.5,
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        "Tools, frameworks and technologies I have worked with",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Consumer(builder: (context, ref, _) {
                        return ScrollConfiguration(
                          behavior: MyCustomScrollBehavior(),
                          //behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: TechnologyConstants.technologyLearned
                                  .map((e) => MouseRegion(
                                    cursor: SystemMouseCursors.basic,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[800],
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 6),
                                      child: InkWell(
                                        onTap: () {
                                          Utilty.openUrl(e.url);
                                        },
                                        child: Center(
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child:
                                                      Image.asset(e.logo)),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                e.name,
                                                style: const TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight:
                                                      FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))
                                  .toList(),
                            ),
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Utilty.openUrl(
                              "https://github.com/GioGambale/GioGambale.github.io/raw/main/assets/files/CV_Gambale.pdf");
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "DOWNLOAD CV",
                            style: GoogleFonts.josefinSans(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 70.0,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 25.0,
                ),
                if (ScreenHelper.isDesktop(context) ||
                    ScreenHelper.isTablet(context))
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    child: Image.asset(
                      AppConstants.aboutme,
                      width: constraints.maxWidth > 720.0 ? null : 350.0,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
