import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  AdaptativeButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: () => onPressed,
            color: Colors.purple,
            child: Text(label),
          )
        : ElevatedButton(
            onPressed: () => onPressed,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.purple),
              textStyle: WidgetStateProperty.all(
                TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            child: Text(label),
          );
  }
}
