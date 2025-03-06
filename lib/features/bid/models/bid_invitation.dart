// Main Model Class for the entire structure
class BidInvitation {
  final Bid bid;
  final List<Item> items;

  BidInvitation({
    required this.bid,
    required this.items,
  });

  // Factory method to create a BidInvitation object from JSON
  factory BidInvitation.fromJson(Map<String, dynamic> json) {
    return BidInvitation(
      bid: Bid.fromJson(json['bid']),
      items: List<Item>.from(json['items'].map((item) => Item.fromJson(item))),
    );
  }

  // Method to convert BidInvitation object to JSON
  Map<String, dynamic> toJson() {
    return {
      'bid': bid.toJson(),
      'items': items.map((item) => item.toJson()).toList(),
    };
  }
}

// Bid Model
class Bid {
  final String? title;
  final int? bankAccNo;
  final DateTime? validDate;
  final DateTime? closeDate;
  final String? bankName;

  Bid({
    this.title,
    this.bankAccNo,
    this.validDate,
    this.closeDate,
    this.bankName,
  });

  // Factory method to create a Bid object from JSON
  factory Bid.fromJson(Map<String, dynamic> json) {
    return Bid(
      title: json['title'],
      bankAccNo: json['bankAccNo'],
      validDate: DateTime.tryParse(json['validDate']),
      closeDate: DateTime.tryParse(json['closeDate']),
      bankName: json['bankName'],
    );
  }

  // Method to convert Bid object to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'bankAccNo': bankAccNo,
      'validDate': validDate?.toIso8601String(),
      'closeDate': closeDate?.toIso8601String(),
      'bankName': bankName,
    };
  }
}

// Item Model
class Item {
  final String? name;
  final int? quantity;
  final String? specification;
  final DateTime? deliveryTime;
  // final double? price;

  Item({
    required this.name,
    required this.quantity,
    required this.specification,
    required this.deliveryTime,
    // required this.price,
  });

  // Factory method to create an Item object from JSON
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      quantity: json['quantity'],
      specification: json['specification'],
      deliveryTime: DateTime.tryParse(json['deliveryTime']),
      // price: json['price']?.toDouble(),
    );
  }

  // Method to convert Item object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'specification': specification,
      'deliveryTime': deliveryTime?.toIso8601String(),
      // 'price': price,
    };
  }
}
