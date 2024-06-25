import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime)? onDateChanged;

  const AdaptativeDatePicker(
    this.selectedDate,
    this.onDateChanged,
  );

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if(pickedDate == null) {
        return;
      }

      onDateChanged!(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
          height: 180,
          child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2021),
              maximumDate: DateTime.now(), 
              onDateTimeChanged: onDateChanged!,
            ),
        )
        : Container(
          height: 70,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  selectedDate == null 
                  ? 'No Date Chosen' 
                  : 'Picked Date: ${DateFormat('dd/MM/y').format(selectedDate!)}',
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Colors.purple),
                onPressed: () => _showDatePicker(context),
                child: Text(
                  'Choose Date',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
  }
}