import 'package:flutter/material.dart';
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';

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
        title: Text("DatePicker Demo"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LinearDatePicker(
                startDate: "1396/12/12",
                endDate: "1398/01/14",
                initialDate: "1397/05/05",
                dateChangeListener: (String selectedDate) {
                  print(selectedDate);
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
                yearText: "سال | year",
                monthText: "ماه | month",
                dayText: "روز | day",
                showLabels: true,
                columnWidth: 100,
                showMonthName: true,
                isJalaali: true,
              ),
              ElevatedButton(
                child: Text(
                  "Pick Date | انتخاب تاریخ",
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
                dateChangeListener: (String selectedDate) {
                  print(selectedDate);
                },
                showMonthName: true,
                isJalaali: false,
              ),
            ));
  }
}
