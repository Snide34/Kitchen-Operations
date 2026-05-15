import 'package:get/get.dart';
import '../models/shift.dart';

class ScheduleViewModel extends GetxController {
  final RxInt selectedTab = 0.obs;
  final RxInt selectedBottomNav = 3.obs;

  final List<String> tabs = ['Schedule', 'Live Orders', 'Shelf Life Items', 'Preprepared'];

  final List<String> hours = ['6am', '7am', '8am', '9am', '10am', '11am', '12pm',
                              '1pm', '2pm', '3pm', '4pm', '5pm', '6pm', '7pm', '8pm', '9pm', '10pm'];

  final List<Shift> shifts = [
    const Shift(duration: '3:45/8hour', name: 'Rajeev Singh', role: 'Head Chef', type: ShiftType.green, width: 420.0, offset: 0.0),
    const Shift(duration: '3:45/8hour', name: 'Rajeev Singh', role: 'Head Chef', type: ShiftType.yellow, width: 420.0, offset: 140.0),
    const Shift(duration: '3:45/8hour', name: 'Rajeev Singh', role: 'Head Chef', type: ShiftType.green, width: 560.0, offset: 280.0),
    const Shift(duration: '3:45/8hour', name: 'Rajeev Singh', role: 'Head Chef', type: ShiftType.green, width: 840.0, offset: 140.0),
    const Shift(duration: '3:45/8hour', name: 'Rajeev Singh', role: 'Head Chef', type: ShiftType.green, width: 420.0, offset: 0.0),
    const Shift(duration: '3:45/8hour', name: 'Rajeev Singh', role: 'Head Chef', type: ShiftType.yellow, width: 420.0, offset: 140.0),
    const Shift(duration: '3:45/8hour', name: 'Rajeev Singh', role: 'Head Chef', type: ShiftType.green, width: 560.0, offset: 280.0),
    const Shift(duration: '3:45/8hour', name: 'Rajeev Singh', role: 'Head Chef', type: ShiftType.green, width: 840.0, offset: 140.0),
    const Shift(duration: '3:45/8hour', name: 'Rajeev Singh', role: 'Head Chef', type: ShiftType.green, width: 420.0, offset: 0.0),
  ];

  void changeTab(int index) {
    selectedTab.value = index;
  }

  void changeBottomNav(int index) {
    selectedBottomNav.value = index;
  }
}
