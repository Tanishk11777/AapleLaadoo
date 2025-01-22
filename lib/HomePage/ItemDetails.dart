import 'package:AapleLaadoo/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:AapleLaadoo/constants.dart';
import 'dart:math';
import 'package:AapleLaadoo/HomePage/worker/db_helper.dart';
import 'package:AapleLaadoo/HomePage/worker/cart_model.dart';

int value = 0;

class ItemDetails extends StatelessWidget {
  final int index;
  final DBHelper dbHelper;
  final CartProvider cart;
  const ItemDetails({super.key, required this.index, required this.dbHelper,required this.cart,});

  @override
  Widget build(BuildContext context) {
    List<int> quantities = List.generate(quantitiesList.length, (index) => 0);

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 65,
          child: Center(
            child: GestureDetector(
              onTap: () {
                // Insert all non-zero quantities into the cart
                for (int i = 0; i < quantities.length; i++) {
                  if (quantities[i] > 0) {
                    int productPrice = restaurantList[index].p;
                    int fec = quantitiesList[i].factor;
                    int quantity = quantities[i];
                    double adjustedPrice = (productPrice * fec * quantity) / 100;
                    adjustedPrice = double.parse(adjustedPrice.toStringAsFixed(2));
                    dbHelper.insert(
                      Cart(
                        id: index,
                        productName: restaurantList[index].title,
                        price: restaurantList[index].p,
                        qName: quantitiesList[i].title,
                        fec: quantitiesList[i].factor,
                        quantity: quantities[i],
                        image: restaurantList[index].imageUrl,
                      ),
                    ).then((value){
                      print('Product added to cart');
                    }).onError((error,stackTrace){
                      print(error.toString());
                    });
                    cart.addTotalPrice(adjustedPrice);
                    cart.addCounter();
                  }
                }
                print('added to cart');
                print(cart.getCounter());
                print(cart.getTotalPrice());
                Navigator.pop(context);
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: kPrimaryColour,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColour.withOpacity(.23),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Add To Cart",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: MainScreen(index: index, quantities: quantities),
    );
  }
}

class MainScreen extends StatelessWidget {
  final int index;
  final List<int> quantities;
  const MainScreen({super.key, required this.index, required this.quantities});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size;
    return Container(
      //padding: const EdgeInsets.only(top: 50),
      height: he.height,
      width: he.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromARGB(255, 83, 69, 164),
            const Color.fromARGB(255, 66, 53, 165).withOpacity(.8),
            const Color.fromARGB(255, 75, 53, 165).withOpacity(.6),
            const Color.fromARGB(255, 121, 112, 159).withOpacity(.4),
            const Color.fromARGB(255, 70, 53, 165).withOpacity(.2),
            const Color(0xFF6F35A5).withOpacity(.1),
            const Color(0xFF6F35A5).withOpacity(.05),
            const Color(0xFF6F35A5).withOpacity(.025),
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TopImage(index: index),
            Rating(index: index),
            FoodDescription(index: index),
            Quantity(index: index, quantities: quantities),
          ],
        ),
      ),
    );
  }
}

class Quantity extends StatefulWidget {
  final int index;
  final List<int> quantities;

  Quantity({Key? key, required this.index, required this.quantities}) : super(key: key);

  @override
  State<Quantity> createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 6, left: 25, right: 25),
          height: size.height * 0.06,
          width: size.width,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Menu",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Text(
                "View all",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Colors.black,
              ),
            ],
          ),
        ),
        for (int i = 0; i < quantitiesList.length; i++)
          Container(
            padding: const EdgeInsets.only(top: 6, left: 25, right: 25),
            height: size.height * 0.06,
            width: size.width,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.transparent.withOpacity(0.01),
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  quantitiesList[i].title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (widget.quantities[i] > 0) {
                            widget.quantities[i]--;
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      widget.quantities[i].toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.quantities[i]++;
                        });
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class TopImage extends StatefulWidget {
  final int index;
  const TopImage({super.key, required this.index});

  @override
  State<TopImage> createState() => _TopImageState();
}

class _TopImageState extends State<TopImage> {
  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size;
    return Container(
      height: he.height * 0.3,
      width: he.width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        image: DecorationImage(
            image: NetworkImage(restaurantList[widget.index].imageUrl),
            fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Positioned(
              top: 20,
              left: 20,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 28,
                    color: kPrimaryColour,
                  ))),
          Positioned(
              top: 20,
              right: 20,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    size: 28,
                    color: kPrimaryColour,
                  ))),
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurantList[widget.index].title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  restaurantList[widget.index].category,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Rating extends StatelessWidget {
  final int index;
  const Rating({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size;
    final random = Random();
    final deliveryTime = 20 + random.nextInt(26);
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      height: he.height * .1,
      width: he.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              restaurantList[index].rating,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              "Rating",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Text(
              restaurantList[index].price,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Preparation Time: $deliveryTime min",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

class FoodDescription extends StatefulWidget {
  const FoodDescription({super.key, required this.index});
  final int index;
  @override
  State<FoodDescription> createState() => _FoodDescriptionState();
}

class _FoodDescriptionState extends State<FoodDescription> {
  bool _showFullText = false;

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      width: he.width,
      child: Column(
        children: [
          _showFullText
              ? Text(
            restaurantList[widget.index].description,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          )
              : Text(
            restaurantList[widget.index].description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          _showFullText = !_showFullText;
        });
      },
      child: Text(_showFullText ? "Show less" : "Show more"),
    );
  }
}