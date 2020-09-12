import 'dart:async';

class Item {
  final String brand;
  final String category;
  final int curtime;
  final String description;
  final String image;
  final String name;
  final int price;
  final int quantity;

  Item(
      {this.brand,
      this.category,
      this.curtime,
      this.description,
      this.image,
      this.name,
      this.price,
      this.quantity});
}

class CartItemsBloc {
  final cartStreamController = StreamController.broadcast();
  double total = 0.0;
  Stream get getStream => cartStreamController.stream;

  Map<String, Item> items = {};
  final Map allItems = {'cart items': []};

  void addToCart(String brand, String category, int curtime, String description,
      String image, String name, int price) {
    if (items.containsKey(curtime.toString())) {
      items.update(
        curtime.toString(),
        (old) => Item(
            brand: old.brand,
            category: old.category,
            curtime: old.curtime,
            description: old.description,
            image: old.image,
            name: old.name,
            price: old.price,
            quantity: old.quantity + 1),
      );
    } else {
      items.putIfAbsent(
          curtime.toString(),
          () => Item(
                brand: brand,
                category: category,
                curtime: curtime,
                description: description,
                image: image,
                name: name,
                price: price,
                quantity: 1,
              ));
    }
    cartStreamController.sink.add(items);
  }

  void removeFromCart(id) {
    items.removeWhere((key, value) => key == id.toString());
    cartStreamController.sink.add(items);
  }

  void removeSingleItem(String id) {
    items.update(
        id,
        (old) => Item(
              brand: old.brand,
              category: old.category,
              curtime: old.curtime,
              description: old.description,
              image: old.image,
              name: old.name,
              price: old.price,
              quantity: old.quantity - 1,
            ));
  }

  void removeAll() {
    items.clear();
    cartStreamController.sink.add(items);
  }

  double calculate() {
    var total = 0.0;
    items.forEach((key, cart) => total += cart.price * cart.quantity);
    return total;
  }

  void dispose() {
    cartStreamController.close();
  }
}

final bloc = CartItemsBloc();
