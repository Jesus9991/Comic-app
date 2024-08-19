import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

/*
sugerencias en el buscador
*/
class SugerestionResultComponents extends StatelessWidget {
  final String query;
  final String name;
  final Function onTap;
  const SugerestionResultComponents({
    super.key,
    required this.query,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(),
      leading: CircleAvatar(
        backgroundColor: PaletteColorsTheme.greyBlackTwo.withOpacity(0.3),
        child: Center(
          child: Text(
            name.substring(0, 2),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ),
      title: RichText(
        text: _highlightText(name, query, context),
      ),
    );
  }

  TextSpan _highlightText(String text, String query, BuildContext context) {
    if (query.isEmpty) {
      return TextSpan(
        text: text,
        style: Theme.of(context).textTheme.bodyLarge,
      );
    }

    final lowerCaseText = text.toLowerCase();
    final lowerCaseQuery = query.toLowerCase();
    final List<TextSpan> spans = [];
    int start = 0;

    while (start < text.length) {
      final index = lowerCaseText.indexOf(lowerCaseQuery, start);

      if (index == -1) {
        spans.add(TextSpan(
          text: text.substring(start),
          style: Theme.of(context).textTheme.bodyLarge,
        ));
        break;
      }

      if (index > start) {
        spans.add(TextSpan(
          text: text.substring(start, index),
          style: Theme.of(context).textTheme.bodyLarge,
        ));
      }

      spans.add(TextSpan(
        text: text.substring(index, index + query.length),
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.red, // Color para el texto resaltado
              fontWeight: FontWeight.bold, // Peso para el texto resaltado
            ),
      ));

      start = index + query.length;
    }

    return TextSpan(children: spans);
  }
}

/*
card para los resultados de busquedas
*/
class ResultSearchComponents extends StatelessWidget {
  final String name;
  final String realName;
  final String image;
  final Function onTap;
  const ResultSearchComponents({
    super.key,
    required this.name,
    required this.realName,
    required this.image,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListTile(
      onTap: () => onTap(),
      leading: SizedBox(
        width: size.width * .2,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ImageNetworkComponents(url: image)),
      ),
      title: Text(
        name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        realName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: const Icon(
        Iconsax.arrow_right_3_outline,
        color: PaletteColorsTheme.secondary,
      ),
    );
  }
}
