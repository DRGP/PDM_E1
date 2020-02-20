import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cups/item_cups.dart';
import 'package:practica_integradora_uno/cups/item_cups_details.dart';

class CupsPage extends StatelessWidget {
  //final List<ProductDrinks> drinksList;
  final Map productMap;
  CupsPage({
    Key key,
    @required this.productMap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop(this.productMap);
          },
        ),
        title: Text("Tazas"),
      ),
      body: ListView.builder(
        itemCount: productMap['cups'].length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ItemCupsDetails(
                    cup: productMap['cups'][index],
                    productMap: this.productMap,
                  ),
                ),
              );
            },
            child: ItemCups(
              cup: productMap['cups'][index],
              onToggle: toggleFavorite,
              itemIndex: index,
            ),
          );
        },
      ),
    );
  }

  void toggleFavorite(int i) {
    this.productMap['cups'][i].liked = !this.productMap['cups'][i].liked;
  }
}