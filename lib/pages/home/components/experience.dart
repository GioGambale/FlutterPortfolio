import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/models/name_color.dart';
import 'package:my_portfolio/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';

class ExperienceSection extends StatelessWidget {
  ExperienceSection({Key? key}) : super(key: key);

  final experiences = [
    NameIconColor(
      title: "Software Engineer",
      desc:
          "Team-oriented full stack developer, with participation in requirements collection and functional analysis, design and development of evolutionary/corrective actions for INAIL portal applications, tickets management for release actions.",
      logo: AppConstants.eustemaImages,
      url: "https://www.eustema.it/",
      azienda: "Eustema S.p.A.",
      luogo: "Remote",
      dataDa: "03/2022",
      dataA: "Present",
    ),
    NameIconColor(
      title: "Software Development Engineer",
      desc:
          "Full stack developer at SoulSoftware R&D department on projects in aerospace sector. Realization of ASPIRD (Airport System PRotection from Intruding Drones), a cross-platform (web/Android/iOS) flutter application for SESAR JU project under the European Union’s Horizon 2020 research and innovation programme (Project ID: 892036).",
      logo: AppConstants.soulImages,
      url: "https://www.soulsoftware.it/html/it/homepage-ita-blue/",
      azienda: "SoulSoftware S.r.l.",
      luogo: "Mercogliano (AV)",
      dataDa: "04/2021",
      dataA: "03/2022",
    ),
    NameIconColor(
      title: "Java Software Engineer",
      desc:
          "Team-oriented full stack developer, follow all Agile SCRUM phases, for CCH Tagetik (financial dashboard). Microservices (spring-boot application) and REST API development and use of Angular framework (with npm and typescript).",
      logo: AppConstants.nexsoftImages,
      url: "https://www.nexsoft.it/",
      azienda: "Nexsoft S.p.A.",
      luogo: "Salerno",
      dataDa: "11/2018",
      dataA: "04/2021",
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
            "Experience",
            style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.w900,
              height: 1.3,
              fontSize: 35.0,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Consumer(builder: (context, ref, _) {
            return Wrap(
                direction: Axis.vertical,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                runAlignment: WrapAlignment.start,
                children: experiences
                    .map(
                      (e) => Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Utilty.openUrl(e.url);
                            },
                            child: Container(
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
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: width - 50,
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(75, 12, 12, 7),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 20),
                                        child: Text(
                                          e.title,
                                          style: GoogleFonts.josefinSans(
                                            color: Colors.grey[400],
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, right: 20),
                                        child: Text(
                                          e.dataDa + " - " + e.dataA,
                                          style: GoogleFonts.josefinSans(
                                            color: Colors.grey[400],
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ]),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Text(
                                          e.azienda,
                                          style: GoogleFonts.josefinSans(
                                            color: Colors.grey[400],
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Text(
                                          e.luogo,
                                          style: GoogleFonts.josefinSans(
                                            color: Colors.grey[400],
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ]),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 20),
                                  child: Text(
                                    e.desc,
                                    style: GoogleFonts.josefinSans(
                                      color: Colors.grey[400],
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList());
          }),
        ],
      ),
    );
  }
}
