import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonsMainTheme {
  /*tipo de fuente */
  static TextStyle typeFont = GoogleFonts.urbanist();

  //: textos para el modo claro
  static ElevatedButtonThemeData elevatedButtonLight = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shadowColor: PaletteColorsTheme.secondary.withOpacity(0.5),
          elevation: 20,
          textStyle: typeFont.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: PaletteColorsTheme.principal),
          foregroundColor:
              PaletteColorsTheme.principal, //color de las letras */
          backgroundColor: PaletteColorsTheme.secondary, //color del boton */
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))));
  //
  static OutlinedButtonThemeData outlinedButtonLight = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: PaletteColorsTheme.principal,
      ),
      backgroundColor: PaletteColorsTheme.transparent,
      surfaceTintColor: PaletteColorsTheme.transparent,
      disabledBackgroundColor: PaletteColorsTheme.greyColor,
      disabledForegroundColor: PaletteColorsTheme.greyColor,
      elevation: 0,
      shadowColor: PaletteColorsTheme.transparent,
      side: const BorderSide(color: PaletteColorsTheme.greyColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(
            color: PaletteColorsTheme.greyColor), // Color del borde
      ),
    ),
  );
  //
  static TextButtonThemeData textButtonLight = TextButtonThemeData(
      style: TextButton.styleFrom(
    shadowColor: PaletteColorsTheme.principal.withOpacity(0.5),
    elevation: 0,
    textStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: PaletteColorsTheme.principal),
    foregroundColor: PaletteColorsTheme.principal,
  ));

  static IconButtonThemeData iconButtonLight = IconButtonThemeData(
      style: ButtonStyle(
    elevation: const MaterialStatePropertyAll(0),
    shadowColor:
        MaterialStatePropertyAll(PaletteColorsTheme.principal.withOpacity(0.5)),
    foregroundColor: const MaterialStatePropertyAll(
        PaletteColorsTheme.principal), //color de las letras */

    iconSize: MaterialStateProperty.all(25),
    iconColor: MaterialStateProperty.all(PaletteColorsTheme.secondary),
  ));
  //: textos para el modo oscuro

  static OutlinedButtonThemeData outlinedButtonDark = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    textStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: PaletteColorsTheme.principal),
    backgroundColor: PaletteColorsTheme.transparent,
    surfaceTintColor: PaletteColorsTheme.transparent,
    disabledBackgroundColor: PaletteColorsTheme.greyColor,
    disabledForegroundColor: PaletteColorsTheme.greyColor,
    elevation: 0,
    shadowColor: PaletteColorsTheme.transparent,
    side: const BorderSide(color: PaletteColorsTheme.principal),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: const BorderSide(
          color: PaletteColorsTheme.principal), // Color del borde
    ),
  ));
  static ElevatedButtonThemeData elevatedButtonDark = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shadowColor: PaletteColorsTheme.transparent,
          textStyle: typeFont.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: PaletteColorsTheme.secondary),
          foregroundColor:
              PaletteColorsTheme.secondary, //color de las letras */
          backgroundColor: PaletteColorsTheme.secondary, //color del boton */
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))));
  static TextButtonThemeData textButtonDark = TextButtonThemeData(
      style: TextButton.styleFrom(
    shadowColor: PaletteColorsTheme.transparent,
    textStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w300,
        color: PaletteColorsTheme.secondary),
    elevation: 0,
    foregroundColor: PaletteColorsTheme.secondary,
  ));
}
