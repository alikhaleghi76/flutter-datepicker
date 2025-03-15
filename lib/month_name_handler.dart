extension StringExt on int {
  String getMonthName(bool isJalali, {List<String>? monthsNames}) {
    if (this > 12 || this < 1) return '$this';

    if (monthsNames != null && monthsNames.length == 12) {
      return monthsNames[this - 1];
    }

    return this > 12 ? '$this' : (isJalali ? _jalaliMonths : _gregorianMonths)[this - 1];
  }

  static const _jalaliMonths = [
    "فروردین",
    "اردیبهشت",
    "خرداد",
    "تیر",
    "مرداد",
    "شهریور",
    "مهر",
    "آبان",
    "آذر",
    "دی",
    "بهمن",
    "اسفند",
  ];

  static const _gregorianMonths = [
    "Jan",
    "Feb",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];
}
