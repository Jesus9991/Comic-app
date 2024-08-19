import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';

/*
maneja los errores de la imagenes de toda la app
*/
class PlaceholderErrorImageComponents extends StatelessWidget {
  const PlaceholderErrorImageComponents({super.key});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagesPath.imageplaceholder,
      filterQuality: FilterQuality.high,
      fit: BoxFit.cover,
    );
  }
}

/* 
loading muentras carga la imagen
*/
class LoadingImagesPlaceHolderComponents extends StatelessWidget {
  const LoadingImagesPlaceHolderComponents({super.key});
  @override
  Widget build(BuildContext context) {
    return const LoadingAppComponents();
  }
}
