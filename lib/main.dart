import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:comic_app/controller/exports/exports.dart';

void main() {
  runApp(const ProvidersApps());
}

class ProvidersApps extends StatelessWidget {
  const ProvidersApps({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeAppProvider()),
        ChangeNotifierProvider(
            create: (context) => ListAllComicsProvider(context)),
        //lista de todos los personajes
        ChangeNotifierProvider(
            create: (context) => ListAllCharacterProviders()),
        //personajes enumerados
        ChangeNotifierProvider(
            create: (context) => ListNumberCharacterProvider()),
      ],
      child: const BlocksProviders(),
    );
  }
}

class BlocksProviders extends StatelessWidget {
  const BlocksProviders({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //información del usuario
        BlocProvider(create: (context) => NameUserInformationCubit()),
        //banner del home
        BlocProvider(create: (context) => BannerHomeCharacterBloc()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cómics App',
      theme: MainTheme.whiteTheme,
      routes: MainRoutes.routes,
      initialRoute: MainRoutes.initialRoute,
    );
  }
}
