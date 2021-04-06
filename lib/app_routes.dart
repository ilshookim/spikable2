
import 'app.dart';
import 'ui.dart';

class Routes {
  static const String home = '/';
  static final pages = [
    GetPage(name: home, page: () => LandingPage()),
    GetPage(name: HomePage.id, page: () => HomePage()),
    GetPage(name: LandingPage.id, page: () => LandingPage()),
  ];
}
