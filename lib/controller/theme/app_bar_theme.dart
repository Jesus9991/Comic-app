import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
/*
tema para manejar el appbar de la aplicación
*/

class AppBarMainTheme {
  /*tipo de fuente */
  static TextStyle typeFont = GoogleFonts.urbanist();

  static AppBarTheme appbarLight = AppBarTheme(
    iconTheme:
        const IconThemeData(color: PaletteColorsTheme.secondary, size: 25),
    actionsIconTheme:
        const IconThemeData(color: PaletteColorsTheme.secondary, size: 25),
    backgroundColor: PaletteColorsTheme.transparent,
    foregroundColor: PaletteColorsTheme.transparent,
    shadowColor: PaletteColorsTheme.transparent,
    surfaceTintColor: PaletteColorsTheme.transparent,
    centerTitle: true,
    elevation: 0,
    titleTextStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: PaletteColorsTheme.secondary),
  );
  //: modo oscuro
  static AppBarTheme appbarDark = AppBarTheme(
    iconTheme:
        const IconThemeData(color: PaletteColorsTheme.principal, size: 25),
    actionsIconTheme:
        const IconThemeData(color: PaletteColorsTheme.principal, size: 25),
    backgroundColor: PaletteColorsTheme.transparent,
    foregroundColor: PaletteColorsTheme.transparent,
    shadowColor: PaletteColorsTheme.transparent,
    surfaceTintColor: PaletteColorsTheme.transparent,
    centerTitle: true,
    elevation: 0,
    titleTextStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: PaletteColorsTheme.principal),
  );
}
