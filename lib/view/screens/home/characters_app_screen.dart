import 'package:comic_app/controller/exports/exports.dart';
import 'package:comic_app/controller/exports/screen_exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharactersAppScreen extends StatelessWidget {
  const CharactersAppScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final prvList = Provider.of<HomeAppProvider>(context);
    final heroPrv = Provider.of<ListAllCharacterProviders>(context);

    return ScaffoldUpBlurEffectWidget(
      child: Consumer<ListNumberCharacterProvider>(
        builder: (context, numbPrv, child) {
          if (numbPrv.isLoadingList) {
            return const ShimmerCharactersScreenComponents();
          } else {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                const AppBarHomeComponents(title: 'Personajes'),
                //personajes principales
                const ListPrincipalCharactersComponents(),
                //
                SliverList(
                    delegate: SliverChildListDelegate([
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
                    data: prvList,
                  ),
                  SizedBox(height: size.height * .2),
                ]))
              ],
            );
          }
        },
      ),
    );
  }
}
