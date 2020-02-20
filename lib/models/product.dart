import 'package:practica_integradora_uno/models/product_cup.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';

class Product {
  String title;
  String image;
  String details;
  double price;
  int amount = 1;
  bool liked;

  Product.fromDrink (ProductDrinks drink) {
    this.title = drink.productTitle;
    this.image = drink.productImage;
    this.price = drink.productPrice;
    this.liked = drink.liked;
    switch (drink.productSize) {
      case ProductSize.CH: {
        this.details = 'Tamaño chico';
      }        
      break;
      case ProductSize.M: {
        this.details = 'Tamaño mediano';
      }
      break;
      case ProductSize.G: {
        this.details = 'Tamaño grande';
      }
      break;
      default: {
        this.details = '';
      }
      break;
    }
  }

  Product.fromGrains (ProductGrains grains) {
    this.title = grains.productTitle;
    this.image = grains.productImage;
    this.price = grains.productPrice;
    this.liked = grains.liked;
    switch (grains.productWeight) {
      case ProductWeight.CUARTO: {
        this.details = '.25 KG';
      }        
      break;
      case ProductWeight.KILO: {
        this.details = '1 KG';
      }
      break;
      default: {
        this.details = '';
      }
      break;
    }
  }

  Product.fromCups (ProductCup cup) {
    this.title = cup.productTitle;
    this.image = cup.productImage;
    this.price = cup.productPrice;
    this.liked = cup.liked;
    switch (cup.productColor) {
      case ProductColor.WHITE: {
        this.details = 'Color: blanco';
      }        
      break;
      case ProductColor.BLACK: {
        this.details = 'Color: negro';
      }
      break;
      default: {
        this.details = '';
      }
      break;
    }
  }
}