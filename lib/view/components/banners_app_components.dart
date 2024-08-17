import 'package:comic_app/controller/theme/palette_colors_theme.dart';
import 'package:comic_app/view/components/error_image_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BannerHomeComponents extends StatelessWidget {
  const BannerHomeComponents({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
            height: size.height * .4,
            width: size.width,
            color: PaletteColorsTheme.greyBlackTwo.withOpacity(0.1),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: size.height,
                  width: size.width,
                  child: Image.network(
                      //Todo: conectar con base de dato
                      'https://i.pinimg.com/736x/c5/5c/dc/c55cdca9d7684c8cf07079752e6d3350.jpg',
                      errorBuilder: (context, error, stackTrace) =>
                          const PlaceholderErrorImageComponents(),
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return const LoadingImagesPlaceHolderComponents();
                        }
                      }),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: size.height * .3,
                    width: size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: const [
                          0.2,
                          1.0
                        ],
                            colors: [
                          Colors.black.withOpacity(.9),
                          PaletteColorsTheme.transparent,
                        ])),
                  ),
                ),
                Positioned(
                  bottom: size.height * .03,
                  left: size.width * .06,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //productora
                      Text(
                        'Name.productora',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        'Name.character person',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        'Name.human | Name.creator',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ))
        .animate()
        .fadeIn(duration: const Duration(seconds: 2))
        .scale(
          begin: const Offset(1.2, 1.2), // Comienza ligeramente ampliada
          end: const Offset(1.0, 1.0), // Termina en tamaño normal
          duration: const Duration(seconds: 2),
          curve: Curves.easeOut,
        )
        .then()
        .color(
          begin: PaletteColorsTheme.greyBlackTwo,
          duration: const Duration(milliseconds: 500),
          delay: const Duration(seconds: 1),
          curve: Curves.easeOut,
        )
        .animate()
        .fade(duration: const Duration(seconds: 2));
  }
}
