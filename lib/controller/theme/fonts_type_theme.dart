import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
/*
clase para manejar los tipos de fuentes del tema oscuro o claro 
*/

class FontsTypeTheme {
  /*tipo de fuente */
  static TextStyle typeFont = GoogleFonts.urbanist();
  static TextStyle secondFont = GoogleFonts.sora();

  /*tipos de textos a usar modo claro*/
  static TextTheme lightThemeFont = TextTheme(
    displayLarge: typeFont.copyWith(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: PaletteColorsTheme.secondary,
    ),
    displayMedium: typeFont.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: PaletteColorsTheme.secondary,
    ),
    displaySmall: typeFont.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w300,
      color: PaletteColorsTheme.secondary,
    ),
    headlineLarge: typeFont.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: PaletteColorsTheme.secondary,
    ),
    headlineMedium: typeFont.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: PaletteColorsTheme.secondary,
    ),
    headlineSmall: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w200,
      color: PaletteColorsTheme.secondary,
    ),
    titleLarge: typeFont.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: PaletteColorsTheme.secondary,
    ),
    titleMedium: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: PaletteColorsTheme.secondary,
    ),
    titleSmall: typeFont.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w300,
      color: PaletteColorsTheme.terteary,
    ),
    bodyLarge: typeFont.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: PaletteColorsTheme.secondary,
    ),
    bodyMedium: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: PaletteColorsTheme.secondary,
    ),
    bodySmall: typeFont.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w100,
      color: PaletteColorsTheme.terteary,
    ),
    labelLarge: typeFont.copyWith(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: PaletteColorsTheme.greyColor,
    ),
    labelMedium: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w200,
      color: PaletteColorsTheme.greyColor,
    ),
    labelSmall: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w100,
      color: PaletteColorsTheme.greyColor,
    ),
  );
  /*tipos de textos a usar modo oscuro*/
  static TextTheme dartThemeFont = TextTheme(
    displayLarge: typeFont.copyWith(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: PaletteColorsTheme.principal,
    ),
    displayMedium: typeFont.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: PaletteColorsTheme.principal,
    ),
    displaySmall: typeFont.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w300,
      color: PaletteColorsTheme.principal,
    ),
    headlineLarge: typeFont.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: PaletteColorsTheme.principal,
    ),
    headlineMedium: typeFont.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: PaletteColorsTheme.principal,
    ),
    headlineSmall: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w200,
      color: PaletteColorsTheme.principal,
    ),
    titleLarge: typeFont.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: PaletteColorsTheme.principal,
    ),
    titleMedium: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: PaletteColorsTheme.principal,
    ),
    titleSmall: typeFont.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w300,
      color: PaletteColorsTheme.principal,
    ),
    bodyLarge: typeFont.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: PaletteColorsTheme.principal,
    ),
    bodyMedium: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: PaletteColorsTheme.principal,
    ),
    bodySmall: typeFont.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w100,
      color: PaletteColorsTheme.principal,
    ),
    labelLarge: typeFont.copyWith(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: PaletteColorsTheme.greyColor,
    ),
    labelMedium: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w200,
      color: PaletteColorsTheme.greyColor,
    ),
    labelSmall: typeFont.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w100,
      color: PaletteColorsTheme.greyColor,
    ),
  );
}
