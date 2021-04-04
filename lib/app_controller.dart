import 'app.dart';

class Controller extends GetxController {
  Rx<int> count = 0.obs;
  increment() => count++;
}
