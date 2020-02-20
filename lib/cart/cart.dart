import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/item_cart.dart';

class Cart extends StatefulWidget {
  final List<dynamic> productList;
  Cart({
    Key key,
    @required this.productList,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de compras'),
      ),
      body: ListView.builder(
        itemCount: (widget.productList == null)? 0: widget.productList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemCart(
            product: widget.productList[index],
          );
        },
      ),
    );
  }
}
