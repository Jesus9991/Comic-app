import 'package:animate_do/animate_do.dart';
import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';

/*
pantalla de inicio de la app
*/
class HomeAppScreen extends StatelessWidget {
  const HomeAppScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const UserInformationComponents(),
        actions: [
          //buscador
          OpenSearchHomeComponents(
            onTap: () {
              //Todo: debe abrir el buscador
            },
          ),
        ],
      ),
      body: Column(
        children: [
          //banner imagen
          const BannerHomeComponents(),

          SizedBox(height: size.height * .03),
          //lista de datos
          Expanded(
            child: FadeIn(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: size.width * .01),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  //comics recientes
                  AllTextTitleComponents(
                    title: 'Comics recientes',
                    onTap: () {
                      /*navega a ver la lista de comics recientes */
                      Navigator.pushNamed(
                        context,
                        MainRoutes.allComicsRoute,
                      );
                    },
                  ),
                  //comics recientes
                  const ListRecientComicsHomeComponents(),

                  SizedBox(height: size.height * .02),
                  //personajes
                  AllTextTitleComponents(
                    title: 'Personajes',
                    onTap: () {
                      /*navega a ver la lista de todos los personajes*/
                      Navigator.pushNamed(
                        context,
                        MainRoutes.allCharacterRoute,
                      );
                    },
                  ),
                  //Personajes
                  const CharactersHomeComponents(),
                  SizedBox(height: size.height * .2),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
