import 'package:flutter/material.dart';
import 'package:nac_rm_81674/models/heroi.dart';

class DetalheHeroi extends StatelessWidget {
  TextStyle _textStyle(double fontSize) {
    return TextStyle(
        fontSize: fontSize, fontWeight: FontWeight.bold);
  }

  @override
  Widget build(BuildContext context) {
    Heroi heroi = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Color.fromRGBO(53,54, 58, 1),
      body: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(
                height: MediaQuery.of(context).size.height),
            child: Image.network(
              heroi.imagemDetalhe,
              fit: BoxFit.fitHeight,
            ),
          ),
          cardHeroi(context, heroi),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 32, 0, 0),
              child: FloatingActionButton(
                onPressed: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back),
              ),
            ),
          )
        ],
      ),
    );
  }

  Align cardHeroi(BuildContext context, Heroi heroi) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.white,
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      heroi.nome,
                      style: _textStyle(20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    child: ListTile(
                      title: Text("Status", style: _textStyle(16)),
                      subtitle: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            statusHeroi("Poder", heroi.poder),
                            statusHeroi("Agilidade", heroi.agilidade),
                            statusHeroi("Força", heroi.forca),
                            statusHeroi("Velocidade", heroi.velocidade),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding statusHeroi(String label, double valor) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: 200,
        child: ListTile(
          title: Text(label,
              style: TextStyle(
                  fontFamily: "Helvetica, Arial, sans-serif")),
          subtitle: Container(
            height: 10,
            width: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: LinearProgressIndicator(
                value: valor,
                backgroundColor: Colors.black,
                valueColor: AlwaysStoppedAnimation(Colors.green),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
