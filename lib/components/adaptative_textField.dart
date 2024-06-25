import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) onSubmitted;
  final String label;

  AdaptativeTextField({
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.onSubmitted,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
                controller: controller,
                keyboardType: TextInputType.text,
                placeholder: label,
                onSubmitted: onSubmitted,
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12)),
          )
        : TextField(
            decoration: InputDecoration(labelText: 'Title'),
            keyboardType: keyboardType,
            controller: controller,
            onSubmitted: onSubmitted,
          );
  }
}
