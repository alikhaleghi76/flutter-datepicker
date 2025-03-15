
# Flutter Persian (Jalali) and Gregorian Linear Date Picker
[![Pub](https://img.shields.io/pub/v/flutter_linear_datepicker?color=blue)](https://pub.dev/packages/flutter_linear_datepicker)

This package provides a Persian or Gregorian linear DatePicker for flutter. 

<p align="center">
 <img src="https://raw.githubusercontent.com/alikhaleghi76/flutter-datepicker/master/screenshots/screen1.jpg" width="300" title="Screenshot 1"> <img src="https://raw.githubusercontent.com/alikhaleghi76/flutter-datepicker/master/screenshots/screen2.jpg" width="300" alt="Screenshot 2"></p><br>

## Use this package as a library
#### 1. Depend on it
Add this to your package's pubspec.yaml file:
```
dependencies:
 flutter_linear_datepicker: ^3.0.0
 ```
#### 2. Install it
You can install packages from the command line:

with pub:
```
$ pub get
```

with Flutter:
```
$ flutter pub get
```
Alternatively, your editor might support pub get or flutter pub get. Check the docs for your editor to learn more.

#### 3. Import it
Now in your Dart code, you can use:
```
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';
import 'package:flutter_linear_datepicker/number_picker.dart';
```
<br>

## How to use?
#### Simple usage
just simply put following widget in your flutter code:

```
LinearDatePicker(
  dateChangeListener: (DateTime selectedDate) {
    print(selectedDate);
  },
);
```
<br>

#### Advanced usage
You can customize widget using below parameters:
```
LinearDatePicker(
  startDate: DateTime(2022),
  endDate: DateTime.now().add(Duration(days: 365)),
  initialDate: DateTime.now(),
  dateChangeListener: (DateTime selectedDate) {
    print(selectedDate);
  },
  showDay: true,  //false -> only select year & month
  labelStyle: TextStyle(
    fontFamily: 'sans',
    fontSize: 14.0,
    color: Colors.black,
  ),
  selectedRowStyle: TextStyle(
    fontFamily: 'sans',
    fontSize: 18.0,
    color: Colors.deepOrange,
  ),
  unselectedRowStyle: TextStyle(
    fontFamily: 'sans',
    fontSize: 16.0,
    color: Colors.blueGrey,
  ),
  yearLabel: "سال | year",
  monthLabel: "ماه | month",
  dayLabel: "روز | day",
  showLabels: true, // to show column captions, eg. year, month, etc.
  columnWidth: 100,
  showMonthName: true,
  isJalali: false,  // false -> Gregorian
  debounceDuration: Duration(milliseconds: 300), // delay duration to emit the selected date
),
```
<br>

#### Used Packages
[MarcinusX/NumberPicker](https://github.com/MarcinusX/NumberPicker)
[FatulM/shamsi_date](https://github.com/FatulM/shamsi_date)