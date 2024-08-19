import 'package:animate_do/animate_do.dart';
import 'package:comic_app/controller/exports/exports.dart';
import 'package:comic_app/controller/exports/screen_exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
pantalla de inicio de la app
*/
class HomeAppScreen extends StatelessWidget {
  const HomeAppScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final comics = Provider.of<ListAllComicsProvider>(context);
    final heroPrv = Provider.of<ListAllCharacterProviders>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const UserInformationComponents(),
        actions: const [
          //buscador
          OpenSearchHomeComponents(),
        ],
      ),
      body: Consumer<HomeAppProvider>(
        builder: (context, prv, child) {
          if (prv.isLoadingBanner &&
              prv.isLoadingBanner &&
              prv.isLoadingListCharacter) {
            return const ShimmerHomeComponents();
          } else {
            return Column(
              children: [
                BannerHomeComponents(
                  data: prv,
                ),

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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AllComicsRecentScreen(dataPrv: comics),
                                ));
                          },
                        ),
                        //comics recientes
                        ListRecientComicsHomeComponents(
                          data: prv,
                        ),

                        SizedBox(height: size.height * .02),
                        //personajes
                        AllTextTitleComponents(
                          title: 'Personajes',
                          onTap: () {
                            /*navega a ver la lista de todos los personajes*/
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllCharactersScreen(
                                  dataPrv: heroPrv,
                                ),
                              ),
                            );
                          },
                        ),
                        //Personajes
                        ListCharactersHomeComponents(
                          data: prv,
                        ),
                        SizedBox(height: size.height * .2),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
