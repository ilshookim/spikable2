
import 'ui.dart';

// Initial development environment:
// 1. handling to global constraints, constants, variables, functions
// 2. handling to localization and translation
// 3. handling to data and storage
// 4. handling to logging and function stack

void main() {
  prepareApp();
  runApp(MainPage());
}

bool prepareApp() {
  final String function = Trace.current().frames[0].member!;
  bool succeed = false;
  try {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      print('[${record.time}][${record.level.name}] ${record.message}');
    });
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    succeed = true;
  } catch (exc) {
    Logger.root.warning('$function: $exc');
  } finally {
    Logger.root.info('$function[$succeed]: logger.level=${Logger.root.level}');
  }
  return succeed;
}
