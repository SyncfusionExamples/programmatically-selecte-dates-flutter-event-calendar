import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(ProgrammaticDateSelection());

class ProgrammaticDateSelection extends StatefulWidget {
  @override
  ProgrammaticSelectionCalendarState createState() =>
      ProgrammaticSelectionCalendarState();
}

class ProgrammaticSelectionCalendarState
    extends State<ProgrammaticDateSelection> {
  CalendarController _calendarController;

  @override
  void initState() {
    _calendarController = CalendarController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SfCalendar(
        view: CalendarView.month,
        controller: _calendarController,
        onViewChanged: viewChanged,
      ),
    )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  void viewChanged(ViewChangedDetails viewChangedDetails) {
    SchedulerBinding.instance.addPostFrameCallback((Duration duration) {
      _calendarController.selectedDate = viewChangedDetails.visibleDates[0];
    });
  }
}
