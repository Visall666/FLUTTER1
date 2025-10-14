void main() {
  // Map of pizza prices
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  // Example order
  const order = ['margherita', 'pepperoni', 'pineapple'];

  final totalPricesOrder = order.fold(0.0, (sum, pizza) {
    if(pizzaPrices.containsKey(pizza)) {
      return sum + pizzaPrices[pizza]!;
    } else{
      print('pineapple pizza is not on the menu.');
      return sum;
    }
  });
  print('The total prices order is \$$totalPricesOrder');
}
