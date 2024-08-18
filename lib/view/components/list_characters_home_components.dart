import 'package:comic_app/controller/exports/exports.dart';
import 'package:comic_app/controller/exports/screen_exports.dart';
import 'package:flutter/material.dart';

/*
lista de personajes en el home
*/
class ListCharactersHomeComponents extends StatelessWidget {
  final HomeAppProvider data;
  const ListCharactersHomeComponents({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (data.listcachedCharacter == null || data.listcachedCharacter == []) {
      return const SizedBox();
    } else {
      return SizedBox(
        height: size.height * .3,
        width: size.width,
        child: ListView.separated(
          itemCount: data.listcachedCharacter?.length ?? 0,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: size.width * .05),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          separatorBuilder: (context, index) =>
              SizedBox(width: size.width * .04),
          itemBuilder: (context, index) {
            final values = data.listcachedCharacter?[index];

            return CardComicsHomeComponents(
              id: values?.id ?? 0,
              name: values?.name ?? '',
              date: values?.dateTime ?? '',
              image: values?.image.image ?? '',
              onTap: () {
                /*navega a los detalles del personajes*/
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsCharacterScreen(
                      id: values?.id ?? 0,
                      image: values?.image.image ?? '',
                      name: values?.name ?? '',
                      dateTime: values?.dateTime ?? '',
                      aliases: values?.aliases ?? '',
                      description: values?.description ?? '',
                      origin: values?.origin.name ?? '',
                      realName: values?.realName ?? '',
                      punisher: values?.publisher.name ?? '',
                    ),
                  ),
                );
              },
            );
          },
        ),
      );
    }
  }
}
