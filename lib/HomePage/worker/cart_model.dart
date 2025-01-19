class Cart{
  late final int? id;
  final String? productName;
  final int? price;
  final String? qName;
  final int? fec;
  final int? quantity;
  final String? image;

  Cart({
    required this.id ,
    required this.productName,
    required this.price,
    required this.qName,
    required this.fec,
    required this.quantity,
    required this.image
  });
  Cart.fromMap(Map<dynamic , dynamic>  res)
      : id = res['id'],
        productName = res["productName"],
        price = res["price"],
        qName = res["qName"],
        fec = res["fec"],
        quantity = res["quantity"],
        image = res["image"];

  Map<String, Object?> toMap(){
    return {
      'id' : id ,
      'productName' :productName,
      'price' : price,
      'qName' : qName,
      'fec' : fec,
      'quantity' : quantity,
      'image' : image,
    };
  }
}