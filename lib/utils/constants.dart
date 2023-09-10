import 'package:flutter/material.dart';
import 'package:my_portfolio/models/header_item.dart';
import 'package:my_portfolio/utils/utils.dart';

const Color kPrimaryColor = Color(0xFFFFD800);
const Color kBackgroundColor = Color.fromRGBO(7, 17, 26, 1);
const Color kDangerColor = Color.fromARGB(255, 243, 22, 22);
const Color kCaptionColor = Color.fromRGBO(166, 177, 187, 1);

// Lets replace all static sizes
const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;

class AppConstants {
  static const linkedInUrl = "https://www.linkedin.com/in/giogambale/";
  static const githubUrl = "https://github.com/GioGambale";

  static const _assets = "assets/";
  static const _images = _assets + "images/";

  static const logo = _images + "logo-white.png";
  static const homepage = _images + "homepage.png";
  static const aboutme = _images + "aboutme.png";

  static const _socialImages = _images + "social/";
  static const emailImage = _socialImages + "email.png";
  static const linkedInImage = _socialImages + "linkedin-logo.png";
  static const githubImage = _socialImages + "github.png";

  static const _techImages = _images + "technology/";
  static const flutterImage = _techImages + "flutter.png";
  static const firebaseImage = _techImages + "firebase.png";
  static const javaImage = _techImages + "java.png";
  static const javascriptImage = _techImages + "javascript.png";
  static const mavenImage = _techImages + "maven.png";
  static const sonarqubeImage = _techImages + "sonar.png";
  static const springImage = _techImages + "spring.png";
  static const hibernateImage = _techImages + "hibernate.png";
  static const vaadinImage = _techImages + "vaadin.png";
  static const angularImage = _techImages + "angular.png";
  static const jiraImage = _techImages + "jira.png";
  static const jenkinsImage = _techImages + "jenkins.png";

  static const _eduImages = _images + "education/";
  static const unisaImages = _eduImages + "unisa.png";
  static const upcImages = _eduImages + "upc.png";
  static const ordineImages = _eduImages + "ordine.png";
  static const udemyImages = _eduImages + "udemy.png";
  static const courseraImages = _eduImages + "coursera.png";
  static const scrumstudyImages = _eduImages + "scrumstudy.png";

  static const _expImages = _images + "experience/";
  static const nexsoftImages = _expImages + "nexsoft.png";
  static const soulImages = _expImages + "soul.png";
  static const eustemaImages = _expImages + "eustema.png";

  static const _projectsImages = _images + "projects/";
  static const smartStoreImage = _projectsImages + "1.jpeg";
  static const crossTheRoadImage = _projectsImages + "2.jpeg";
  static const newsUpImage = _projectsImages + "3.jpeg";
  static const musicLabImage = _projectsImages + "4.jpeg";
  static const personalFaceImage = _projectsImages + "5.jpeg";
  static const computerStoreImage = _projectsImages + "6.jpeg";

  static List<NameOnTap> socialLoginDatas = [
    NameOnTap(
        title: githubImage,
        onTap: () {
          Utilty.openUrl(githubUrl);
        }),
    NameOnTap(
        title: linkedInImage,
        onTap: () {
          Utilty.openUrl(linkedInUrl);
        }),
    NameOnTap(
        title: emailImage,
        onTap: () {
          Utilty.openMail();
        }),
  ];

  static List<NameOnTap> headerItems = [
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
    NameOnTap(
      title: "Contact",
      onTap: () {},
      iconData: Icons.contact_mail,
    ),
  ];
}
