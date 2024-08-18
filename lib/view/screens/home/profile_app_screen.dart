import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

/*
pantalla para ver el perfil del usuario
*/
class ProfileAppScreen extends StatelessWidget {
  const ProfileAppScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScaffoldUpBlurEffectWidget(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          const AppBarHomeComponents(title: ''),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                //
                const ProfileInformationComponents(),
                SizedBox(height: size.height * .04),
                const TextInformtationMenuComponents(title: 'Información'),
                SizedBox(height: size.height * .02),
                //
                const MenuInformtationComponents(
                  title: 'Mi cuenta',
                  icon: Iconsax.profile_2user_outline,
                ),
                //
                const MenuInformtationComponents(
                  title: 'Mis descargas',
                  icon: Iconsax.cloud_add_outline,
                ),
                const MenuInformtationComponents(
                  title: 'Mi lista',
                  icon: Iconsax.document_1_outline,
                ),

                //
                SizedBox(height: size.height * .04),
                const TextInformtationMenuComponents(title: 'Notificaciones'),
                SizedBox(height: size.height * .02),
                //
                const MenuInformtationComponents(
                  title: 'Push notificaciones',
                  icon: Iconsax.notification_1_outline,
                ),
                const MenuInformtationComponents(
                  title: 'SMS notificaciones',
                  icon: Iconsax.notification_1_outline,
                ),
                //
                SizedBox(height: size.height * .04),
                const TextInformtationMenuComponents(title: 'Notificaciones'),
                SizedBox(height: size.height * .02),
                //
                const MenuInformtationComponents(
                  title: 'Atención al cliente',
                  icon: Iconsax.notification_1_outline,
                ),
                const MenuInformtationComponents(
                  title: 'Cerra sesión',
                  icon: Iconsax.close_circle_outline,
                ),

                SizedBox(height: size.height * .04),
                const TextInformtationMenuComponents(title: 'Versión 0.0.1'),
                SizedBox(height: size.height * .2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
