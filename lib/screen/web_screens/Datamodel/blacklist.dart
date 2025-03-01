class ItemModel {
  final String title;
  final String subtitle;
  bool isEnabled;

  ItemModel({
    required this.title,
    required this.subtitle,
    this.isEnabled = false,
  });
}
