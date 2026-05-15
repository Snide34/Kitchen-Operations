class BuffetSlot {
  final String? title;
  final String? eventName;
  final String? label;
  final String? time;
  final String? link;
  final bool isNA;

  const BuffetSlot({
    this.title,
    this.eventName,
    this.label,
    this.time,
    this.link,
    this.isNA = false,
  });
}
