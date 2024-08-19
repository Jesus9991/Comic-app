import 'package:animate_do/animate_do.dart';
import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    this.maxLines = 5,
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

/*
tap para ver los creadores, etc
*/
class MenuTapDetailsComicComponents extends StatefulWidget {
  const MenuTapDetailsComicComponents({super.key});

  @override
  State<MenuTapDetailsComicComponents> createState() =>
      _MenuTapDetailsComicComponentsState();
}

class _MenuTapDetailsComicComponentsState
    extends State<MenuTapDetailsComicComponents> {
  int indexTapSelect = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<HomeAppProvider>(
      builder: (context, prv, child) {
        List<dynamic> items = [];
        switch (indexTapSelect) {
          case 0:
            items = prv.credits;
            break;
          case 1:
            items = prv.charactersCredits;
            break;
          case 2:
            items = prv.teamCredits;
            break;
          case 3:
            items = prv.locationsCredits;
            break;
          case 4:
            items = prv.conceptCredits;
            break;
          default:
            items = [];
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //menu tap
            SizedBox(
              height: size.height * .1,
              width: size.width,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: size.width * .06),
                itemCount: LocalsListPaths.tapsDetailsComics.length,
                separatorBuilder: (context, index) =>
                    SizedBox(width: size.width * .05),
                itemBuilder: (context, values) {
                  final data = LocalsListPaths.tapsDetailsComics[values];

                  // Calcular el ancho del texto
                  final textPainter = TextPainter(
                    text: TextSpan(
                      text: data,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    maxLines: 1,
                    textDirection: TextDirection.ltr,
                  )..layout(minWidth: 0, maxWidth: double.infinity);

                  final textWidth = textPainter.size.width;

                  return InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      setState(() => indexTapSelect = values);
                      /*tap para el menu */
                      prv.setChangeMenuTap(indexTapSelect);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontSize: 13,
                                  fontWeight: indexTapSelect == values
                                      ? FontWeight.bold
                                      : FontWeight.w300),
                        ),
                        SizedBox(height: size.height * .01),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: size.height * .005,
                          width: indexTapSelect == values ? textWidth : 0,
                          decoration: BoxDecoration(
                            color: PaletteColorsTheme.redColor.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Lista con cada filtro dependiendo del "tap seleccionado"
            if (items.isNotEmpty)
              _MenuTapDataComponents(
                items: items,
              ),
            if (items.isEmpty)
              const IsEmptyComponents(title: 'No se encontraron resultados.'),
          ],
        );
      },
    );
  }
}

class _MenuTapDataComponents extends StatelessWidget {
  final List<dynamic> items;

  const _MenuTapDataComponents({
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .28,
      width: size.width,
      child: GridView.builder(
        itemCount: items.length,
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding:
            EdgeInsets.symmetric(horizontal: size.width * .00, vertical: 0),
        itemBuilder: (context, index) {
          final item = items[index];
          return SizedBox(
            width: size.width * .2,
            child: Column(
              children: [
                Container(
                  height: size.height * .07,
                  width: size.width * .15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: PaletteColorsTheme.greyBlackTwo.withOpacity(0.3),
                  ),
                  child: ClipOval(
                      child: ImageNetworkComponents(url: item["image"] ?? '')),
                ),
                Text(
                  item["name"] ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  item["role"] ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: size.height * .15, // Largo
          mainAxisSpacing: size.height * .004, // Separación vertical
          crossAxisSpacing: size.width * .03, // Separación horizontal
          crossAxisCount: 3, // Máximo por línea
        ),
      ),
    );
  }
}
