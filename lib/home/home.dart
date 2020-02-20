import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/cart.dart';
import 'package:practica_integradora_uno/cups/cups_page.dart';
import 'package:practica_integradora_uno/drinks/drinks_page.dart';
import 'package:practica_integradora_uno/grains/grains_page.dart';
import 'package:practica_integradora_uno/home/item_home.dart';
import 'package:practica_integradora_uno/models/product.dart';
import 'package:practica_integradora_uno/models/product_cup.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';
import 'package:practica_integradora_uno/models/product_repository.dart';
import 'package:practica_integradora_uno/profile.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ProductDrinks> drinkList;
  List<ProductGrains> grainList;
  List<ProductCup> cupList;
  List<Product> cart;
  Map productMap = new Map();
  @override
  void initState() {
    drinkList = ProductRepository.loadProducts(ProductType.BEBIDAS);
    cupList = ProductRepository.loadProducts(ProductType.TAZAS);
    grainList = ProductRepository.loadProducts(ProductType.GRANO);
    productMap['drinks'] = drinkList;
    productMap['grains'] = grainList;
    productMap['cups'] = cupList;
    productMap['cart'] = cart;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => Cart(productList: productMap['cart']),
                ),
              );
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openDrinksPage,
            child: ItemHome(
              title: "Bebidas",
              image: "https://i.blogs.es/723857/cafe_como/450_1000.jpg",
            ),
          ),
          GestureDetector(
            onTap: _openGrainsPage,
            child: ItemHome(
              title: "Cafe en grano",
              image: "https://www.elplural.com/uploads/s1/34/84/2/cafe.jpeg",
            ),
          ),
          GestureDetector(
            onTap: _openCupsPage,
            child: ItemHome(
              title: "Tazas",
              image: "https://walkingmexico.com/wp-content/uploads/2015/02/Viajografi%CC%81a-Las-7-mejores-tazas-de-cafe%CC%81-en-el-D.F.-1.jpg",
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openDrinksPage() async {
    // TODO: completar en navigator pasando los parametros a la pagina de DrinksPage

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return DrinksPage(
            productMap: this.productMap,
          );
        },
      ),
    ).then((updatedMap) {
      productMap = updatedMap;
    });
  }

  Future<void> _openGrainsPage() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return GrainsPage(
            productMap: this.productMap,
          );
        },
      ),
    ).then((updatedMap) {
      productMap = updatedMap;
    });
  }

  Future<void> _openCupsPage() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return CupsPage(
            productMap: this.productMap,
          );
        },
      ),
    ).then((updatedMap) {
      productMap = updatedMap;
    });
  }
}
