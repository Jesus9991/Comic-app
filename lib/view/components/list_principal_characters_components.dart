import 'package:comic_app/controller/exports/exports.dart';
import 'package:comic_app/controller/exports/screen_exports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
listas de personajes principales, enumerados
*/
class ListPrincipalCharactersComponents extends StatelessWidget {
  const ListPrincipalCharactersComponents({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverList(
        delegate: SliverChildListDelegate([
      Consumer<ListNumberCharacterProvider>(
        builder: (context, prov, child) {
          if (prov.listcached == null || prov.listcached!.isEmpty) {
            return const SizedBox();
          } else {
            return SizedBox(
              height: size.height * .4,
              width: size.width,
              child: ListView.separated(
                itemCount: prov.listcached?.length ?? 0,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                    top: size.height * .03,
                    left: size.width * .04,
                    right: size.width * .04),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                separatorBuilder: (context, index) =>
                    SizedBox(width: size.width * .06),
                itemBuilder: (context, index) {
                  final data = prov.listcached![index];

                  return CardPrincipalCharacterComponents(
                    id: data.id,
                    image: data.image.image,
                    name: data.name,
                    description: data.dateTime,
                    number: (index + 1).toString(),
                    onTap: () {
                      /*navega a los detalles del personajes*/
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsCharacterScreen(
                            id: data.id,
                            image: data.image.image,
                            name: data.name,
                            dateTime: data.dateTime,
                            aliases: data.aliases,
                            description: data.description,
                            origin: data.origin.name,
                            realName: data.realName,
                            punisher: data.publisher.name,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          }
        },
      ),
    ]));
  }
}
