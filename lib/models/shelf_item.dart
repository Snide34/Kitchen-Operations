class ShelfItem {
  final String itemId;
  final String itemName;
  final String itemType;
  final String preservationMethod;
  final String storageLocation;
  final String totalQuantity;
  final String daysLeft;
  final String available;

  const ShelfItem({
    required this.itemId,
    required this.itemName,
    required this.itemType,
    required this.preservationMethod,
    required this.storageLocation,
    required this.totalQuantity,
    required this.daysLeft,
    required this.available,
  });

  int get daysLeftInt => int.tryParse(daysLeft.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
}
