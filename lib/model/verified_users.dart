class User {
  final String id;
  final String name;
  final String dob; // Date of Birth as a String (ISO format recommended)
  final String panBill; // PAN Bill number
  final String vatBill; // VAT Bill number
  final String citizenshipNumber;
  final String officeName;
  final String phoneNumber;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.dob,
    required this.panBill,
    required this.vatBill,
    required this.citizenshipNumber,
    required this.officeName,
    required this.phoneNumber,
    required this.email,
  });

  // Factory method to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      dob: json['dob'],
      panBill: json['panBill'],
      vatBill: json['vatBill'],
      citizenshipNumber: json['citizenshipNumber'],
      officeName: json['officeName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
    );
  }

  // Method to convert a User to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'dob': dob,
      'panBill': panBill,
      'vatBill': vatBill,
      'citizenshipNumber': citizenshipNumber,
      'officeName': officeName,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }
}
