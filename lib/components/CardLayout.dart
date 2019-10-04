import 'package:flutter/material.dart';

class CardLayout extends StatelessWidget {

  final Widget child;

  CardLayout({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.blue.shade50,
      child: child,
    );
  }

}
