import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/product.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';

class ItemDrinksDetails extends StatefulWidget {
  final ProductDrinks drink;
  final Map productMap;
  ItemDrinksDetails({Key key, @required this.drink, @required this.productMap})
      : super(key: key);

  @override
  _ItemDrinksDetailsState createState() => _ItemDrinksDetailsState();
}

class _ItemDrinksDetailsState extends State<ItemDrinksDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drink.productTitle),
      ),
      body: Column(
        children: <Widget>[
          Image.network(widget.drink.productImage),
          Text(widget.drink.productDescription),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    addToCart();
                  },
                  child: Text('AGREGAR AL CARRITO')),
              FlatButton(onPressed: () {}, child: Text('COMPRAR AHORA')),
            ],
          ),
        ],
      ),
    );
  }

  void addToCart() {
    if (widget.productMap['cart'] == null) {
      widget.productMap['cart'] = new List<Product>();
      widget.productMap['cart'].add(Product.fromDrink(widget.drink));
    } else if (widget.productMap['cart']
        .any((product) => product.title == widget.drink.productTitle)) {
      widget
          .productMap['cart'][widget.productMap['cart'].indexWhere(
              (product) => product.title == widget.drink.productTitle)]
          .amount++;
    } else
      widget.productMap['cart'].add(Product.fromDrink(widget.drink));
  }
}
