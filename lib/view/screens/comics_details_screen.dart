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
          Container(
            //Todo: conectar con Api
            height: size.height * .28,
            width: size.width,

            child: GridView.builder(
              itemCount: 4,
              physics: const BouncingScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .00, vertical: 0),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: size.width * .2,
                  child: Column(
                    children: [
                      Container(
                        height: size.height * .07,
                        width: size.width * .15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              PaletteColorsTheme.greyBlackTwo.withOpacity(0.3),
                        ),
                        child:
                            ClipOval(child: ImageNetworkComponents(url: image)),
                      ),
                      Text(
                        'Name.creator',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Name.job',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: size.height * .15, //largo
                mainAxisSpacing: size.height * .004, //separacipn vertical
                crossAxisSpacing: size.width * .03, //separación horizontal
                crossAxisCount: 3, //maximo por linea
              ),
            ),
          )
        ],
      ),
    );
  }
}
