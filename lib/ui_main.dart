
import 'package:responsive_framework/responsive_framework.dart';

import 'app.dart';
import 'ui.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Language(),
      locale: Language.defaultLocale,
      fallbackLocale: Language.fallbackLocale,
      onGenerateTitle: (BuildContext context) => '${Global.title}'.tr,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: Routes.home,
      getPages: Routes.pages,
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(color: Color(0xFFF5F5F5))
      ),
    );
  }
}
