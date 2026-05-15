import 'package:get/get.dart';
import '../models/shelf_item.dart';

class ShelfLifeViewModel extends GetxController {
  final RxList<ShelfItem> items = <ShelfItem>[
    const ShelfItem(
      itemId: 'IN01',
      itemName: 'Tomato',
      itemType: 'Vegetables',
      preservationMethod: 'Refrigerator',
      storageLocation: 'Location 1',
      totalQuantity: '8 kg',
      daysLeft: '2 Days',
      available: '2 kg',
    ),
    const ShelfItem(
      itemId: 'IN01',
      itemName: 'Cheese',
      itemType: 'Dairy',
      preservationMethod: 'Deep Freeze',
      storageLocation: 'Location 2',
      totalQuantity: '5 kg',
      daysLeft: '3 Days',
      available: '3 kg',
    ),
    const ShelfItem(
      itemId: 'IN01',
      itemName: 'Rice',
      itemType: 'Grocery',
      preservationMethod: 'Dry',
      storageLocation: 'Location 1',
      totalQuantity: '20 kg',
      daysLeft: '5 Days',
      available: '5 kg',
    ),
    const ShelfItem(
      itemId: 'IN01',
      itemName: 'Tomato',
      itemType: 'Vegetables',
      preservationMethod: 'Refrigerator',
      storageLocation: 'Location 2',
      totalQuantity: '8 kg',
      daysLeft: '6 Days',
      available: '7 kg',
    ),
    const ShelfItem(
      itemId: 'IN01',
      itemName: 'Tomato',
      itemType: 'Vegetables',
      preservationMethod: 'Refrigerator',
      storageLocation: 'Location 1',
      totalQuantity: '8 kg',
      daysLeft: '2 Days',
      available: '4 kg',
    ),
    const ShelfItem(
      itemId: 'IN01',
      itemName: 'Tomato',
      itemType: 'Vegetables',
      preservationMethod: 'Refrigerator',
      storageLocation: 'Location 2',
      totalQuantity: '8 kg',
      daysLeft: '2 Days',
      available: '7 kg',
    ),
  ].obs;

  void getDiscountOffer(ShelfItem item) {
    Get.snackbar(
      'Discount Offer',
      'Getting discount offer for ${item.itemName}',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void removeFromWatchlist(ShelfItem item) {
    items.remove(item);
    Get.snackbar(
      'Removed',
      '${item.itemName} removed from watchlist',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
