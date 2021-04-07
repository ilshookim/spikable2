
import 'ui.dart';

// Initial development environment:
// 1. handling to global constraints, constants, variables, functions
// 2. handling to localization and translation
// 3. handling to data and storage
// 4. handling to logging and function stack

void main() async {
  await prepareApp();
  runApp(MainPage());
}

Future<bool> prepareApp() async {
  final String function = Trace.current().frames[0].member!;
  bool succeed = false;
  try {
    // A concrete binding for applications based on the Widgets framework.
    WidgetsFlutterBinding.ensureInitialized();

    // Specifies the set of orientations the application interface can
    // be displayed in. DeviceOrientation.portraitUp.
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // Logger default level and print logs
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      print('[${record.time}][${record.level.name}][${record.loggerName}] ${record.message}');
    });

    // Remove the leading hash (#) from the URL
    // setPathUrlStrategy();
    
    // Storage initialization
    // await GetStorage.init();

    succeed = true;
  }
  catch (exc) {
    Logger.root.warning('$function: $exc');
  }
  Logger.root.info('$function[$succeed]: logger.level=${Logger.root.level}');
  return succeed;
}
