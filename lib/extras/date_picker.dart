import 'package:flutter/material.dart';

class DateSelection extends StatefulWidget {
  const DateSelection({super.key});

  @override
  State<DateSelection> createState() => _DateSelectionState();
}

class _DateSelectionState extends State<DateSelection> {
  var currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: TextField(
          controller: TextEditingController(
              text: '${currentDate.toLocal()}'.split(' ')[0]),
          onTap: () => selectDate(context),
          readOnly: true,
          decoration: const InputDecoration(
              labelText: 'Select Date', suffixIcon: Icon(Icons.calendar_month)),
        ),
      ),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
        context: context, firstDate: DateTime(2000), lastDate: DateTime(2050));
    if (selectedDate != null && selectedDate != currentDate) {
      setState(() {
        currentDate = selectedDate;
      });
    }
  }
}

void main() {
  runApp(const MaterialApp(
    home: DateSelection(),
    debugShowCheckedModeBanner: false,
  ));
}
