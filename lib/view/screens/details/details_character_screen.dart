import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';

/*
pantalla para ver los detalles del personajes
*/
class DetailsCharacterScreen extends StatelessWidget {
  final int id;
  final String image;
  const DetailsCharacterScreen({
    super.key,
    required this.image,
    required this.id,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScaffoldDownBlurEffectWidget(
        appBar: AppBar(
          leading: const LeadingIconBlurAppBarComponent(),
        ),
        child: Column(
          children: [
            BannerDetailsComicsComponents(
                id: id, image: image, name: 'name', date: 'date'),
            //detalles
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: size.width * .00),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                children: const [
                  //#
                  _DetailsInformationComponents(
                    title: 'title.name',
                    description: 'description.name',
                  ),

                  _DetailsInformationComponents(
                    title: 'title.name',
                    description: 'description.name',
                  ),
                  _DetailsInformationComponents(
                    title: 'title.name',
                    description: 'description.name',
                  ),
                  _DetailsInformationComponents(
                    title: 'title.name',
                    description: 'description.name',
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class _DetailsInformationComponents extends StatelessWidget {
  final String title;
  final String description;
  const _DetailsInformationComponents({
    required this.title,
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        description,
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
