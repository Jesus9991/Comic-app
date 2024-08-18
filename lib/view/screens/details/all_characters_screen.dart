import 'package:comic_app/controller/exports/exports.dart';
import 'package:comic_app/controller/exports/screen_exports.dart';
import 'package:flutter/material.dart';

/*
pantalla para ver la lista de todos los personajes
*/
class AllCharactersScreen extends StatefulWidget {
  const AllCharactersScreen({super.key});

  @override
  State<AllCharactersScreen> createState() => _AllCharactersScreenState();
}

class _AllCharactersScreenState extends State<AllCharactersScreen> {
  List<String> imagesList = [
    'https://cdn.marvel.com/content/1x/savwolvinfc2024001_resized.jpg',
    'https://cdn.marvel.com/content/1x/hulk2023014_weaponxtraction.jpg',
    'https://http2.mlstatic.com/D_NQ_NP_731572-CBT76048785527_042024-O.webp',
    'https://cdn.marvel.com/content/1x/hulk2023014_weaponxtraction.jpg',
    'https://http2.mlstatic.com/D_NQ_NP_731572-CBT76048785527_042024-O.webp',
    'https://cdn.marvel.com/content/1x/hulk2023014_weaponxtraction.jpg',
  ];

  List<int> idsList = [12, 22, 33, 21, 66, 32];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScaffoldUpBlurEffectWidget(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          const AppBarHomeComponents(title: ''),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: size.height * .03),
            sliver: SliverList.separated(
              itemCount: imagesList.length,
              separatorBuilder: (context, index) =>
                  SizedBox(height: size.height * .04),
              itemBuilder: (context, index) {
                return CardAllComicsAndCharacterComponents(
                  id: idsList[index],
                  name: 'Comics.name',
                  date: 'Comics.power',
                  image: imagesList[index],
                  onTap: () {
                    /*navega ver los detalles del comic*/
                    /*navega a los detalles del personajes*/
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsCharacterScreen(
                          image: imagesList[index],
                          id: idsList[index],
                          name: 'q3232323213',
                          dateTime: 'sdsadasdasdk',
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
          )
        ],
      ),
    );
  }
}
