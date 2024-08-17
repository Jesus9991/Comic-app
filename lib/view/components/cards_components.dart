import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/*
diseño de todas las cards para la app
*/
class CardComicsHomeComponents extends StatelessWidget {
  final int id;
  final String name;
  final String date;
  final String image;
  final Function onTap;
  const CardComicsHomeComponents({
    super.key,
    required this.id,
    required this.name,
    required this.date,
    required this.image,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height * .25,
            width: size.width * .4,
            decoration: BoxDecoration(
              color: PaletteColorsTheme.greyBlackTwo.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: InkWell(
                onTap: () => onTap(),
                child: Hero(
                  tag: id,
                  child: ImageNetworkComponents(
                    url: image,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * .01),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            date,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    ).animate().fadeIn(duration: const Duration(seconds: 2)).scale(
          begin: const Offset(1.1, 1.1), // Comienza ligeramente ampliada
          end: const Offset(1.0, 1.0), // Termina en tamaño normal
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
        );
  }
}

/*
card para la lista de todos los comics y personajes
*/

class CardAllComicsAndCharacterComponents extends StatelessWidget {
  final int id;
  final String name;
  final String date;
  final String image;
  final Function onTap;
  const CardAllComicsAndCharacterComponents({
    super.key,
    required this.id,
    required this.name,
    required this.date,
    required this.image,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .28,
      width: size.width,
      child: Row(
        children: [
          InkWell(
            onTap: () => onTap(),
            child: Container(
              height: size.height,
              width: size.width * .4,
              margin: EdgeInsets.only(left: size.width * .04),
              decoration: BoxDecoration(
                color: PaletteColorsTheme.greyBlackTwo.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ImageNetworkComponents(url: image)),
            ),
          ),
          SizedBox(width: size.width * .03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: size.height * .03),
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                date,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          )
        ],
      ),
    ).animate().fadeIn(duration: const Duration(seconds: 2)).scale(
          begin: const Offset(1.1, 1.1), // Comienza ligeramente ampliada
          end: const Offset(1.0, 1.0), // Termina en tamaño normal
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
        );
  }
}
