class Cart{
  late final int? id;
  final String? productName;
  final int? price;
  final int? qPrice;
  final int? quantity;
  final String? image;

  Cart({
    required this.id ,
    required this.productName,
    required this.price,
    required this.qPrice,
    required this.quantity,
    required this.image
  });
  Cart.fromMap(Map<dynamic , dynamic>  res)
      : id = res['id'],
        productName = res["productName"],
        price = res["price"],
        qPrice = res["qPrice"],
        quantity = res["quantity"],
        image = res["image"];

  Map<String, Object?> toMap(){
    return {
      'id' : id ,
      'productName' :productName,
      'price' : price,
      'qPrice' : qPrice,
      'quantity' : quantity,
      'image' : image,
    };
  }
}