class customer {
  int Id;
  String CustomerCode;
  String CustomerName;
  String CustomerDir;
  String Phone1;
  String Phon2;
  String ShippingMth;
  String VendorCode;

  customer(
      {required this.Id,
      required this.CustomerCode,
      required this.CustomerDir,
      required this.CustomerName,
      required this.Phon2,
      required this.Phone1,
      required this.VendorCode,
      required this.ShippingMth});

  Map<String, dynamic> toMap() {
    return {
      'id': Id,
      'CustomerCode': CustomerCode,
      'CustomerName': CustomerName,
      'CustomerDir': CustomerDir,
      'Phone1': Phone1,
      'Phone2': Phon2,
      'ShippingMth': ShippingMth,
      'VenedorCode': VendorCode
    };
  }
}
