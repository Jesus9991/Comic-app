import 'package:comic_app/controller/exports/exports.dart';
import 'package:comic_app/controller/exports/screen_exports.dart';
import 'package:flutter/material.dart';

/*
lista de comics recientes para el home
*/
class ListRecientComicsHomeComponents extends StatefulWidget {
  final HomeAppProvider data;
  const ListRecientComicsHomeComponents({
    super.key,
    required this.data,
  });

  @override
  State<ListRecientComicsHomeComponents> createState() =>
      _ListRecientComicsHomeComponentsState();
}

class _ListRecientComicsHomeComponentsState
    extends State<ListRecientComicsHomeComponents> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (widget.data.cachedComics == null || widget.data.cachedComics == []) {
      return const SizedBox();
    } else {
      return SizedBox(
        height: size.height * .3,
        width: size.width,
        child: ListView.separated(
          itemCount: widget.data.cachedComics?.length ?? 0,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: size.width * .05),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          separatorBuilder: (context, index) =>
              SizedBox(width: size.width * .04),
          itemBuilder: (context, index) {
            final list = widget.data.cachedComics?[index];
            return CardComicsHomeComponents(
              id: list!.id,
              name: '${list.name.name} #${list.issueNumber}',
              date: list.coverDate,
              image: list.imageUrl,
              onTap: () {
                /*navega ver los detalles del comic*/
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsComicsScreen(
                        id: list.id,
                        name: '${list.name.name} ${list.issueNumber}',
                        date: list.coverDate,
                        image: list.imageUrl,
                        description: list.description,
                      ),
                    ));
              },
            );
          },
        ),
      );
    }
  }
}
