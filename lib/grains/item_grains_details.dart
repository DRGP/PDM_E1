import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/product.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';

class ItemGrainsDetails extends StatefulWidget {
  final ProductGrains grain;
  final Map productMap;
  ItemGrainsDetails({
    Key key,
    @required this.grain,
    @required this.productMap
  }) : super(key: key);

  @override
  _ItemGrainsDetailsState createState() => _ItemGrainsDetailsState();
}

class _ItemGrainsDetailsState extends State<ItemGrainsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.grain.productTitle),
      ),
      body: Column(
        children: <Widget>[
          Image.network(widget.grain.productImage),
          Text(widget.grain.productDescription),
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
      widget.productMap['cart'].add(Product.fromGrains(widget.grain));
    }
    else if (widget.productMap['cart'].any((product) => product.title == widget.grain.productTitle)) {
      widget.productMap['cart'][widget.productMap['cart'].indexWhere((product) => product.title == widget.grain.productTitle)].amount ++;
    }
    else widget.productMap['cart'].add(Product.fromGrains(widget.grain)); 
  }
}