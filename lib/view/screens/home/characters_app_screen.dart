import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharactersAppScreen extends StatelessWidget {
  const CharactersAppScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final prvList = Provider.of<HomeAppProvider>(context);
    return ScaffoldUpBlurEffectWidget(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          const AppBarHomeComponents(title: ''),
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
                Navigator.pushNamed(
                  context,
                  MainRoutes.allCharacterRoute,
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
      ),
    );
  }
}
