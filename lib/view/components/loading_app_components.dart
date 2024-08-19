import 'dart:io';

import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';

/*
loading para la app
*/
class LoadingAppComponents extends StatelessWidget {
  const LoadingAppComponents({super.key});
  @override
  Widget build(BuildContext context) {
    final iOS = Platform.isIOS;
    return iOS
        ? const Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: PaletteColorsTheme.secondary,
              valueColor: AlwaysStoppedAnimation(PaletteColorsTheme.secondary),
            ),
          )
        : Center(
            child: CircularProgressIndicator(
                backgroundColor: PaletteColorsTheme.secondary.withOpacity(0.3),
                valueColor: AlwaysStoppedAnimation(
                  PaletteColorsTheme.redColor.withOpacity(0.7),
                )),
          );
  }
}
