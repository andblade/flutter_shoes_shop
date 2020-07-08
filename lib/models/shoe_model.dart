import 'package:flutter/material.dart';

// Definição dos atributos
class ShoeModel {
  final String name;
  final double price;
  final String desc;
  final Color color;
  final String brand;
  final String imgPath;

  // Instanciando os atributos
  ShoeModel({
    this.name,
    this.price,
    this.desc,
    this.color,
    this.brand,
    this.imgPath
  });

  // Listando cada atributo com seus valores para adicionar em cada item
  static List<ShoeModel> list = [
    ShoeModel(
      name: "Nike Air Jordan 1 Retro High",
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip",
      price: 184,
      color: Colors.blue,
      brand: "Nike",
      imgPath: "2.png",
    ),

    ShoeModel(
      name: "Converse X OPI Chuck Taylor",
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip",
      price: 123,
      color: Colors.yellow,
      brand: "Converse",
      imgPath: "1.png",
    ),

    ShoeModel(
      name: "Nike Air Jordan 1 Retro High",
      desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip",
      price: 135,
      color: Colors.red,
      brand: "Nike",
      imgPath: "3.png",
    ),
  ];
}