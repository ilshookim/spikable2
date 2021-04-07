
import 'app.dart';
import 'ui.dart';

// Text
Color textPrimary = Color(0xFF111111);
Color textSecondary = Color(0xFF3A3A3A);

// Margin
const EdgeInsets marginBottom12 = EdgeInsets.only(bottom: 12);
const EdgeInsets marginBottom24 = EdgeInsets.only(bottom: 24);
const EdgeInsets marginBottom40 = EdgeInsets.only(bottom: 40);

// Padding
const EdgeInsets paddingBottom24 = EdgeInsets.only(bottom: 24);

// Text Style
TextStyle headlineTextStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(
        fontSize: 26,
        color: textPrimary,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w300));

TextStyle headlineSecondaryTextStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(
        fontSize: 20, color: textPrimary, fontWeight: FontWeight.w300));

TextStyle subtitleTextStyle = GoogleFonts.openSans(
    textStyle: TextStyle(fontSize: 14, color: textSecondary, letterSpacing: 1));

TextStyle bodyTextStyle = GoogleFonts.openSans(
    textStyle: TextStyle(fontSize: 14, color: textPrimary));

TextStyle buttonTextStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(fontSize: 14, color: textPrimary, letterSpacing: 1));

ButtonStyle buttonStyle = TextButton.styleFrom(
  padding: EdgeInsets.symmetric(horizontal: 20));

class TextBody extends StatelessWidget {
  final String text;

  const TextBody({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginBottom24,
      child: Text(
        text,
        style: bodyTextStyle,
      ),
    );
  }
}

class TextBodySecondary extends StatelessWidget {
  final String text;

  const TextBodySecondary({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginBottom24,
      child: Text(
        text,
        style: subtitleTextStyle,
      ),
    );
  }
}

class TextHeadlineSecondary extends StatelessWidget {
  final String text;

  const TextHeadlineSecondary({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginBottom12,
      child: Text(
        text,
        style: headlineSecondaryTextStyle,
      ),
    );
  }
}

class TextBlockquote extends StatelessWidget {
  final String text;

  const TextBlockquote({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginBottom24,
      decoration: BoxDecoration(
          border: Border(left: BorderSide(width: 2, color: Color(0xFF333333)))),
      padding: EdgeInsets.only(left: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: bodyTextStyle,
        ),
      ),
    );
  }
}

class ImageWrapper extends StatelessWidget {
  final String image;

  const ImageWrapper({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO Listen to inherited widget width updates.
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24),
      child: Image.asset(
        image,
        width: width,
        height: width / 1.618,
        fit: BoxFit.cover,
      ),
    );
  }
}

class TagWrapper extends StatelessWidget {
  final List<Tag> tags;

  const TagWrapper({Key? key, this.tags = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: paddingBottom24,
        child: Wrap(
          spacing: 8,
          runSpacing: 0,
          children: <Widget>[...tags],
        ));
  }
}

class Tag extends StatelessWidget {
  final String tag;

  const Tag({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      child: Text(
        tag,
        style: GoogleFonts.openSans(color: Colors.white, fontSize: 14),
      ),
      fillColor: Color(0xFF242424),
      padding: EdgeInsets.symmetric(horizontal: 16),
      elevation: 0,
      hoverElevation: 0,
      hoverColor: Color(0xFFC7C7C7),
      highlightElevation: 0,
      focusElevation: 0,
    );
  }
}

class ReadMoreButton extends StatelessWidget {
  final Function onPressed;

  const ReadMoreButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool hover = false;
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      final String readmore = 'readmore'.tr;
      return MouseRegion(
        onHover: (event) => setState(() => hover = true),
        onExit: (event) => setState(() => hover = false),
        child: OutlineButton(
          onPressed: onPressed as void Function()?,
          highlightedBorderColor: textPrimary,
          hoverColor: textPrimary,
          borderSide: BorderSide(color: textPrimary, width: 2),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            readmore,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  fontSize: 14,
                  color: hover ? Colors.white : textPrimary,
                  letterSpacing: 1),
            ),
          ),
        ),
      );
    });
  }
}

const Widget divider = Divider(color: Color(0xFFEEEEEE), thickness: 1);
Widget dividerSmall = Container(
  width: 40,
  decoration: BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: Color(0xFFA0A0A0),
        width: 1,
      ),
    ),
  ),
);

List<Widget> authorSection(
    {required String imageUrl, String? name, String? bio}) {
  return [
    divider,
    Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Row(
        children: <Widget>[
          if (imageUrl != null)
            Container(
              margin: EdgeInsets.only(right: 25),
              child: Material(
                shape: CircleBorder(),
                clipBehavior: Clip.hardEdge,
                color: Colors.transparent,
                child: Image.asset(
                  imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          Expanded(
            child: Column(
              children: <Widget>[
                if (name != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextHeadlineSecondary(text: name),
                  ),
                if (bio != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      bio,
                      style: bodyTextStyle,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    ),
    divider,
  ];
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String copyright = 'copyright'.tr;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextBody(text: copyright),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final String? imageUrl;
  final String? description;
  final String? pageId;
  final bool? allOff;

  const ListItem(
      {Key? key, required this.title, this.imageUrl, this.description, this.pageId, this.allOff})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (imageUrl != null)
          Container(
            child: ImageWrapper(
              image: imageUrl!,
            ),
          ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: marginBottom12,
            child: Text(
              title,
              style: headlineTextStyle,
            ),
          ),
        ),
        if (description != null)
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: marginBottom12,
              child: Text(
                description!,
                style: bodyTextStyle,
              ),
            ),
          ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: marginBottom24,
            child: ReadMoreButton(
              onPressed: () => (allOff != null && allOff == true) 
                ? Get.offAll(pageId, transition: Transition.noTransition) 
                : Get.toNamed(pageId!),
            ),
          ),
        ),
      ],
    );
  }
}

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String menuLogo = 'menuLogo'.tr;
    final String menuHome = 'menuHome'.tr;
    final String menuPricing = 'menuPricing'.tr;
    final String menuBlog = 'menuBlog'.tr;
    final String menuAbout = 'menuAbout'.tr;
    final String menuFaq = 'menuFaq'.tr;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () => Get.offAll(LandingPage.id, 
                  transition: Transition.noTransition),
                child: Text(menuLogo,
                  style: GoogleFonts.montserrat(
                    color: textPrimary,
                    fontSize: 30,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w500)),
              ),
              Flexible(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Wrap(
                    children: <Widget>[
                      TextButton(
                        onPressed: () => Get.offAll(LandingPage.id, 
                          transition: Transition.noTransition),
                        child: Text(menuHome, style: buttonTextStyle),
                        style: buttonStyle,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(menuPricing, style: buttonTextStyle),
                        style: buttonStyle,
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed(HomePage.id),
                        child: Text(menuBlog, style: buttonTextStyle),
                        style: buttonStyle,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(menuAbout, style: buttonTextStyle),
                        style: buttonStyle,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(menuFaq, style: buttonTextStyle),
                        style: buttonStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
            height: 1,
            margin: EdgeInsets.only(bottom: 30),
            color: Color(0xFFEEEEEE)),
      ],
    );
  }
}
