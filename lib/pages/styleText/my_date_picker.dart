import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDatePicker extends StatefulWidget {
  const MyDatePicker({Key? key}) : super(key: key);

  @override
  State<MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  DateTime? _myDateTime;
  String time = 'dd/mm/yyyy';
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(time),
        ElevatedButton(
            onPressed: () async {
              _myDateTime = await showDatePicker(
                context: context,
                initialDate:
                    _myDateTime == null ? DateTime.now() : _myDateTime!,
                firstDate: DateTime(1900),
                lastDate: DateTime(2999),
              );
              setState(() {
                time = DateFormat('dd-MM-yyyy').format(_myDateTime!);
              });
            },
            child: const Icon(Icons.date_range))
      ],
    );
  }
}
