import 'dart:ui';
import 'package:comic_app/controller/exports/exports.dart';
import 'package:comic_app/controller/theme/palette_colors_theme.dart';
import 'package:flutter/material.dart';

/*
effecto blur para algunas pantallas
*/
class ScaffoldDownBlurEffectWidget extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget appBar;
  const ScaffoldDownBlurEffectWidget({
    super.key,
    required this.child,
    required this.appBar,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            // Fondo que se verá afectado por el desenfoque
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: size.height * 1,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          PaletteColorsTheme.redColor.withOpacity(0.3),
                          PaletteColorsTheme.principal.withOpacity(0.01),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // El contenido principal del widget
            child,
          ],
        ),
      ),
    );
  }
}
