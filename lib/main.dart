
import 'ui.dart';

// Initial development environment:
// 1. handling to global constraints, constants, variables, functions
// 2. handling to localization and translation
// 3. handling to data and storage
// 4. handling to logging and function stack

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('[${record.time}]->${record.level.name} ${record.message}');
  });

  runApp(MainPage());
}
