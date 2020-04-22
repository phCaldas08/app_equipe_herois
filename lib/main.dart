import 'package:flutter/material.dart';
import 'package:nac_rm_81674/screens/detalhe_heroi.dart';
import 'package:nac_rm_81674/screens/lista_herois.dart';

void main() => runApp(SuperHeroApp());

class SuperHeroApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      theme: ThemeData.light(),
      routes: {
        "/": (context) => ListaHerois(),
        "/detalhe_heroi": (context) => DetalheHeroi(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
