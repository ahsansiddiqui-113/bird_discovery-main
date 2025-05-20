import 'package:get/get.dart';

class PlanController extends GetxController {
  var selectedPlan = 'Free Trial'.obs;
  var isFreeTrialEnabled = true.obs;

  void selectPlan(String plan) {
    selectedPlan.value = plan;
  }

  void toggleFreeTrial(bool value) {
    isFreeTrialEnabled.value = value;
  }
}
