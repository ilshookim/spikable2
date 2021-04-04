import 'app.dart';

class Controller extends GetxController {
  final box = GetStorage();
  
  Rx<int> count = 0.obs;
  increment() => count++;
}
