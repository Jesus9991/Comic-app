import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

/*
componentes para el perfil 
*/
class ProfileInformationComponents extends StatelessWidget {
  const ProfileInformationComponents({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        //foto de perfil
        Container(
          height: size.height * .12,
          width: size.width,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: AssetImage(ImagesPath.profilePhoto))),
        ),
        SizedBox(height: size.height * .02),
        //nombre
        Text(
          'Mark Dunks H.',
          maxLines: 1,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}

class MenuInformtationComponents extends StatelessWidget {
  final String title;
  final IconData icon;

  const MenuInformtationComponents({
    super.key,
    required this.title,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: PaletteColorsTheme.redColor.withOpacity(0.3),
        child: Center(
          child: Icon(icon, color: PaletteColorsTheme.secondary),
        ),
      ),
      title: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      trailing: const Icon(
        Iconsax.arrow_right_3_outline,
        color: PaletteColorsTheme.terteary,
      ),
    );
  }
}

class TextInformtationMenuComponents extends StatelessWidget {
  final String title;
  const TextInformtationMenuComponents({
    super.key,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: size.width * .06),
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
