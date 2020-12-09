//import 'package:composta_app/tools/carouselview.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flare_flutter/flare_actor.dart';
//import 'package:flare_flutter/flare_actor.dart';
//import 'package:carousel_widget/carousel_widget.dart';
//import 'package:composta_app/tools/carouselview.dart';
//import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
//import 'package:composta_app/tools/buttonimage.dart';
//import 'package:composta_app/tools/carouselcontent.dart';

// ignore: must_be_immutable
class Body extends StatefulWidget {
  @override
  State createState() => new _BodyState();
}

class _BodyState extends State<Body> {
  int _opc = 1;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List cardList1 = [
      buildItem(context, "1", "Cavar un orificio de poca profundidad (30cm).",
          Animation(file: "lib/assets/img/contenedor_20L.flr", animation: "")),
      buildItem(
          context,
          "2",
          "Colocar una caja sin fondo, o colocar 4 pallets simulando la caja, con el fin de que el material esté en contacto con el suelo.",
          Animation(
              file: "lib/assets/img/Control_Composta.flr",
              animation: "Control_Corriendo")),
      buildItem(
          context,
          "3",
          "Agregar los residuos previamente picados o cortados en trozos pequeños",
          Animation(
              file: "lib/assets/img/Control_Composta.flr",
              animation: "Control_Corriendo")),
      buildItem(
          context,
          "4",
          "Agregar una capa de materia café (vegetación seca) de 10 cm, en el caso de la caja hecha con pallets, este resulta el equivalente a 4 cubetas de 20 lt",
          Animation(
              file: "lib/assets/img/Control_Composta.flr",
              animation: "Control_Corriendo")),
      buildItem(
          context,
          "5",
          "Agregar una capa de material húmedo (vegetación verde) de 10 cm",
          Animation(
              file: "lib/assets/img/Control_Composta.flr",
              animation: "Control_Corriendo")),
      buildItem(
          context,
          "6",
          "Agregar una capa más delgada de suelo.",
          Animation(
              file: "lib/assets/img/Control_Composta.flr",
              animation: "Control_Corriendo")),
      buildItem(
          context,
          "7",
          "Posteriormente alternar capas de material café y residuos orgánicos.\nNota: procurar que la última capa sea de material café",
          Animation(
              file: "lib/assets/img/Control_Composta.flr",
              animation: "Control_Corriendo")),
    ];
    List cardList2 = [
      buildItem(
          context,
          "1",
          "Se rewuiere una malla metálica 1m * 3m.",
          Animation(
              file: "lib/assets/img/Control_Composta.flr",
              animation: "Control_Corriendo")),
      buildItem(
          context,
          "2",
          "Se requiere 3 o 4 postes de madera o de metal de poco más de 1m, preferentemente",
          Animation(
              file: "lib/assets/img/Control_Composta.flr",
              animation: "Control_Corriendo")),
      buildItem(
          context,
          "3",
          "Se requiere alambres de sujeción.",
          Animation(
              file: "lib/assets/img/Control_Composta.flr",
              animation: "Control_Corriendo")),
      buildItem(
          context,
          "4",
          "Unir la malla de alambre a los postes, con el alambre de sujeción o con clavos, formando un cilindro o un cubo.",
          Animation(
              file: "lib/assets/img/Control_Composta.flr",
              animation: "Control_Corriendo")),
      buildItem(
          context,
          "5",
          "Colocar el cilindro en el jardín, colocando una capa de materia café (vegetación seca) seguida de una capa de materia húmeda (vegetación verde y residuos orgánicos), llenar el cilindro intercalando capas.",
          Animation(
              file: "lib/assets/img/Control_Composta.flr",
              animation: "Control_Corriendo")),
    ];
    getcardList() {
      if (_opc == 1)
        return cardList1;
      else
        return cardList2;
    }

    List<T> map<T>(List list, Function handler) {
      List<T> result = [];
      for (var i = 0; i < list.length; i++) {
        result.add(handler(i, list[i]));
      }
      return result;
    }

    buildImageButton(String image, String text, int opc) {
      final boxContent = new Container(
        margin: new EdgeInsets.all(20),
        constraints: new BoxConstraints.expand(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Image(
              image: new AssetImage(image),
              height: 50.0,
              width: 50.0,
            ),
            new Container(height: 2.0),
            Text(
              text,
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );

      getBox() {
        return new Container(
            child: boxContent,
            height: 130.0,
            width: 130.0,
            margin: new EdgeInsets.all(10),
            decoration: new BoxDecoration(
              color: (_opc == opc) ? Colors.orange : Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(8.0),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: new Offset(0.0, 10.0),
                ),
              ],
            ));
      }

      return GestureDetector(
          onTap: () {
            setState(() {
              _opc = opc;
              _currentIndex = 0;
              print(_opc);
            });

            //option = opc;
          },
          child: new Stack(children: <Widget>[
            getBox(),
          ]));
    }

    return Container(
      child: ListView(
        padding: const EdgeInsets.all(5),
        children: <Widget>[
          Text(
            "¿Donde desea compostar?",
            style: TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
          Text(
            "Seleccione una opción:",
            style: TextStyle(fontSize: 20),
          ),
          //Hacer dinamico esto
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildImageButton("lib/assets/img/plant.png", "Hoyo", 1),
                buildImageButton(
                    "lib/assets/img/plant.png", "Malla métalica", 2),
              ],
            ),
          ),
          Text(
            "INSTRUCCIONES:",
            style: TextStyle(fontSize: 20),
          ),
          CarouselSlider(
            height: 400.0,
            autoPlay: false,
            aspectRatio: 2.0,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: getcardList().map((card) {
              return Builder(builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: Colors.white,
                    child: card,
                  ),
                );
              });
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(getcardList(), (index, url) {
              return Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.green : Colors.grey,
                ),
              );
            }),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.transparent),
                  ),
                  child: const Text('Anterior', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                RaisedButton(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.green),
                  ),
                  child: const Text('Siguiente',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/NewCompost4');
                  },
                ),
              ]),
        ],
      ),
    );
  }
}

class Animation {
  String file;
  String animation;
  Animation({this.file, this.animation});
}

Widget buildItem(BuildContext context, String number, String instruction,
    Animation animation) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            height: 220,
            child: FlareActor(animation.file, animation: animation.animation)),
        Flexible(
            child: Text(instruction,
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.black, fontSize: 17.0))),
      ],
    ),
  );
}
