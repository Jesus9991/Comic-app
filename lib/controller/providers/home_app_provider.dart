import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:comic_app/controller/exports/exports.dart';

/*
obtiene el personaje en el home, para los banner
*/
class HomeAppProvider extends ChangeNotifier {
  /*moodelo para el personaje */
  BannerCharacterHomeModels? _cachedCharacter;
  /*carga de datos*/
  bool _isLoadingBanner = false;
  /*en caso de error*/
  String? _errorMessageBanner;

  /*extención get de los datos */
  BannerCharacterHomeModels? get character => _cachedCharacter;
  bool get isLoadingBanner => _isLoadingBanner;
  String? get errorMessageBanner => _errorMessageBanner;

  /*inicializa obteniendo los datos del personaje */
  HomeAppProvider() {
    getDataCharacterMain();
    getListComicsRecents();
    getListCharacters();
  }

  //*OBTIENE UN PERSONAJE PARA EL BANNER DEL HOME */
  Future<void> getDataCharacterMain() async {
    if (_cachedCharacter != null) {
      //si ya hay datos en caché, no se hace la petición
      return;
    }
    _isLoadingBanner = true;
    notifyListeners();

    try {
      final url = Uri.parse(ObteinValueApi.getCharacterUrl('Deadpool'));
      final response = await http.get(url);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = json.decode(response.body);

        // verifica la estructura de la respuesta
        if (data['results'] != null && data['results'].isNotEmpty) {
          final character =
              BannerCharacterHomeModels.fromJson(data['results'][0]);
          _cachedCharacter = character;
          _errorMessageBanner = null;

          log('real name: ${character.realName}');
        } else {
          _errorMessageBanner = 'No se encontraron resultados en la respuesta.';
        }
      } else {
        _errorMessageBanner =
            HandlerErrorMessageJson.handleHttpError(response.statusCode);
      }
    } catch (e) {
      _errorMessageBanner = 'Se produjo un error inesperado: $e';
      log('error: $e');
    } finally {
      _isLoadingBanner = false;
      notifyListeners();
    }
  }

// Modelo para los cómics
  List<ComicsHomeModels>? _cachedComics = [];
/* carga de datos */
  bool _isLoadinComics = false;
/* en caso de error */
  String? _errorMessageComics;

/* extensión get de los datos */
  List<ComicsHomeModels>? get cachedComics => _cachedComics;
  bool get isLoadinComics => _isLoadinComics;
  String? get errorMessageComics => _errorMessageComics;

//*OBTIENE LA LISTA DE COMICS RECIENTE*/
  Future<void> getListComicsRecents() async {
    if (_cachedComics!.isNotEmpty) {
      // Si ya hay datos en caché, no se hace la petición
      return;
    }

    _isLoadinComics = true;
    notifyListeners();

    try {
      final url = Uri.parse(ObteinValueApi.getListComics('10'));
      final response = await http.get(url);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = json.decode(response.body);

        List<dynamic> results = data['results'];

        // Parsear los resultados a la lista de cómics
        _cachedComics =
            results.map((comic) => ComicsHomeModels.fromJson(comic)).toList();

        _errorMessageComics = null;
        log('Primer comic en la lista: ${_cachedComics?.first.id}');
      } else {
        _errorMessageComics = 'Error en la solicitud: ${response.statusCode}';
      }
      notifyListeners();
    } catch (e) {
      _errorMessageComics = 'Se produjo un error inesperado: $e';
      log('getListComicsRecents: $e');
    } finally {
      _isLoadinComics = false;
      notifyListeners();
    }
  }

  // Listas para créditos
  List<PersonCredits> _credits = [];
  List<CharactersCredits> _charactersCredits = [];
  List<TeamCredits> _teamCredits = [];
  List<LocationsCredits> _locationsCredits = [];
  List<ConceptCredits> _conceptCredits = [];

  List<PersonCredits> get credits => _credits;
  List<CharactersCredits> get charactersCredits => _charactersCredits;
  List<TeamCredits> get teamCredits => _teamCredits;
  List<LocationsCredits> get locationsCredits => _locationsCredits;
  List<ConceptCredits> get conceptCredits => _conceptCredits;

  // metodo para manejar el cambio de tap
  void setChangeMenuTap(int index) {
    // Limpiar las listas no relevantes
    switch (index) {
      //Todo: carga de datos
      case 0:
        _credits = [];
        _charactersCredits.clear();
        _teamCredits.clear();
        _locationsCredits.clear();
        _conceptCredits.clear();
        notifyListeners();
        break;
      case 1:
        _charactersCredits = [];
        _credits.clear();
        _teamCredits.clear();
        _locationsCredits.clear();
        _conceptCredits.clear();
        notifyListeners();
        break;
      case 2:
        _teamCredits = [];
        _credits.clear();
        _charactersCredits.clear();
        _locationsCredits.clear();
        _conceptCredits.clear();
        notifyListeners();
        break;
      case 3:
        _locationsCredits = [];
        _credits.clear();
        _charactersCredits.clear();
        _teamCredits.clear();
        _conceptCredits.clear();
        notifyListeners();
        break;
      case 4:
        //mostrar créditos de conceptos y limpiar las demás listas
        _conceptCredits = [];
        _credits.clear();
        _charactersCredits.clear();
        _teamCredits.clear();
        _locationsCredits.clear();
        notifyListeners();
        break;
      default:
        _credits.clear();
        _charactersCredits.clear();
        _teamCredits.clear();
        _locationsCredits.clear();
        _conceptCredits.clear();
        notifyListeners();
    }
  }

  //obtiene los personajes en el home

  /*moodelo para el personaje */
  List<ListCharactersHomeModel>? _listcachedCharacter = [];
  /*carga de datos*/
  bool _isLoadingListCharacter = false;
  /*en caso de error*/
  String? _errorMessageListCharacter;

  /*extención get de los datos */
  List<ListCharactersHomeModel>? get listcachedCharacter =>
      _listcachedCharacter;

  bool get isLoadingListCharacter => _isLoadingListCharacter;
  String? get errorMessageListCharacter => _errorMessageListCharacter;

  //*==OBTIENE LA LISTA DE PERSONAJES=====*/
  Future<void> getListCharacters() async {
    if (_listcachedCharacter!.isNotEmpty) {
      //si ya hay datos en caché, no se hace la petición
      return;
    }
    _isLoadingListCharacter = true;
    notifyListeners();

    try {
      final url = Uri.parse(ObteinValueApi.getListCharactersHome('10'));
      final response = await http.get(url);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = json.decode(response.body);
        List<dynamic> results = data['results'];
        // parsea los resultados a la lista de cómics
        _listcachedCharacter = results
            .map((comic) => ListCharactersHomeModel.fromJson(comic))
            .toList();

        _errorMessageComics = null;
        log('Primer personaje en la lista home: ${_listcachedCharacter?.first.id}');
      } else {
        _errorMessageListCharacter =
            'Error en la solicitud: ${response.statusCode}';
      }
      notifyListeners();
    } catch (e) {
      _errorMessageListCharacter = 'Se produjo un error inesperado: $e';
      log('getListCharacters: $e');
      notifyListeners();
    } finally {
      _isLoadingListCharacter = false;
      notifyListeners();
    }
  }
}
