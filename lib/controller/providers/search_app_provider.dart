import 'dart:developer';

import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchAppProvider with ChangeNotifier {
  /*lista de personajes que se muestran en la busqueda */
  List<SearchComicVine> _characters = [];

  /*lista de personajes sugeridos (usualmente se basan en las busquedas previa) */
  List<String> _suggestions = [];
  /*estado de carga para mostrar en la interfaz de usuario */
  bool _isLoading = false;
  /*nariable que indica si se han cargado todos los resultados posibles */
  bool _hasMore = true;
  /*pagina actual que se esta consultando */
  int _currentPage = 1;
  bool _hasReachedMax = false;
  /*término de bsqueda actual */
  String _currentQuery = '';

  /*obtiene la lista de personajes*/
  List<SearchComicVine> get characters => _characters;

  List<String> get suggestions => _suggestions;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;
  bool get hasReachedMax => _hasReachedMax;
  /* ,etodo que inicializa la busqueda o la reinicia si cambia el téermino */
  Future<void> searchCharacters(String query) async {
    /*si el termino de busqueda es el mismo y ya tiene datos, no realiza otra petición */
    if (query == _currentQuery && _currentPage > 1) {
      return;
    }

    log('searchCharacters query: $query');
    /*resetea la busqueda si el termino cambia */
    _currentQuery = query;
    _characters = [];
    _hasMore = true;
    _currentPage = 1;
    await getSearchDelegeteCharacters();
    notifyListeners();
  }

  /*metodo que carga más resultados a medida que se hace scroll */
  Future<void> loadMoreCharacters() async {
    /*solo carga más si no está en modo de carga y si hay más resultados posibles */
    if (!_isLoading && _hasMore) {
      _currentPage++;
      await getSearchDelegeteCharacters();
    }
  }

  /*metodo que realiza la solicitud HTTP y obtiene los resultados de la api */
  Future<void> getSearchDelegeteCharacters() async {
    if (_isLoading || _hasReachedMax) return;

    _isLoading = true;
    notifyListeners();

    try {
      final url = Uri.parse(ObteinValueApi.searchDelegate(
          _currentQuery, _currentPage.toString()));
      final response = await http.get(url);

      log('url ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> results = data['results'];

        /*convierte los resultados JSON en objetos */
        List<SearchComicVine> newCharacters = results
            .map((character) => SearchComicVine.fromJson(character))
            .toList();

        /*si no hay más resultados marca que se ha alcanzado el final */
        if (newCharacters.isEmpty) {
          _hasMore = false;
          _hasReachedMax = true;
        }

        /*sgrega los nuevos personajes a la lista existente */
        _characters.addAll(newCharacters);
        _currentPage++;
      } else {
        /*si la API responde con un error, se maneja aqui */
        _hasMore = false;
      }
      notifyListeners();
    } catch (e) {
      /*si hay un error de red o cualquier otro tipo de excepción */
      log('error e cacgh $e');
      _hasMore = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /*metodo que obtiene sugerencias para la búsqueda, podría basarse en búsquedas recientes */
  fetchSuggestions(String query) {
    if (query.isEmpty) {
      _suggestions = [];
    } else {
      _suggestions = ListHerosSuggestion.listHeros.where((hero) {
        return hero.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  /*limpia las sugerencias */
  cleanSuggestions() {
    _suggestions.clear();
    notifyListeners();
  }

  cleanResults() {
    _characters.clear();
    notifyListeners();
  }
}
