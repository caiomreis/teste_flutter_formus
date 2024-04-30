import 'package:equatable/equatable.dart';

class YourDayState extends Equatable {
  final bool? loading;
  final int? daySelected;

  const YourDayState({
    this.loading = true,
    this.daySelected,
  });

  factory YourDayState.inital() {
    return YourDayState(daySelected: DateTime.now().day);
  }

  YourDayState copyWith({
    bool? loading,
    int? daySelected,
  }) {
    return YourDayState(
      loading: loading ?? this.loading,
      daySelected: daySelected ?? this.daySelected,
    );
  }

  @override
  List<Object?> get props => [loading, daySelected];
}
