import 'package:comic_app/controller/theme/palette_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';

/*
shimmer de loading para toda la app
*/
class ShimmerHomeComponents extends StatelessWidget {
  const ShimmerHomeComponents({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      physics: const BouncingScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .0, vertical: size.height * .0),
      children: [
        //banner
        Shimmer.fromColors(
          baseColor: PaletteColorsTheme.greyBlackTwo.withOpacity(0.3),
          highlightColor: PaletteColorsTheme.greyBlackTwo.withOpacity(0.5),
          enabled: true,
          child: Container(
            height: size.height * .4,
            width: size.width,
            color: Colors.black,
          ),
        ).animate().fadeIn(duration: const Duration(seconds: 2)).scale(
              begin: const Offset(1.1, 1.1), // Comienza ligeramente ampliada
              end: const Offset(1.0, 1.0), // Termina en tamaño normal
              duration: const Duration(seconds: 1),
              curve: Curves.easeOut,
            ),
        SizedBox(height: size.height * .08),
        const CardShimmerComponents(),
        SizedBox(height: size.height * .06),
        const CardShimmerComponents(),
      ],
    );
  }
}

/*
shimmer para las listas verticales, ej. para ver todos los comics
*/
class ShimmerAllListComponents extends StatelessWidget {
  const ShimmerAllListComponents({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverPadding(
      padding: EdgeInsets.only(right: size.width * .5, left: size.width * .04),
      sliver: SliverList(
          delegate: SliverChildListDelegate([
        const CardVerticalCardComponets(),
        SizedBox(height: size.height * .02),
        const CardVerticalCardComponets(),
        SizedBox(height: size.height * .02),
        const CardVerticalCardComponets(),
        SizedBox(height: size.height * .02),
      ])),
    );
  }
}

/*
shimmer para la pantalla de personajes
*/
class ShimmerCharactersScreenComponents extends StatelessWidget {
  const ShimmerCharactersScreenComponents({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * .1),
        SizedBox(
          height: size.height * .3,
          width: size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              CardVerticalCardComponets(
                width: size.width * .4,
              ),
              SizedBox(width: size.width * .04),
              CardVerticalCardComponets(width: size.width * .4),
              SizedBox(width: size.width * .03),
              CardVerticalCardComponets(width: size.width * .4),
            ],
          ),
        ),
        SizedBox(height: size.height * .1),
        SizedBox(
          height: size.height * .3,
          width: size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              CardVerticalCardComponets(
                width: size.width * .4,
              ),
              SizedBox(width: size.width * .04),
              CardVerticalCardComponets(width: size.width * .4),
              SizedBox(width: size.width * .03),
              CardVerticalCardComponets(width: size.width * .4),
            ],
          ),
        ),
      ],
    );
  }
}

class CardVerticalCardComponets extends StatelessWidget {
  final double? width;
  const CardVerticalCardComponets({
    super.key,
    this.width,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: PaletteColorsTheme.greyBlackTwo.withOpacity(0.8),
      highlightColor: PaletteColorsTheme.greyColor.withOpacity(0.1),
      enabled: true,
      child: SizedBox(
        height: size.height * .3,
        width: width ?? size.width * .2,
        child: Container(
          height: size.height,
          width: size.width * .4,
          decoration: BoxDecoration(
            color: PaletteColorsTheme.greyBlackTwo.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

class CardShimmerComponents extends StatelessWidget {
  const CardShimmerComponents({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: PaletteColorsTheme.greyBlackTwo.withOpacity(0.8),
      highlightColor: PaletteColorsTheme.greyColor.withOpacity(0.1),
      enabled: true,
      child: SizedBox(
        height: size.height * .3,
        width: size.width,
        child: ListView.separated(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: size.width * .05),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          separatorBuilder: (context, index) =>
              SizedBox(width: size.width * .04),
          itemBuilder: (context, index) => SizedBox(
            width: size.width * .4,
            child: Container(
              height: size.height,
              width: size.width * .4,
              decoration: BoxDecoration(
                color: PaletteColorsTheme.greyBlackTwo.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ),
    ).animate().fadeIn(duration: const Duration(seconds: 2)).scale(
          begin: const Offset(1.1, 1.1), // Comienza ligeramente ampliada
          end: const Offset(1.0, 1.0), // Termina en tamaño normal
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
        );
  }
}
