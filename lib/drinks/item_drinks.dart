import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/colors.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';

class ItemDrinks extends StatefulWidget {
  final ProductDrinks drink;
  final ValueChanged<int> onToggle;
  final int itemIndex;
  ItemDrinks({
    Key key,
    @required this.drink,
    @required this.onToggle,
    @required this.itemIndex,
  }) : super(key: key);

  @override
  _ItemDrinksState createState() => _ItemDrinksState();
}

class _ItemDrinksState extends State<ItemDrinks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.all(8.0),
        color: Colors.grey[300],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Text(
                  "${widget.drink.productTitle} \n Precio: ${widget.drink.productPrice}",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              flex: 2,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                ),
                child: Image.network(
                  "${widget.drink.productImage}",
                  fit: BoxFit.fitHeight,
                  height: 180,
                ),
              ),
              flex: 3,
            ),
            IconButton(
                icon: Icon(Icons.favorite),
                color: widget.drink.liked ? cuppingSolidBlue : cuppingLightGray,
                onPressed: () {
                  setState(() {
                    widget.onToggle(widget.itemIndex);
                  });
                }),
          ],
        ),
      ),
    );
  }
}
