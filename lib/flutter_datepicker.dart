import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

import 'number_picker.dart';

class LinearDatePicker extends StatefulWidget {
  final bool showDay;
  final Function(String date) dateChangeListener;

  final String startDate;
  final String endDate;
  final String initialDate;

  final String fontFamily;

  final Color textColor;
  final Color selectedColor;
  final Color unselectedColor;

  final String yearText;
  final String monthText;
  final String dayText;

  final bool showLabels;
  final double columnWidth;
  final bool isJalaali;
  final bool showMonthName;

  LinearDatePicker(
      {this.startDate = "",
      this.endDate = "",
      this.initialDate = "",
      @required this.dateChangeListener,
      this.showDay = true,
      this.fontFamily = "",
      this.textColor,
      this.selectedColor,
      this.unselectedColor,
      this.yearText = "سال",
      this.monthText = "ماه",
      this.dayText = "روز",
      this.showLabels = true,
      this.columnWidth = 55.0,
      this.isJalaali = false,
      this.showMonthName = false,
      });

  @override
  _LinearDatePickerState createState() => _LinearDatePickerState(
      startDate, endDate, initialDate, dateChangeListener,
      showDay: showDay,
      fontFamily: fontFamily,
      textColor: textColor,
      selectedColor: selectedColor,
      unselectedColor: unselectedColor,
      yearText: yearText,
      monthText: monthText,
      dayText: dayText,
      showLabels: showLabels,
      columnWidth: columnWidth,
      isJalaali: isJalaali,
      showMonthName: showMonthName,
  );
}

class _LinearDatePickerState extends State<LinearDatePicker> {
  int _selectedYear;
  int _selectedMonth;
  int _selectedDay;

  int minYear;
  int maxYear;

  int minMonth = 01;
  int maxMonth = 12;

  int minDay = 01;
  int maxDay = 31;

  bool showDay;

  final String startDate;
  final String endDate;
  final String initialDate;

  Function(String date) onDateSelected;

  String fontFamily;

  Color textColor;
  Color selectedColor;
  Color unselectedColor;

  String yearText;
  String monthText;
  String dayText;

  bool showLabels = false;

  double columnWidth;

  bool isJalaali;

  bool showMonthName;

  _LinearDatePickerState(
      this.startDate, this.endDate, this.initialDate, this.onDateSelected,
      {this.showDay = true,
      this.fontFamily = "",
      this.textColor,
      this.selectedColor,
      this.unselectedColor,
      this.yearText,
      this.monthText,
      this.dayText,
      this.showLabels,
      this.columnWidth,
      this.isJalaali,
      this.showMonthName});

  @override
  initState() {
    super.initState();
    if (isJalaali) {
      minYear = Jalali.now().year - 100;
      maxYear = Jalali.now().year;
    } else {
      minYear = Gregorian.now().year - 100;
      maxYear = Gregorian.now().year;
    }
    if (initialDate.isNotEmpty) {
      List<String> initList = initialDate.split("/");
      _selectedYear = int.parse(initList[0]);
      _selectedMonth = int.parse(initList[1]);
      if (showDay)
        _selectedDay = int.parse(initList[2]);
      else
        _selectedDay = isJalaali ? Jalali.now().day : Jalali.now().day;
    } else {
      if (isJalaali) {
        _selectedYear = Jalali.now().year;
        _selectedMonth = Jalali.now().month;
        _selectedDay = Jalali.now().day;
      } else {
        _selectedYear = Gregorian.now().year;
        _selectedMonth = Gregorian.now().month;
        _selectedDay = Gregorian.now().day;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    maxDay = _getMonthLength(_selectedYear, _selectedMonth);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: showLabels,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: columnWidth,
                  child: Text(
                    yearText,
                    style: TextStyle(fontFamily: fontFamily, color: textColor),
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                  width: columnWidth,
                  child: Text(
                    monthText,
                    style: TextStyle(fontFamily: fontFamily, color: textColor),
                    textAlign: TextAlign.center,
                  )),
              Visibility(
                visible: showDay,
                child: SizedBox(
                    width: columnWidth,
                    child: Text(
                      dayText,
                      style:
                          TextStyle(fontFamily: fontFamily, color: textColor),
                      textAlign: TextAlign.center,
                    )),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumberPicker.integer(
                listViewWidth: columnWidth,
                initialValue: _selectedYear,
                minValue: _getMinimumYear(),
                maxValue: _getMaximumYear(),
                fontFamily: fontFamily,
                selectedColor: selectedColor,
                unselectedColor: unselectedColor,
                onChanged: (value) {
                  setState(() {
                    _selectedYear = value;
                    if (showDay)
                      onDateSelected(
                          "$_selectedYear/$_selectedMonth/$_selectedDay");
                    else
                      onDateSelected("$_selectedYear/$_selectedMonth");
                  });
                }),
            NumberPicker.integer(
                listViewWidth: columnWidth,
                initialValue: _selectedMonth,
                minValue: _getMinimumMonth(),
                maxValue: _getMaximumMonth(),
                fontFamily: fontFamily,
                selectedColor: selectedColor,
                unselectedColor: unselectedColor,
                isShowMonthName: showMonthName,
                isJalali: isJalaali,
                onChanged: (value) {
                  setState(() {
                    _selectedMonth = value;
                    if (showDay)
                      onDateSelected(
                          "$_selectedYear/$_selectedMonth/$_selectedDay");
                    else
                      onDateSelected("$_selectedYear/$_selectedMonth");
                  });
                }),
            Visibility(
              visible: showDay,
              child: NumberPicker.integer(
                  listViewWidth: columnWidth,
                  initialValue: _selectedDay,
                  minValue: _getMinimumDay(),
                  maxValue: _getMaximumDay(),
                  fontFamily: fontFamily,
                  selectedColor: selectedColor,
                  unselectedColor: unselectedColor,
                  onChanged: (value) {
                    setState(() {
                      _selectedDay = value;
                      if (showDay)
                        onDateSelected(
                            "$_selectedYear/$_selectedMonth/$_selectedDay");
                      else
                        onDateSelected("$_selectedYear/$_selectedMonth");
                    });
                  }),
            )
          ],
        ),
      ],
    );
  }

  _getMonthLength(int selectedYear, int selectedMonth) {
    if (isJalaali) {
      if (selectedMonth <= 6) {
        return 31;
      }
      if (selectedMonth > 6 && selectedMonth < 12) {
        return 30;
      }
      if (Jalali(selectedYear).isLeapYear()) {
        return 30;
      } else {
        return 29;
      }
    } else {
      DateTime firstOfNextMonth;
      if (selectedMonth == 12) {
        firstOfNextMonth = DateTime(
            selectedYear + 1, 1, 1, 12); //year, selectedMonth, day, hour
      } else {
        firstOfNextMonth = DateTime(selectedYear, selectedMonth + 1, 1, 12);
      }
      int numberOfDaysInMonth =
          firstOfNextMonth.subtract(Duration(days: 1)).day;
      //.subtract(Duration) returns a DateTime, .day gets the integer for the day of that DateTime
      return numberOfDaysInMonth;
    }
  }

  int _getMinimumMonth() {
    if (startDate.isNotEmpty) {
      var startList = startDate.split("/");
      int startMonth = int.parse(startList[1]);

      if (_selectedYear == _getMinimumYear()) {
        return startMonth;
      }
    }

    return minMonth;
  }

  int _getMaximumMonth() {
    if (endDate.isNotEmpty) {
      var endList = endDate.split("/");
      int endMonth = int.parse(endList[1]);
      if (_selectedYear == _getMaximumYear()) {
        return endMonth;
      }
    }
    return maxMonth;
  }

  int _getMinimumYear() {
    if (startDate.isNotEmpty) {
      var startList = startDate.split("/");
      return int.parse(startList[0]);
    }
    return minYear;
  }

  _getMaximumYear() {
    if (endDate.isNotEmpty) {
      var endList = endDate.split("/");
      return int.parse(endList[0]);
    }
    return maxYear;
  }

  int _getMinimumDay() {
    if (startDate.isNotEmpty && showDay) {
      var startList = startDate.split("/");
      int startDay = int.parse(startList[2]);

      if (_selectedYear == _getMinimumYear() &&
          _selectedMonth == _getMinimumMonth()) {
        return startDay;
      }
    }

    return minDay;
  }

  int _getMaximumDay() {
    if (endDate.isNotEmpty && showDay) {
      var endList = endDate.split("/");
      int endDay = int.parse(endList[2]);
      if (_selectedYear == _getMaximumYear() &&
          _selectedMonth == _getMinimumMonth()) {
        return endDay;
      }
    }
    return _getMonthLength(_selectedYear, _selectedMonth);
  }
}
