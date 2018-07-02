class DateTimeUtils
{
  static String ToDisplayString(DateTime dt)
  {
    return '${ToDayName(dt)}, ${ToMonthName(dt)} ${dt.day}, ${dt.year} ${dt.hour}:${dt.minute}';
  }

  static String ToDayName(DateTime dt)
  {
    switch(dt.weekday)
    {
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      case DateTime.sunday:
        return 'Sun';
    }

    return 'Unk';
  }

  static String ToMonthName(DateTime dt)
  {
    switch(dt.month)
    {
      case DateTime.january:
        return 'Jan';
      case DateTime.february:
        return 'Feb';
      case DateTime.march:
        return 'Mar';
      case DateTime.april:
        return 'Apr';
      case DateTime.may:
        return 'May';
      case DateTime.june:
        return 'Jun';
      case DateTime.july:
        return 'Jul';
      case DateTime.august:
        return 'Aug';
      case DateTime.september:
        return 'Sep';
      case DateTime.october:
        return 'Oct';
      case DateTime.november:
        return 'Nov';
      case DateTime.december:
        return 'Dec';
    }

    return 'Unk';
  }
}