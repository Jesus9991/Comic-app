import 'dart:io';
import 'dart:ui';

import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarHomeComponents extends StatelessWidget {
  final String title;
  const AppBarHomeComponents({
    super.key,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      elevation: 0,
      pinned: true,
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
      expandedHeight: size.height * .1,
      titleSpacing: size.height * .1,
      collapsedHeight: size.height * .1,
      centerTitle: true,
      title: Text(title),
      actions: [
        OpenSearchHomeComponents(
          onTap: () {},
        ),
      ],
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: SizedBox(
            height: size.height * .3,
            width: size.width,
          ),
        ),
      ),
    );
  }
}

/*
appbar transparent para el home
*/

class AppBarHomeTransparentComponents extends StatelessWidget {
  const AppBarHomeTransparentComponents({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      elevation: 0,
      pinned: true,
      backgroundColor: PaletteColorsTheme.transparent,
      expandedHeight: size.height * .07,
      titleSpacing: size.height * .07,
      collapsedHeight: size.height * .07,
      actions: [
        OpenSearchHomeComponents(
          onTap: () {},
        ),
      ],
      flexibleSpace: SizedBox(
        height: size.height * .3,
        width: size.width,
      ),
    );
  }
}

/*
componente para la información del usuario
*/
class UserInformationComponents extends StatelessWidget {
  const UserInformationComponents({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final userName = context.watch<
        NameUserInformationCubit>(); //obtiene el valor("nombre del usuario al poner el .state")
    return Align(
      alignment: Alignment.topLeft,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            height: size.height * .06,
            width: size.width * .5,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: PaletteColorsTheme.secondary, width: 1)),
                  child: CircleAvatar(
                    backgroundColor: PaletteColorsTheme.secondary,
                    backgroundImage: AssetImage(ImagesPath.profilePhoto),
                  ),
                ),
                SizedBox(width: size.width * .01),
                /*información del usuario */
                SizedBox(
                  width: size.width * .3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hola,',
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Text(
                        userName.state,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*boton para volver a tras en el appbar */
class LeadingIconBlurAppBarComponent extends StatelessWidget {
  const LeadingIconBlurAppBarComponent({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isiOS = Platform.isIOS;
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () => Navigator.pop(context),
      child: ClipOval(
        child: Padding(
          padding: EdgeInsets.only(left: size.width * .01),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Center(
              child: Icon(
                isiOS ? Icons.arrow_back_ios : Icons.arrow_back,
              ),
            ),
          ),
        ),
      ).animate().fade().scale(),
    );
  }
}
