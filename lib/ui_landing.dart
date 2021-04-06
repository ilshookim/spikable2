
import 'app.dart';
import 'ui.dart';

const String listItemTitleText = "A BETTER BLOG FOR WRITING";
const String listItemPreviewText =
    "Sed elementum tempus egestas sed sed risus. Mauris in aliquam sem fringilla ut morbi tincidunt. Placerat vestibulum lectus mauris ultrices eros. Et leo duis ut diam. Auctor neque vitae tempus […]";

class LandingPage extends StatelessWidget {
  static const String id = '/landing';
  final Logger logger = Logger(id);
  final ScrollController scrollController = ScrollController();

  void onKeyEvent(RawKeyEvent event) {
    final String function = Trace.current().frames[0].member!;
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

      double scrollTo = scrollController.offset;
      if (keyUp) scrollTo -= line;
      if (keyDown) scrollTo += line;
      if (keyLeft) scrollTo -= half;
      if (keyRight) scrollTo += half;
      if (keyPageUp) scrollTo -= page;
      if (keyPageDown) scrollTo += page;
      if (keySpace) scrollTo += page;
      if (keyHome) scrollTo = top;
      if (keyEnd) scrollTo = bottom;

      final bool upper = scrollTo < top - page;
      final bool lower = scrollTo > bottom + page;
      final bool scroll = !upper && !lower;
      if (scroll) scrollController.jumpTo(scrollTo);
    }
    catch (exc) {
      logger.warning('$function: $exc');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 32),
        child: RawKeyboardListener(
          autofocus: true,
          focusNode: FocusNode(),
          onKey: onKeyEvent,
          child: ListView(
            controller: scrollController,
            children: [
              MenuBar(),
              ListItem(
                  imageUrl:
                      "assets/images/paper_flower_overhead_bw_w1080.jpg",
                  title: listItemTitleText,
                  description: listItemPreviewText),
              divider,
              ListItem(
                  imageUrl:
                      "assets/images/iphone_cactus_tea_overhead_bw_w1080.jpg",
                  title: listItemTitleText,
                  description: listItemPreviewText),
              divider,
              ListItem(
                  imageUrl:
                      "assets/images/typewriter_overhead_bw_w1080.jpg",
                  title: listItemTitleText,
                  description: listItemPreviewText),
              divider,
              ListItem(
                  imageUrl:
                      "assets/images/coffee_paperclips_pencil_angled_bw_w1080.jpg",
                  title: listItemTitleText,
                  description: listItemPreviewText),
              divider,
              ListItem(
                  imageUrl:
                      "assets/images/joy_note_coffee_eyeglasses_overhead_bw_w1080.jpg",
                  title: listItemTitleText,
                  description: listItemPreviewText),
              divider,
              Container(
                padding: EdgeInsets.symmetric(vertical: 80),
                child: ListNavigation(),
              ),
              divider,
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
