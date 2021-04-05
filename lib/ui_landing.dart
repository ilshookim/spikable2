
import 'app.dart';
import 'ui.dart';

const String listItemTitleText = "A BETTER BLOG FOR WRITING";
const String listItemPreviewText =
    "Sed elementum tempus egestas sed sed risus. Mauris in aliquam sem fringilla ut morbi tincidunt. Placerat vestibulum lectus mauris ultrices eros. Et leo duis ut diam. Auctor neque vitae tempus […]";

class LandingPage extends StatelessWidget {
  final Logger logger = Logger('LandingPage');
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    DateTime oldKeyTime = DateTime.now();
    RawKeyEvent? oldKeyEvent;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 32),
        child: RawKeyboardListener(
          autofocus: true,
          focusNode: FocusNode(),
          onKey: (RawKeyEvent event) {
            const double oneLine = Global.oneLine;
            const int keyInterval = Global.keyInterval;
            final DateTime newKeyTime = DateTime.now();
            final int keyElapsed = newKeyTime.millisecondsSinceEpoch - oldKeyTime.millisecondsSinceEpoch;
            final bool keyValid = oldKeyEvent == null || (oldKeyEvent != null && oldKeyEvent != event && keyElapsed > keyInterval);
            oldKeyEvent = event;
            if (keyValid) {
              oldKeyTime = newKeyTime;
              if ('${event.runtimeType}' == Global.keyDownEvent) {
                const int scrollDuration = keyInterval;
                double scrollTo = scrollController.offset;
                if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
                  scrollTo -= oneLine;
                }
                else if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
                  scrollTo += oneLine;
                }
                else if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
                  if (scrollTo <= 0) {
                    scrollTo -= oneLine;
                  } else {
                    scrollTo -= MediaQuery.of(context).size.height / 2;
                  }
                }
                else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
                  if (scrollTo >= scrollController.position.maxScrollExtent) {
                    scrollTo += oneLine;
                  } else {
                    scrollTo += MediaQuery.of(context).size.height / 2;
                  }
                }
                else if (event.isKeyPressed(LogicalKeyboardKey.pageUp)) {
                  if (scrollTo == 0) {
                    scrollTo -= oneLine;
                  } else {
                    scrollTo -= MediaQuery.of(context).size.height;
                  }
                }
                else if (event.isKeyPressed(LogicalKeyboardKey.pageDown)) {
                  if (scrollTo >= scrollController.position.maxScrollExtent) {
                    scrollTo += oneLine;
                  } else {
                    scrollTo += MediaQuery.of(context).size.height;
                  }
                }
                else if (event.isKeyPressed(LogicalKeyboardKey.home)) {
                  if (scrollTo <= 0) {
                    scrollTo -= oneLine;
                  } else {
                    scrollTo = 0;
                  }
                }
                else if (event.isKeyPressed(LogicalKeyboardKey.end)) {
                  if (scrollTo >= scrollController.position.maxScrollExtent) {
                    scrollTo += oneLine;
                  } else {
                    scrollTo = scrollController.position.maxScrollExtent;
                  }
                }

                if (scrollTo < -oneLine) {
                  scrollTo = 0;
                } else if (scrollTo > scrollController.position.maxScrollExtent + oneLine) {
                  scrollTo = scrollController.position.maxScrollExtent;
                }

                scrollController.animateTo(
                  scrollTo,
                  duration: Duration(milliseconds: scrollDuration),
                  curve: Curves.ease);
              }
            }
          },
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
