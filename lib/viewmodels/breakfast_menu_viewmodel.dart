import 'package:get/get.dart';
import '../models/menu_item.dart';

class BreakfastMenuViewModel extends GetxController {
  final RxInt selectedTab = 1.obs; // 0: Prepare, 1: Available, 2: Required
  final RxBool isEditMode = false.obs;

  final RxList<MenuItem> menuItems = <MenuItem>[
    MenuItem(
      itemName: 'Beef Steak',
      availableQuantity: '100',
      requiredQuantity: '50',
      unit: 'kg',
      updatedBy: 'Rahul K.',
    ),
    MenuItem(
      itemName: 'Paneer Tikka',
      availableQuantity: '--',
      requiredQuantity: '50',
      unit: 'Pieces',
      updatedBy: 'Salman',
    ),
    MenuItem(
      itemName: 'Beef Steak',
      availableQuantity: '100',
      requiredQuantity: '50',
      unit: 'kg',
      updatedBy: '--',
    ),
    MenuItem(
      itemName: 'Paneer Tikka',
      availableQuantity: '50',
      requiredQuantity: '50',
      unit: 'Pieces',
      updatedBy: 'Salman',
    ),
  ].obs;

  void changeTab(int index) {
    selectedTab.value = index;
    isEditMode.value = false;
  }

  void toggleEditMode() {
    isEditMode.value = !isEditMode.value;
  }

  void saveChanges() {
    isEditMode.value = false;
    Get.snackbar('Success', 'Changes saved successfully');
  }

  void updateItemQuantity(int index, String quantity) {
    if (selectedTab.value == 2) {
      menuItems[index] = menuItems[index].copyWith(requiredQuantity: quantity);
    } else {
      menuItems[index] = menuItems[index].copyWith(availableQuantity: quantity);
    }
  }
}
