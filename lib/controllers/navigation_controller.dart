import 'package:get/get.dart';

class NavigationController extends GetxController {
  final RxInt _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;

  void setIndex(int index) {
    _selectedIndex.value = index;
  }
}
