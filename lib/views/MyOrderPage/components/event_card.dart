import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.isPast, required this.child});
  final bool isPast;
  final child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: isPast ? Colors.deepPurple[300] : Colors.deepPurple[100],
          borderRadius: BorderRadius.circular(8)),
      child: child,
    );
  }
}
