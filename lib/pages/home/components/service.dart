import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../models/design_process.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';

final List<DesignProcess> designProcesses = [
  DesignProcess(
    title: "Develop",
    imagePath: "assets/images/develop.png",
    subtitle:
        "I can develop your personal or professional website, e-commerce or mobile app. I can also help you with Opensource Development.",
  ),
  DesignProcess(
    title: "Teach",
    imagePath: "assets/images/learn.png",
    subtitle:
        "I can give private lessons to secondary schools and universities students in Mathematics and Informatics.",
  ),
];

class ServiceSection extends StatelessWidget {
  const ServiceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, kDesktopMaxWidth),
        tablet: _buildUi(context, kTabletMaxWidth),
        mobile: _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 110,
          ),
          Text(
            "What I Do?",
            style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.w900,
              height: 1.3,
              fontSize: 35.0,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "I may not be perfect, but I'm surely of some help",
            style: GoogleFonts.josefinSans(
              color: Colors.grey[400],
              fontSize: 14.0,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Consumer(builder: (context, ref, _) {
            return Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                spacing: 100,
                children: designProcesses
                    .map(
                      (e) => Container(
                          height: 300,
                          width: 200,
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(75, 12, 12, 7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: _buildServices(e)),
                    )
                    .toList());
          }),
        ],
      ),
    );
  }

  Widget _buildServices(DesignProcess e) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 25,
        ),
        Text(
          e.title,
          textAlign: TextAlign.center,
          style: GoogleFonts.josefinSans(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(80),
          ),
          child: Image.asset(
            e.imagePath,
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            e.subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.josefinSans(
              color: Colors.grey[400],
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
