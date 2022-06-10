import 'package:url_launcher/url_launcher_string.dart';



class Redirect {

  static toWeb({String? url}) async {
    if (url != null) {
      bool canBeLaunch = await canLaunchUrlString(url);
      if (canBeLaunch) {
        await launchUrlString(url);
      }
    }
  }
}
