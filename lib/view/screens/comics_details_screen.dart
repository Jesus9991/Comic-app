import 'package:flutter/material.dart';

/*
pantalla para ver los detalles de un comics
*/
class DetailsComicsScreen extends StatelessWidget {
  final int id;
  final String image;
  const DetailsComicsScreen({
    super.key,
    required this.id,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: size.width * .00),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          SizedBox(
            height: size.height * .4,
            width: size.width,
            child: Hero(
              tag: id,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
