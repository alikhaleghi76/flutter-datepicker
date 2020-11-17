# Flutter Linear Date Picker 
## Flutter Gregorian and Jalaali (Persian) linear date picker
<br>
<br>
[package at pub.dev](https://pub.dev/packages/flutter_linear_datepicker/versions/1.0.5)
<br>

<p align="center">
  <img src="https://raw.githubusercontent.com/alikhaleghi76/flutter-datepicker/master/screenshots/screen1.jpg" width="300" title="Screenshot 1">
  <img src="https://raw.githubusercontent.com/alikhaleghi76/flutter-datepicker/master/screenshots/screen2.jpg" width="300" alt="Screenshot 2">
</p>
<br>

## Use this package as a library
#### 1. Depend on it
Add this to your package's pubspec.yaml file:
```
dependencies:
  flutter_linear_datepicker: ^1.0.5
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
#### simple usage
just simply infalate following snippet in your flutter code:
<br>

```LinearDatePicker(); ```
<br>
<br>


#### advanced usage
You can customize widget using below parameters:
```
LinearDatePicker(
    startDate: "1396/12/12",
    endDate: "1398/01/14",
    initialDate: "1397/05/05",
    dateChangeListener: (String selectedDate) {
      print(selectedDate);
    },
    showDay: true,
    fontFamily: 'iran',
    textColor: Colors.black,
    selectedColor: Colors.deepOrange,
    unselectedColor: Colors.blueGrey,
    yearText: "سال | year",
    monthText: "ماه | month",
    dayText: "روز | day",
    showLabels: true,
    columnWidth: 100, 
    isJalaali: false
    ),
```