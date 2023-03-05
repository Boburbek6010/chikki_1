import 'package:flutter/material.dart';

class StatefulWrapper extends StatefulWidget {
  final Function onInit;
  final Widget child;
  const StatefulWrapper({super.key, required this.onInit, required this.child});
  @override
  StatefulWrapperState createState() => StatefulWrapperState();
}
class StatefulWrapperState extends State<StatefulWrapper> {


  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      widget.onInit();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}