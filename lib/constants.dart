import 'package:flutter/material.dart';

const kPrimaryColour= Color(0xFF6F35A5);
const kPrimaryLightColour= Color(0xFFF1E6FF);

const double defaultPadding=16.0;



class Restaurants {
  String imageUrl, title, locations, rating, description,price;
  int id;
  //int id;

  Restaurants(
      {required this.imageUrl,
        required this.title,
        required this.id,
        required this.locations,
        required this.rating,
        required this.description,
        required this.price});
}

List<Restaurants> restaurantList = [
  Restaurants(
      title: "Methi Laadoo",
      id: 1,
      locations: "Laadoo",
      description:"Crafted with a powerhouse of ingredients like fenugreek seeds, haleem, coconut crush, dates, jaggery, fox nuts [lotus seeds], poppy seed, cardamom, cashew, almond and desi ghee, this laddu is a blend of traditional goodness and nutritional richness.",
      price: "899/Kg",
      rating: "4.4",
      imageUrl:
      "https://i.postimg.cc/7YrZD9Lm/Whats-App-Image-2024-09-06-at-21-38-56-08401868.jpg"),
  Restaurants(
    title: "Rawa Laadoo",
    id: 2,
    locations: "Laadoo",
    description:
    "Domino's Pizza is a popular pizza restaurant chain that offers a wide selection of delicious pizzas, sides, and desserts. With a focus on fresh, high-quality ingredients, Domino's Pizza creates pizzas that are both flavorful and visually stunning. From traditional pizzas to innovative fusion dishes, the menu at Domino's Pizza offers something for every palate. The restaurant's contemporary yet inviting ambiance, combined with attentive service, make it a popular destination for food lovers in search of a memorable dining experience",
    price: "799/Kg",
    rating: "3.8",
    imageUrl:
    "https://i.postimg.cc/fRwWSbmd/Whats-App-Image-2024-09-06-at-21-38-56-d86662ec.jpg",
  ),
  Restaurants(
    title: "Boondi Laadoo",
    id: 3,
    locations: "Laadoo",
    description:
    "Enjoy our Homemade Boondi Ladoo, crafted from premium gram flour, nutmeg-refined oil, and fine sugar. Each ladoo is enriched with crunchy cashews, sweet raisins, and a hint of aromatic cardamom. A perfect blend of traditional flavors, freshly prepared for a wholesome and delightful treat.",
    price: "699/Kg",
    rating: "4.1",
    imageUrl:
    "https://i.postimg.cc/W1XNGPwH/Whats-App-Image-2024-09-06-at-21-38-56-e0ca3b99.jpg",
  ),
  Restaurants(
    title: "Churma Laadoo",
    id: 4,
    locations: "Laadoo",
    description:
    "Savor the goodness of our Homemade Ladoo, made from wholesome wheat flour, desi ghee, and non-refined jaggery. Enriched with cashews, almonds, semolina, and besan, these ladoos are delicately flavored with nutmeg and cardamom for a truly authentic taste. Freshly prepared to offer a rich and nutritious treat for every occasion.",
    price: "699/Kg",
    rating: "3.2",
    imageUrl: "https://i.postimg.cc/zXwXfhb5/Whats-App-Image-2024-09-06-at-21-38-56-e3a590f6.jpg",
  ),
];

class FoodItems {
  String imageUrl, name;

  FoodItems({
    required this.imageUrl,
    required this.name,
  });
}

List<FoodItems> foodItemList = [
  FoodItems(
      name: "Healthy",
      imageUrl:
      "https://png.pngtree.com/png-vector/20231019/ourmid/pngtree-beautiful-food-bowl-png-image_10229882.png"),
  FoodItems(
      name: "Pizza",
      imageUrl:
      "https://png.pngtree.com/png-clipart/20231019/original/pngtree-pizza-png-with-ai-generated-png-image_13357740.png"),
  FoodItems(
      name: "Burger",
      imageUrl:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA_BJwyjsUiqs8yXWtgL-eSWzNZ--CdEXbXA&s"),
  FoodItems(
      name: "Rolls",
      imageUrl:
      "https://png.pngtree.com/png-vector/20230918/ourmid/pngtree-asian-food-spring-rolls-3d-illustration-png-image_10126916.png"),
  FoodItems(
      name: "Biryani",
      imageUrl:
      "https://png.pngtree.com/png-clipart/20230522/original/pngtree-chicken-biryani-front-view-png-image_9167532.png"),
  FoodItems(
      name: "Paneer",
      imageUrl:
      "https://png.pngtree.com/png-clipart/20230912/original/pngtree-paneer-butter-masala-png-image_11051765.png"),
  FoodItems(
      name: "Chicken",
      imageUrl:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8-B93ht2FH9tPUu82laGoqUyFqCCblwQ-pA&s"),
  FoodItems(
      name: "Healthy",
      imageUrl:
      "https://png.pngtree.com/png-vector/20231019/ourmid/pngtree-beautiful-food-bowl-png-image_10229882.png"),
  FoodItems(
      name: "Pizza",
      imageUrl:
      "https://png.pngtree.com/png-clipart/20231019/original/pngtree-pizza-png-with-ai-generated-png-image_13357740.png"),
  FoodItems(
      name: "Burger",
      imageUrl:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA_BJwyjsUiqs8yXWtgL-eSWzNZ--CdEXbXA&s"),
  FoodItems(
      name: "Rolls",
      imageUrl:
      "https://png.pngtree.com/png-vector/20230918/ourmid/pngtree-asian-food-spring-rolls-3d-illustration-png-image_10126916.png"),
  FoodItems(
      name: "Biryani",
      imageUrl:
      "https://png.pngtree.com/png-clipart/20230522/original/pngtree-chicken-biryani-front-view-png-image_9167532.png"),
  FoodItems(
      name: "Paneer",
      imageUrl:
      "https://png.pngtree.com/png-clipart/20230912/original/pngtree-paneer-butter-masala-png-image_11051765.png"),
  FoodItems(
      name: "Chicken",
      imageUrl:
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8-B93ht2FH9tPUu82laGoqUyFqCCblwQ-pA&s"),
];

class Restaurants1 {
  String  title, price;

  Restaurants1(
      {
        required this.title,

        required this.price});
}

List<Restaurants1> restaurantList1 = [
  Restaurants1(
    title: "250g",
    price: "50",),
  Restaurants1(
    title: "500g",
    price: "100",),
  Restaurants1(
    title: "1Kg",
    price: "100",),
];

class Restaurants6 {
  String title, price;

  Restaurants6({required this.title, required this.price});
}

List<Restaurants6> restaurantList6= [
  Restaurants6(title: "Veg Burger", price: "150"),
  Restaurants6(title: "Chicken Burger", price: "250"),
  Restaurants6(title: "Paneer Burger", price: "250"),
  Restaurants6(title: "Veg Burger", price: "350"),
  Restaurants6(title: "Chicken Burger", price: "250"),
  Restaurants6(title: "Paneer Burger", price: "250"),
];