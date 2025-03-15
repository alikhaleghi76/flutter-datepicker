import 'package:flutter/material.dart';
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';
import 'package:shamsi_date/shamsi_date.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DatePicker Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DatePicker Demo'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LinearDatePicker(
                startDate: DateTime(2022),
                endDate: DateTime.now().add(Duration(days: 365)),
                initialDate: DateTime.now(),
                dateChangeListener: (DateTime selectedDate) {
                  print(Jalali.fromDateTime(selectedDate));
                },
                showDay: true,
                labelStyle: TextStyle(
                  fontFamily: 'iran',
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                selectedRowStyle: TextStyle(
                  fontFamily: 'iran',
                  fontSize: 18.0,
                  color: Colors.deepOrange,
                ),
                unselectedRowStyle: TextStyle(
                  fontFamily: 'iran',
                  fontSize: 16.0,
                  color: Colors.blueGrey,
                ),
                yearLabel: 'سال | year',
                monthLabel: 'ماه | month',
                dayLabel: 'روز | day',
                showLabels: true,
                columnWidth: 100,
                showMonthName: true,
                isJalali: true,
                debounceDuration: Duration(milliseconds: 400),
                monthsNames: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12',],
              ),
              ElevatedButton(
                child: Text(
                  'Pick Date | انتخاب تاریخ',
                ),
                onPressed: () {
                  showDateDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Choose Date'),
        content: LinearDatePicker(
          dateChangeListener: (DateTime selectedDate) {
            print(selectedDate);
          },
          showMonthName: true,
          isJalali: false,
        ),
      ),
    );
  }
}
