import 'package:Formus/app/bloc/your_day/your_day_event.dart';
import 'package:Formus/app/bloc/your_day/your_day_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class YourDaysBloc extends Bloc<YourDayEvent, YourDayState> {
  YourDaysBloc() : super(YourDayState.inital()) {
    on<LoadMonthDays>((event, emit) async {});

    on<SelectDay>((event, emit) async =>
        emit(state.copyWith(daySelected: event.daySelected)));
  }
}
