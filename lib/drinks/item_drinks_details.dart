import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/colors.dart';
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
          SizedBox(
            height: 15,
          ),
          Text(widget.drink.productDescription),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  setState(() {
                    widget.drink.productSize = ProductSize.CH;
                    widget.drink.productPrice =
                        widget.drink.productPriceCalculator();
                  });
                },
                child: Text('CH'),
                color: widget.drink.productSize == ProductSize.CH
                    ? cuppingSolidOrange
                    : cuppingLightGray,
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    widget.drink.productSize = ProductSize.M;
                    widget.drink.productPrice =
                        widget.drink.productPriceCalculator();
                  });
                },
                child: Text('M'),
                color: widget.drink.productSize == ProductSize.M
                    ? cuppingSolidOrange
                    : cuppingLightGray,
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    widget.drink.productSize = ProductSize.G;
                    widget.drink.productPrice =
                        widget.drink.productPriceCalculator();
                  });
                },
                child: Text('G'),
                color: widget.drink.productSize == ProductSize.G
                    ? cuppingSolidOrange
                    : cuppingLightGray,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                '\$ ${widget.drink.productPrice}',
                textAlign: TextAlign.right,
              ),
            ),
          ),
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
