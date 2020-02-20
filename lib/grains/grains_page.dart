import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/grains/item_grains.dart';

import 'item_grains_details.dart';

class GrainsPage extends StatelessWidget {
  final Map productMap;
  GrainsPage({
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
        title: Text("Café en grano"),
      ),
      body: ListView.builder(
        itemCount: productMap['grains'].length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ItemGrainsDetails(
                    grain: productMap['grains'][index],
                    productMap: this.productMap,
                  ),
                ),
              );
            },
            child: ItemGrains(
              grain: productMap['grains'][index],
              onToggle: toggleFavorite,
              itemIndex: index,
            ),
          );
        },
      ),
    );
  }

  void toggleFavorite(int i) {
    this.productMap['grains'][i].liked = !this.productMap['grains'][i].liked;
  }
}