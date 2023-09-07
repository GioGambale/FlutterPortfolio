import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/models/name_color.dart';
import 'package:my_portfolio/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';

class EducationSection extends StatelessWidget {
  EducationSection({Key? key}) : super(key: key);

  final degrees = [
    NameIconColor(
      title: "Master in Computer Engineering",
      desc: "University of Salerno",
      logo: AppConstants.unisaImages,
      url: "https://corsi.unisa.it/ingegneria-informatica-magistrale",
      azienda: "",
      luogo: "",
      dataDa: "",
      dataA: "",
    ),
    NameIconColor(
      title: "Exchange Erasmus Student",
      desc: "Universitat Politècnica de Catalunya",
      logo: AppConstants.upcImages,
      url: "https://www.upc.edu/ca",
      azienda: "",
      luogo: "",
      dataDa: "",
      dataA: "",
    ),
    NameIconColor(
      title: "Bachelor in Computer Engineering",
      desc: "University of Salerno",
      logo: AppConstants.unisaImages,
      url: "https://corsi.unisa.it/ingegneria-informatica/home",
      azienda: "",
      luogo: "",
      dataDa: "",
      dataA: "",
    ),
  ];

  final certifications = [
    NameIconColor(
      title: "Scrum Fundamentals Certified (SMC)",
      desc: "",
      logo: AppConstants.scrumstudyImages,
      url:
          "https://www.scrumstudy.com/certification/verify?type=SFC&number=995501",
      azienda: "",
      luogo: "",
      dataDa: "",
      dataA: "",
    ),
    NameIconColor(
      title: "Qualified to practice",
      desc: "",
      logo: AppConstants.ordineImages,
      url: "",
      azienda: "",
      luogo: "",
      dataDa: "",
      dataA: "",
    ),
    NameIconColor(
      title: "Flutter Development Bootcamp with Dart",
      desc: "",
      logo: AppConstants.udemyImages,
      url:
          "https://www.udemy.com/certificate/UC-f0ae5be7-0b8f-4efa-8080-beb3edbbdf94/",
      azienda: "",
      luogo: "",
      dataDa: "",
      dataA: "",
    ),
    NameIconColor(
      title: "Kotlin for Java Developers",
      desc: "",
      logo: AppConstants.courseraImages,
      url: "https://www.coursera.org/account/accomplishments/verify/NWYQ9XMT8MR7",
      azienda: "",
      luogo: "",
      dataDa: "",
      dataA: "",
    ),
    NameIconColor(
      title: "English Level B2",
      desc: "",
      logo: AppConstants.unisaImages,
      url: "",
      azienda: "",
      luogo: "",
      dataDa: "",
      dataA: "",
    ),
  ];

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
            "Education",
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
            "Basic Qualification and Certification",
            style: GoogleFonts.josefinSans(
              color: Colors.grey[400],
              fontSize: 15.0,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Degrees Receiver",
            style: GoogleFonts.josefinSans(
              color: Colors.grey[400],
              fontSize: 25.0,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Consumer(builder: (context, ref, _) {
            return Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                children: degrees
                    .map((e) => Container(
                          height: 200,
                          width: 200,
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(75, 12, 12, 7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              Utilty.openUrl(e.url);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
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
                                  height: 10,
                                ),
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[900],
                                    borderRadius: BorderRadius.circular(80),
                                  ),
                                  child: Image.asset(
                                    e.logo,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  e.desc,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.josefinSans(
                                    color: Colors.grey[400],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList());
          }),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Certifications",
            style: GoogleFonts.josefinSans(
              color: Colors.grey[400],
              fontSize: 25.0,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Consumer(builder: (context, ref, _) {
            return Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                children: certifications
                    .map((e) => Container(
                        height: 200,
                        width: 200,
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(75, 12, 12, 7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: e.url != ""
                            ? _buildClickCert(e)
                            : _buildNoClickCert(e)))
                    .toList());
          }),
        ],
      ),
    );
  }

  Widget _buildClickCert(NameIconColor e) {
    return InkWell(
        onTap: () {
          Utilty.openUrl(e.url);
        },
        child: _buildNoClickCert(e));
  }

  Widget _buildNoClickCert(NameIconColor e) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
          height: 20,
        ),
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(80),
          ),
          child: Image.asset(
            e.logo,
          ),
        ),
      ],
    );
  }
}