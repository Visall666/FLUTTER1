enum DeliveryType  { DELIVERY, PICKUP }

class Product {
  int _code;
  String _name;
  double _price;

  Product(this._code, this._name, this._price);

  // GETTER
  int get code => _code;
  String get name => _name;
  double get price => _price;
}

class OrderItem {
  int _quantity;
  Product _product;

  OrderItem(this._quantity, this._product);

  // GETTER
  int get quantity => _quantity;
  Product get product => _product;

  double totalAmount() {
    return product.price * quantity;
  }
}

class Order {
  int _id;
  List<OrderItem> _items;
  Address? _address;
  DeliveryType _type;

  Order(this._id, this._address, this._items, this._type);

  // GETTER
  int get id => _id;
  List<OrderItem> get items => _items;
  Address? get address => _address;
  DeliveryType get type => _type;

  double totalAmount() {
    double sum = 0;
    for (var item in items){
      sum += item.totalAmount();
    }
    return sum;
  }
}

class Address {
  String _street;
  String _city;

  Address(this._city, this._street);

  // GETTER
  String get street => _street;
  String get city => _city;
}

main() {
  var p1 = Product(100, "Milk", 1.5);
  var p2 = Product(101, "Banana", 1.0);

  var item1 = OrderItem(3, p1);
  var item2 = OrderItem(2, p2); 

  var address = Address("Phnom Penh", "St. 2004");
  var order = Order(1, address, [item1, item2], DeliveryType.DELIVERY);

  print("Total: \$${order.totalAmount()}"); 
}