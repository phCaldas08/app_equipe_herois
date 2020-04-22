import 'package:flutter/material.dart';
import 'package:nac_rm_81674/models/heroi.dart';
import 'package:nac_rm_81674/repository/heroi_repository.dart';

class ListaHerois extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateListaHerois();
  }
}

class StateListaHerois extends State<ListaHerois> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(53,54, 58, 1),
      body: Stack(
        children: <Widget>[
          Image.network(
              "https://i.pinimg.com/564x/36/ea/bc/36eabc6278e28f162b392ddb2c46370a.jpg",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill),
          Column(
            children: <Widget>[
              minhaEquipe(context),
              listaHerois(),
            ],
          ),
        ],
      ),
    );
  }

  Expanded minhaEquipe(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.fromLTRB(24, 36, 24, 0),
              child: Text(
                "Minha Equipe",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 90),
                child: FutureBuilder<List<Heroi>>(
                  future: HeroiRepository.getInstance()
                      .findQueryAsync((h) => h.integranteEquipe),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) 
                      if (snapshot.data.isNotEmpty)
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.06,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) => cardHeroiEquipe(
                              context,
                              snapshot.data[index],
                            ),
                          ),
                        );
                      else
                        return Center(
                          child: Text("Sua equipe está vazia!"),
                        );
                    else
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cardHeroiEquipe(BuildContext context, Heroi heroi) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            "/detalhe_heroi",
            arguments: heroi,
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: <Widget>[
              Image.network(
                heroi.imagemDetalhe,
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width * 0.65,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buttonAction(
                      () {
                        setState(() {
                          heroi.integranteEquipe = false;
                        });
                      },
                      Icons.remove,
                      Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listaHerois() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: FutureBuilder<List<Heroi>>(
            future: HeroiRepository.getInstance()
                .findQueryAsync((h) => !h.integranteEquipe),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data.isNotEmpty)
                  return ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemBuilder: (BuildContext ctx, int index) {
                      return cardListaHeroi(snapshot.data[index]);
                    },
                    itemCount: snapshot.data.length,
                  );
                else
                  return Center(
                    child: Text(
                      "Nenhum herói disponível!",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Card cardListaHeroi(Heroi heroi) {
    return Card(
      color: Colors.grey,
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: 100,
            child: ClipRRect(
              child: Image.network(
                heroi.imagemCard,
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          SizedBox(
            height: 100,
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, "/detalhe_heroi",
                    arguments: heroi);
              },
              title: Text(
                heroi.nome,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: buttonAction(
                  () {
                    setState(() {
                      heroi.integranteEquipe = true;
                    });
                  },
                  Icons.add,
                  Colors.lightGreen,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buttonAction(Function onPressed, IconData iconData, Color color) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: Container(
        height: 34,
        width: 34,
        child: RaisedButton(
          onPressed: onPressed,
          color: color,
          child: Icon(
            iconData,
            color: Colors.white,
          ),
          padding: EdgeInsets.all(4),
        ),
      ),
    );
  }
}
