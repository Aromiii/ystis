import 'package:flutter/material.dart';

class AgeScreen extends StatefulWidget {
  final Function(DateTime) onChanged;

  AgeScreen({required this.onChanged});

  @override
  _AgeScreenState createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  DateTime age = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                'birthday is',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Container(
                child: GestureDetector(
              onTap: () async {
                final DateTime currentDate = DateTime.now();
                final DateTime minDate = currentDate.subtract(Duration(days: 120 * 365)); // Minimum age: 120 years
                final DateTime maxDate = currentDate.subtract(Duration(days: 13 * 365)); // Maximum age: 13 years

                final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: maxDate,
                    firstDate: minDate,
                    lastDate: maxDate,
                    initialDatePickerMode: DatePickerMode.year,
                    builder: (context, child) {
                      return Theme(
                          data: ThemeData.dark(),
                          child: child as Widget);
                    });

                if (picked != null && picked != age) {
                  setState(() {
                    age = picked;
                    widget.onChanged(picked);
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: Text(
                  "${age.day}/${age.month}/${age.year}",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )),
          ),
        ),
      ],
    );
  }
}
