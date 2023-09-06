import 'package:url_launcher/url_launcher.dart';

class Utilty {
  static Future<void> openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  static Future<void> openMail() => openUrl("mailto:g.gambale92@gmail.com");

  static Future<void> openMyLocation() =>
      openUrl("https://goo.gl/maps/EL6u9hYoqmNgFz8u8");
  static Future<void> openMyPhoneNo() => openUrl("tel:+39-3284203995");
  static Future<void> openWhatsapp() => openUrl("https://wa.me/3284203995");
}
