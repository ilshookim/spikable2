
import 'package:spikable2/app_controller.dart';

import 'app.dart';
import 'ui.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    final String pushButtonHint = 'pushButtonHint'.tr;
    return Scaffold(
      appBar: AppBar(
        title: Text('${Global.title}'.tr),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              pushButtonHint,
            ),
            Obx(() => Text(
              '${controller.count}',
              style: Theme.of(context).textTheme.headline4,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
