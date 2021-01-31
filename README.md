
# Flutter Persian (Jalaali) and Gregorian Linear Date Picker
[![Pub](https://img.shields.io/pub/v/flutter_linear_datepicker?color=blue)](https://pub.dev/packages/flutter_linear_datepicker)

This package provides a Persian or Gregorian linear DatePicker for flutter. 

<p align="center">
 <img src="https://raw.githubusercontent.com/alikhaleghi76/flutter-datepicker/master/screenshots/screen1.jpg" width="300" title="Screenshot 1"> <img src="https://raw.githubusercontent.com/alikhaleghi76/flutter-datepicker/master/screenshots/screen2.jpg" width="300" alt="Screenshot 2"></p><br>

## Use this package as a library
#### 1. Depend on it
Add this to your package's pubspec.yaml file:
```
dependencies:
 flutter_linear_datepicker: ^1.1.2
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
just simply infalate following snippet in your flutter code:

```
LinearDatePicker(
  dateChangeListener: (String selectedDate) {
    print(selectedDate);
  },
); 
```
<br>

#### Advanced usage
You can customize widget using below parameters:
```
LinearDatePicker(
  startDate: "2004/10/17", //yyyy/mm/dd
  endDate: "2020/02/20",
  initialDate: "2010/11/15",
  dateChangeListener: (String selectedDate) {
    print(selectedDate);
  },
  showDay: true,  //false -> only select year & month
  fontFamily: 'sans',
  showLabels: true, // to show column captions, eg. year, month, etc.
  textColor: Colors.black,
  selectedColor: Colors.deepOrange,
  unselectedColor: Colors.blueGrey,
  yearText: "سال | year",
  monthText: "ماه | month",
  dayText: "روز | day",
  columnWidth: 100,
  isJalaali: false  // false -> Gregorian
),
```
<br>

#### Used Packages
[MarcinusX/NumberPicker](https://github.com/MarcinusX/NumberPicker)
[FatulM/shamsi_date](https://github.com/FatulM/shamsi_date)