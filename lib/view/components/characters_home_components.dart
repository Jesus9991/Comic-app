import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';

/*
lista de personajes en el home
*/
class CharactersHomeComponents extends StatefulWidget {
  const CharactersHomeComponents({super.key});

  @override
  State<CharactersHomeComponents> createState() =>
      _CharactersHomeComponentsState();
}

class _CharactersHomeComponentsState extends State<CharactersHomeComponents> {
  List<String> imagesList = [
    'https://cdn.marvel.com/content/1x/savwolvinfc2024001_resized.jpg',
    'https://http2.mlstatic.com/D_NQ_NP_731572-CBT76048785527_042024-O.webp',
    'https://cdn.marvel.com/content/1x/hulk2023014_weaponxtraction.jpg',
  ];

  List<int> idsList = [12, 22, 33];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * .3,
      width: size.width,
      child: ListView.separated(
        //Todo: conectar con api para obtener una lista de 10 personajes
        itemCount: imagesList.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: size.width * .05),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        separatorBuilder: (context, index) => SizedBox(width: size.width * .04),
        itemBuilder: (context, index) {
          return CardComicsHomeComponents(
            id: idsList[index],
            name: 'Characters name',
            date: 'Marzo 30 1995',
            image: imagesList[index],
            onTap: () {},
          );
        },
      ),
    );
  }
}
