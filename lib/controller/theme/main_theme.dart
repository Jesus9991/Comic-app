import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';

/*
manejo del tema global de la aplicación
*/
class MainTheme {
  /*modo claro */
  static final ThemeData whiteTheme = ThemeData.light().copyWith(
    primaryColor: PaletteColorsTheme.principal,
    highlightColor: PaletteColorsTheme.secondary,
    colorScheme: const ColorScheme.light(
      primary: PaletteColorsTheme.principal,
      onPrimary: PaletteColorsTheme.secondary,
      secondary: PaletteColorsTheme.secondary,
      onSecondary: PaletteColorsTheme.principal,
      error: PaletteColorsTheme.redColor,
      onError: Colors.white,
      background: PaletteColorsTheme.secondary,
      onBackground: PaletteColorsTheme.principal,
      surface: PaletteColorsTheme.secondary,
      onSurface: PaletteColorsTheme.principal,
    ),
    textTheme: FontsTypeTheme.lightThemeFont,
    disabledColor: PaletteColorsTheme
        .greyColor, //Establece el color para los elementos desactivados
    dividerColor: PaletteColorsTheme.greyColor, //Color del widget Divider()
    scaffoldBackgroundColor:
        PaletteColorsTheme.principal, // Establece el color para el "scaffold"
    visualDensity: VisualDensity
        .adaptivePlatformDensity, //Adaptándose a diferentes tamaños y resoluciones de pantalla.
    unselectedWidgetColor:
        PaletteColorsTheme.greyColor, //widgets no seleccionados
    scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(10),
            thumbColor: MaterialStatePropertyAll(
                PaletteColorsTheme.secondary.withOpacity(0.5)),
            trackColor:
                const MaterialStatePropertyAll(PaletteColorsTheme.greyColor))
        .copyWith(
            thumbColor:
                MaterialStateProperty.all(PaletteColorsTheme.greyColor)),
    appBarTheme: AppBarMainTheme.appbarLight,

    iconTheme:
        const IconThemeData(color: PaletteColorsTheme.transparent, size: 20),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: PaletteColorsTheme.secondary),
    outlinedButtonTheme: ButtonsMainTheme.outlinedButtonLight,

    elevatedButtonTheme: ButtonsMainTheme.elevatedButtonLight,
    textButtonTheme: ButtonsMainTheme.textButtonLight,
    iconButtonTheme: ButtonsMainTheme.iconButtonLight,
    dividerTheme: const DividerThemeData(color: PaletteColorsTheme.greyColor),
    splashColor: PaletteColorsTheme.greyColor.withOpacity(0.2),
    splashFactory: InkSparkle.splashFactory,
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
    // navigationBarTheme: NavBarMainThemeData.navigationBarLight,
  );
}
