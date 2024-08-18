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
