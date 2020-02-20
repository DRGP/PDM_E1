import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/colors.dart';
import 'package:practica_integradora_uno/models/product_cup.dart';

class ItemCups extends StatefulWidget {
  final ProductCup cup;
  final ValueChanged<int> onToggle;
  final int itemIndex;
  ItemCups({
    Key key,
    @required this.cup,
    @required this.onToggle,
    @required this.itemIndex,
  }) : super(key: key);

  @override
  _ItemCupsState createState() => _ItemCupsState();
}

class _ItemCupsState extends State<ItemCups> {
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
                  "${widget.cup.productTitle} \n Precio: ${widget.cup.productPrice}",
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
                  "${widget.cup.productImage}",
                  fit: BoxFit.fitHeight,
                  height: 180,
                ),
              ),
              flex: 3,
            ),
            IconButton(
                icon: Icon(Icons.favorite),
                color: widget.cup.liked ? cuppingSolidBlue : cuppingLightGray,
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
