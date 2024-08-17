import 'package:comic_app/controller/exports/exports.dart';
import 'package:comic_app/controller/exports/screen_exports.dart';
import 'package:flutter/material.dart';

/*
lista de comics recientes para el home
*/
class RecientComicsHomeComponents extends StatefulWidget {
  const RecientComicsHomeComponents({super.key});

  @override
  State<RecientComicsHomeComponents> createState() =>
      _RecientComicsHomeComponentsState();
}

class _RecientComicsHomeComponentsState
    extends State<RecientComicsHomeComponents> {
  List<String> imagesList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9MIZFP37mKIZpG3tl5baqPkd82tYXFGQmzw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6VQwhWLFiCc0NA6Uw9KMJI7I2Wq4l2hhytA&s',
    'https://cdn.marvel.com/content/1x/hulk2023014_weaponxtraction.jpg',
  ];

  List<int> idsList = [15, 32, 34];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .3,
      width: size.width,
      child: ListView.separated(
        //Todo: conectar con api para obtener una lista de 10 comics
        itemCount: imagesList.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: size.width * .05),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        separatorBuilder: (context, index) => SizedBox(width: size.width * .04),
        itemBuilder: (context, index) {
          return CardComicsHomeComponents(
            id: idsList[index],
            name: 'Comics name',
            date: 'Marzo 30 1995',
            image: imagesList[index],
            onTap: () {
              /*navega ver los detalles del comic*/
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsComicsScreen(
                      id: idsList[index],
                      image: imagesList[index],
                    ),
                  ));
            },
          );
        },
      ),
    );
  }
}
