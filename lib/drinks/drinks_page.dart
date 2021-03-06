import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/drinks/item_drinks.dart';
import 'package:practica_integradora_uno/drinks/item_drinks_details.dart';

class DrinksPage extends StatelessWidget {
  //final List<ProductDrinks> drinksList;
  final Map productMap;
  DrinksPage({
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
        title: Text("Bebidas"),
      ),
      body: ListView.builder(
        itemCount: productMap['drinks'].length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ItemDrinksDetails(
                    drink: productMap['drinks'][index],
                    productMap: this.productMap,
                  ),
                ),
              );
            },
            child: ItemDrinks(
              drink: productMap['drinks'][index],
              onToggle: toggleFavorite,
              itemIndex: index,
            ),
          );
        },
      ),
    );
  }

  void toggleFavorite(int i) {
    this.productMap['drinks'][i].liked = !this.productMap['drinks'][i].liked;
  }
}
