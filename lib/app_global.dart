import 'app.dart';

class Global {
  // constants
  static const String english = 'english';
  static const String korean = '한국어';
  static const String ko = 'ko';
  static const String KR = 'KR';
  static const String en = 'en';
  static const String US = 'US';

  // functions
  static void scrollTo(RawKeyEvent event, ScrollController scrollController) {
    final String function = Trace.current().frames[0].member!;
    final Logger logger = Logger(function);
    try {
      final bool keyDownEvent = '${event.runtimeType}' == 'RawKeyDownEvent';
      if (!keyDownEvent) return;

      final double top = 0;
      final double line = 100;
      final double page = Get.height;
      final double half = page / 2;
      final double bottom = scrollController.position.maxScrollExtent;
      final bool keyUp = event.isKeyPressed(LogicalKeyboardKey.arrowUp);
      final bool keyDown = event.isKeyPressed(LogicalKeyboardKey.arrowDown);
      final bool keyLeft = event.isKeyPressed(LogicalKeyboardKey.arrowLeft);
      final bool keyRight = event.isKeyPressed(LogicalKeyboardKey.arrowRight);
      final bool keyPageUp = event.isKeyPressed(LogicalKeyboardKey.pageUp);
      final bool keyPageDown = event.isKeyPressed(LogicalKeyboardKey.pageDown);
      final bool keySpace = event.isKeyPressed(LogicalKeyboardKey.space);
      final bool keyHome = event.isKeyPressed(LogicalKeyboardKey.home);
      final bool keyEnd = event.isKeyPressed(LogicalKeyboardKey.end);

      double offset = scrollController.offset;
      if (keyUp) offset -= line;
      if (keyDown) offset += line;
      if (keyLeft) offset -= half;
      if (keyRight) offset += half;
      if (keyPageUp) offset -= page;
      if (keyPageDown) offset += page;
      if (keySpace) offset += page;
      if (keyHome) offset = top - line;
      if (keyEnd) offset = bottom + line;

      final bool upper = offset < top;
      final bool lower = offset > bottom;
      if (upper) offset = top - line;
      if (lower) offset = bottom + line;
      scrollController.jumpTo(offset);
      logger0.finest('offset=$offset, upper=$upper, lower=$lower');
    }
    catch (exc) {
      logger.warning('$exc');
    }
  }
}

// ignore: camel_case_types
class logger0 {
  static finest(msg) { }
  static finer(msg) { }
  static fine(msg) { }
  static config(msg) { }
  static info(msg) { }
  static warning(msg) { }
  static severe(msg) { }
  static shout(msg) { }
}
