class Customer {
  final String customerImage;
  late final String customerId;
  final String cusomtername;
  final String customeremail;

  Customer(
      {required this.cusomtername,
      required this.customerId,
      required this.customerImage,
      required this.customeremail});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
        cusomtername: json['customername'],
        customerId: json['customerId'],
        customerImage: json['customerImage'],
        customeremail: json['customeremail']);
  }
}
