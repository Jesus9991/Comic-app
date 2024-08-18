import 'package:comic_app/controller/exports/exports.dart';
import 'package:comic_app/controller/exports/screen_exports.dart';
import 'package:flutter/material.dart';

/*
listas de personajes principales
*/
class ListPrincipalCharactersComponents extends StatelessWidget {
  const ListPrincipalCharactersComponents({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverList(
        delegate: SliverChildListDelegate([
      SizedBox(
        height: size.height * .4,
        width: size.width,
        child: ListView.separated(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
              top: size.height * .03,
              left: size.width * .04,
              right: size.width * .04),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          separatorBuilder: (context, index) =>
              SizedBox(width: size.width * .06),
          itemBuilder: (context, index) {
            return CardPrincipalCharacterComponents(
              id: 12,
              image:
                  'https://i.pinimg.com/736x/c5/5c/dc/c55cdca9d7684c8cf07079752e6d3350.jpg',
              name: 'sadsadsa',
              description: 'sadasdasds',
              number: '2',
              onTap: () {
                /*navega a los detalles del personajes*/
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsCharacterScreen(
                      id: 0,
                      image:
                          'https://i.pinimg.com/736x/c5/5c/dc/c55cdca9d7684c8cf07079752e6d3350.jpg',
                      name: 'sdlksadljsaljaslkasjk',
                      dateTime: 'sdsadasasssd',
                      aliases: 'sdsadas',
                      description: '32423432',
                      origin: 'hghgffh',
                      realName: 'sdssd',
                      punisher: 'sdfsdfdsdsf',
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    ]));
  }
}
