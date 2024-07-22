import 'package:flutter/cupertino.dart';

import 'buildTimeLineStepWidget.dart';

Widget buildTrackingTimeline(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  return Column(
    children: [
      buildTimelineStep(
        isActive: true,
        isCompleted: true,
        title: 'Being Packaged',
        description: 'Lorem Ipsum is simply dummy text of the printing.',
        date: '5 June',
        time: '15:20 am',
        context: context,
      ),
      buildTimelineStep(
        isActive: true,
        isCompleted: true,
        title: 'Orders in Delivery',
        description: 'Lorem Ipsum is simply dummy text of the printing.',
        date: '5 June',
        time: '15:20 am',
        context: context,
      ),
      buildTimelineStep(
        isActive: true,
        isCompleted: true,
        title: 'On the way',
        description: 'Lorem Ipsum is simply dummy text of the printing.',
        date: '5 June',
        time: '15:20 am',
        context: context,
      ),
      buildTimelineStep(
        isActive: false,
        isCompleted: false,
        title: 'Shipped',
        description: 'Lorem Ipsum is simply dummy text of the printing.',
        date: '5 June',
        time: '15:20 am',
        context: context,
      ),
    ],
  );
}