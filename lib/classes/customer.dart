class Customers {
  final int? id;
  final String CustomerCode;
  final String CustomerName;
  final String CustomerDir;
  final String Phone1;
  final String Phone2;
  final String Comment1;

  Customers(
      {this.id,
      required this.CustomerCode,
      required this.CustomerName,
      required this.CustomerDir,
      required this.Phone1,
      required this.Phone2,
      required this.Comment1});

  factory Customers.fromMap(Map<String, dynamic> json) => new Customers(
      id: json['id'],
      CustomerCode: json['CustomerCode'],
      CustomerName: json['CustomerName'],
      CustomerDir: json['CustomerDir'],
      Phone1: json['Phone1'],
      Phone2: json['Phone2'],
      Comment1: json['Comment1']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'CustomerName': CustomerName,
      'CustomerCode': CustomerCode,
      'CustomerDir': CustomerDir,
      'Phone1': Phone1,
      'Phone2': Phone2,
      'Comment1': Comment1,
    };
  }
}
