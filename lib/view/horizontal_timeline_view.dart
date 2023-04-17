import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_timer/controllers/horizontal_timeline_controller.dart';

class HorizontalTimelineView extends StatefulWidget {
  @override
  State<HorizontalTimelineView> createState() => _HorizontalTimelineViewState();
}

class _HorizontalTimelineViewState extends State<HorizontalTimelineView> {
  final controller = Get.put(HorizontalTimelineController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizontal Timeline'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  controller: controller.scrollController.value,
                  scrollDirection: Axis.horizontal,
                  itemCount: 24 * 60,
                  itemBuilder: (context, index) {
                    final minutes = index % 60;
                    final hours = index ~/ 60;
                    final timeOfDay = TimeOfDay(hour: hours, minute: minutes);
                    return Container(
                      margin: EdgeInsets.all(20),
                      color: minutes == 0? Colors.red: Colors.grey,
                      width: controller.zoomLevel.value * 84,
                      height: 50,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: 2,
                                height: 30,
                                child: Container(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(timeOfDay.format(context)),
                          ),
                         
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
            Slider(
              value: controller.zoomLevel.value,
              min: 0.0167, // 1 minute / 60 minutes in an hour
              max: 1.0,
              onChanged: (value) {
                controller.zoom(value);
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
