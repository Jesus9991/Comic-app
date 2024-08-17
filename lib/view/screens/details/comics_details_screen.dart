import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';

/*
pantalla para ver los detalles de un comics
*/
class DetailsComicsScreen extends StatelessWidget {
  final int id;
  final String image;
  final String name;
  final String date;
  final String description;
  const DetailsComicsScreen({
    super.key,
    required this.id,
    required this.image,
    required this.name,
    required this.date,
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScaffoldDownBlurEffectWidget(
      appBar: AppBar(
        leading: const LeadingIconBlurAppBarComponent(),
      ),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: size.width * .00),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          //imagen de portada
          BannerDetailsComicsComponents(
            id: id,
            image: image,
            name: name,
            date: date,
          ),
          SizedBox(height: size.height * .02),
          //Descripción
          ExpandableTextComponents(
            maxLines: 5,
            text: description,
          ),
          SizedBox(height: size.height * .02),
          //menu
          const MenuTapDetailsComicComponents(),
          //lista con cada filtro dependiendo de el "tap seleccionado"
          ListsDetailsFiltForTapComponents(
            image: image,
            name: 'Name.creator',
            job: 'Job.name',
          ),
        ],
      ),
    );
  }
}
