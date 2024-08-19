import 'dart:ui';

import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

/*
componentes para abrir el buscador
*/
class OpenSearchHomeComponents extends StatelessWidget {
  final EdgeInsets? margin;
  const OpenSearchHomeComponents({
    super.key,
    this.margin,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: margin ?? EdgeInsets.only(right: size.width * .03),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () {
          showSearch(
            context: context,
            delegate: SearchDelegateAppWidgets(),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: const CircleAvatar(
              backgroundColor: PaletteColorsTheme.transparent,
              child: Icon(Iconsax.search_normal_outline),
            ),
          ),
        ),
      ),
    );
  }
}
