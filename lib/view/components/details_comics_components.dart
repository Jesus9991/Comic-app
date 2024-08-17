import 'package:animate_do/animate_do.dart';
import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';

/*
manejo de los detalles de un comic
*/
class BannerDetailsComicsComponents extends StatelessWidget {
  final int id;
  final String image;
  final String name;
  final String date;
  const BannerDetailsComicsComponents({
    super.key,
    required this.id,
    required this.image,
    required this.name,
    required this.date,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * .4,
        width: size.width,
        color: PaletteColorsTheme.greyBlackTwo.withOpacity(0.1),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
              child: Hero(tag: id, child: ImageNetworkComponents(url: image)),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * .3,
                width: size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: const [
                      0.2,
                      1.0
                    ],
                        colors: [
                      Colors.black.withOpacity(.9),
                      PaletteColorsTheme.transparent,
                    ])),
              ),
            ),
            //Todo: conectar con base de dato
            Positioned(
              bottom: size.height * .03,
              left: size.width * .06,
              child: FadeIn(
                child: SizedBox(
                  width: size.width * .9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        date,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class ExpandableTextComponents extends StatefulWidget {
  final String text;
  final int maxLines;

  const ExpandableTextComponents({
    super.key,
    required this.text,
    this.maxLines = 6,
  });

  @override
  createState() => _ExpandableTextComponentsState();
}

class _ExpandableTextComponentsState extends State<ExpandableTextComponents> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        final span = TextSpan(
          text: widget.text,
          style: const TextStyle(color: Colors.black),
        );

        final textPainter = TextPainter(
          text: span,
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
        );

        textPainter.layout(maxWidth: constraints.maxWidth);

        final isOverflowing = textPainter.didExceedMaxLines;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Descripción',
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 1,
                textAlign: TextAlign.start,
              ),
              Text(
                widget.text,
                maxLines: _isExpanded ? null : widget.maxLines,
                overflow:
                    _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              if (isOverflowing)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Text(
                    _isExpanded ? "Ver menos" : "Ver más",
                    style: Theme.of(context).textTheme.headlineMedium,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
