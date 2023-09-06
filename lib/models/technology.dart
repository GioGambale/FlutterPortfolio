import 'package:my_portfolio/utils/constants.dart';

class TechnologyModel {
  final String name;
  final String logo;
  final String url;

  TechnologyModel(this.name, this.logo, this.url);
}

class TechnologyConstants {
  static TechnologyModel java =
      TechnologyModel("Java", AppConstants.javaImage, "https://www.java.com/en/download/help/whatis_java.html");
  static TechnologyModel javascript =
      TechnologyModel("Javascript", AppConstants.javascriptImage, "https://www.javascript.com/");
  static TechnologyModel flutter =
      TechnologyModel("Flutter", AppConstants.flutterImage, "https://flutter.dev/");
  static TechnologyModel firebase =
      TechnologyModel("Firebase", AppConstants.firebaseImage, "https://firebase.google.com/");

  static TechnologyModel maven =
      TechnologyModel("Maven", AppConstants.mavenImage, "https://maven.apache.org/");
  static TechnologyModel sonarqube =
      TechnologyModel("SonarQube", AppConstants.sonarqubeImage, "https://www.sonarsource.com/products/sonarqube/");
  static TechnologyModel spring =
      TechnologyModel("Spring", AppConstants.springImage, "https://spring.io/");
  static TechnologyModel hibernate =
      TechnologyModel("Hibernate", AppConstants.hibernateImage, "https://hibernate.org/");
  static TechnologyModel vaadin =
      TechnologyModel("Vaadin", AppConstants.vaadinImage, "https://vaadin.com/");
  static TechnologyModel angular =
      TechnologyModel("Angular", AppConstants.angularImage, "https://angular.io/");
  static TechnologyModel jira =
      TechnologyModel("Jira", AppConstants.jiraImage, "https://www.atlassian.com/software/jira");
  static TechnologyModel jenkins =
      TechnologyModel("Jenkins", AppConstants.jenkinsImage, "https://www.jenkins.io/");

  static List<TechnologyModel> technologyLearned = [
    java,
    javascript,
    flutter,
    firebase,
    spring,
    hibernate,
    vaadin,
    angular,
    maven,
    sonarqube,
    jira,
    jenkins,
  ];
}
