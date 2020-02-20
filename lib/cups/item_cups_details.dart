import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/product.dart';
import 'package:practica_integradora_uno/models/product_cup.dart';

class ItemCupsDetails extends StatefulWidget {
  final ProductCup cup;
  final Map productMap;
  ItemCupsDetails({
    Key key,
    @required this.cup,
    @required this.productMap
  }) : super(key: key);

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
          Text(widget.cup.productDescription),
          ButtonBar(
            children: <Widget>[
              FlatButton(onPressed: () {
                addToCart();
              }, child: Text('AGREGAR AL CARRITO')),
              FlatButton(onPressed: () {}, child: Text('COMPRAR AHORA')),
            ],
          ),
        ],
      ),
    );
  }
  void addToCart () {
    if (widget.productMap['cart'] == null) {
      widget.productMap['cart'] = new List<Product> ();
      widget.productMap['cart'].add(Product.fromCups(widget.cup));
    }
    else if (widget.productMap['cart'].any((product) => product.title == widget.cup.productTitle)) {
      widget.productMap['cart'][widget.productMap['cart'].indexWhere((product) => product.title == widget.cup.productTitle)].amount ++;
    }
    else widget.productMap['cart'].add(Product.fromCups(widget.cup)); 
  }
}
