import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/colors.dart';
import 'package:practica_integradora_uno/models/product.dart';
import 'package:practica_integradora_uno/models/product_cup.dart';

class ItemCupsDetails extends StatefulWidget {
  final ProductCup cup;
  final Map productMap;
  ItemCupsDetails({Key key, @required this.cup, @required this.productMap})
      : super(key: key);

  @override
  _ItemCupsDetailsState createState() => _ItemCupsDetailsState();
}

class _ItemCupsDetailsState extends State<ItemCupsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cup.productTitle),
      ),
      body: Column(
        children: <Widget>[
          Image.network(widget.cup.productImage),
          SizedBox(
            height: 15,
          ),
          Text(widget.cup.productDescription),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  setState(() {
                    widget.cup.productColor = ProductColor.WHITE;
                  });
                },
                child: Text('Color: blanco'),
                color: widget.cup.productColor == ProductColor.WHITE
                    ? cuppingSolidOrange
                    : cuppingLightGray,
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    widget.cup.productColor = ProductColor.BLACK;
                  });
                },
                child: Text('Color: negro'),
                color: widget.cup.productColor == ProductColor.BLACK
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
                '\$ ${widget.cup.productPrice}',
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
      widget.productMap['cart'].add(Product.fromCups(widget.cup));
    } else if (widget.productMap['cart']
        .any((product) => product.title == widget.cup.productTitle)) {
      widget
          .productMap['cart'][widget.productMap['cart'].indexWhere(
              (product) => product.title == widget.cup.productTitle)]
          .amount++;
    } else
      widget.productMap['cart'].add(Product.fromCups(widget.cup));
  }
}
