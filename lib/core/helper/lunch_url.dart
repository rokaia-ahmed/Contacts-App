import 'package:url_launcher/url_launcher.dart';

void launchURL(String phone) async {
  Uri uRl = Uri.parse('tel:$phone');
  if (!await launchUrl(uRl,
      mode: LaunchMode.externalApplication)) {
    throw ' can\'t launch the URL.$uRl';
  }
}