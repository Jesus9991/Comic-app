import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';

/*
pantalla de inicio de la app
*/
class HomeAppScreen extends StatelessWidget {
  const HomeAppScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const UserInformationComponents(),
        actions: [
          OpenSearchHomeComponents(
            onTap: () {
              //Todo: debe abrir el buscador
            },
          ),
        ],
      ),
      body: Column(
        children: [
          //banner imagen
          const BannerHomeComponents(),
        ],
      ),
    );
  }
}
