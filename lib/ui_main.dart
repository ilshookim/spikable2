
import 'app.dart';
import 'ui.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppLocale(),
      locale: AppLocale.defaultLocale,
      fallbackLocale: AppLocale.fallbackLocale,
      onGenerateTitle: (BuildContext context) => 'hello'.tr,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
