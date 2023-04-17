import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HorizontalTimelineController extends GetxController {
  final scrollController = ScrollController().obs;
  final zoomLevel = 1.0.obs;

  void zoom(double scale) => zoomLevel.value = scale;

  @override
  void onClose() {
    scrollController.value.dispose();
    super.onClose();
  }
}
