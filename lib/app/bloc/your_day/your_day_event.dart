abstract class YourDayEvent {}

class LoadMonthDays extends YourDayEvent {}

class SelectDay extends YourDayEvent {
  int daySelected;

  SelectDay({required this.daySelected});
}

class LoadEvents extends YourDayEvent {}
