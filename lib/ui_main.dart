
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
      home: HomePage(),
    );
  }
}
