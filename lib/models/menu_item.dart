class MenuItem {
  final String itemName;
  final String? availableQuantity;
  final String? requiredQuantity;
  final String? unit; // 'kg' or 'Pieces'
  final String? updatedBy;
  final bool isPrepared;

  MenuItem({
    required this.itemName,
    this.availableQuantity,
    this.requiredQuantity,
    this.unit,
    this.updatedBy,
    this.isPrepared = false,
  });

  MenuItem copyWith({
    String? itemName,
    String? availableQuantity,
    String? requiredQuantity,
    String? unit,
    String? updatedBy,
    bool? isPrepared,
  }) {
    return MenuItem(
      itemName: itemName ?? this.itemName,
      availableQuantity: availableQuantity ?? this.availableQuantity,
      requiredQuantity: requiredQuantity ?? this.requiredQuantity,
      unit: unit ?? this.unit,
      updatedBy: updatedBy ?? this.updatedBy,
      isPrepared: isPrepared ?? this.isPrepared,
    );
  }
}
