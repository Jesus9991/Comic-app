import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';
/*
componente para manejar el diseño y errores de las imagenes que retorna la api
*/

class ImageNetworkComponents extends StatelessWidget {
  final String url;

  const ImageNetworkComponents({
    super.key,
    required this.url,
  });
  @override
  Widget build(BuildContext context) {
    return Image.network(url,
        errorBuilder: (context, error, stackTrace) =>
            const PlaceholderErrorImageComponents(),
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return const LoadingImagesPlaceHolderComponents();
          }
        });
  }
}
