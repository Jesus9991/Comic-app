import 'package:comic_app/controller/exports/exports.dart';
import 'package:comic_app/controller/exports/screen_exports.dart';
import 'package:flutter/material.dart';

/*
pantalla para ver la lista de todos los comic recientes
*/
class AllComicsRecentScreen extends StatefulWidget {
  const AllComicsRecentScreen({super.key});

  @override
  State<AllComicsRecentScreen> createState() => _AllComicsRecentScreenState();
}

class _AllComicsRecentScreenState extends State<AllComicsRecentScreen> {
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
                  date: 'Comics.date',
                  image: imagesList[index],
                  onTap: () {
                    /*navega ver los detalles del comic*/
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsComicsScreen(
                            id: idsList[index],
                            image: imagesList[index],
                            name: 'DeadPool.name',
                            date: '2034 05 20',
                            description:
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries',
                          ),
                        ));
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
