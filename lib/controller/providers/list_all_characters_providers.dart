import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:comic_app/controller/exports/exports.dart';

/*
provider para manejar la lista de todos los personajes
*/
class ListAllCharacterProviders extends ChangeNotifier {
  /*lista de heroes */
  List<ListCharactersAllModel>? _cachedHeros = [];

  bool _isInitialLoading = false;
  bool _isLoadingMore = false;

  String? _errorMessage;

  int _currentPage = 1;

  bool _hasMore = true;

  List<ListCharactersAllModel>? get cachedHeros => _cachedHeros;
  bool get isInitialLoading => _isInitialLoading;
  bool get isLoadingMore => _isLoadingMore;
  String? get errorMessage => _errorMessage;
  int get currentPage => _currentPage;
  bool get hasMore => _hasMore;

  ListAllCharacterProviders() {
    getListCharactersAll();
  }

  //*===OBTIENE LA LISTA DE PERSONAJES====*/
  Future getListCharactersAll({bool loadMore = false}) async {
    if (_isInitialLoading || _isLoadingMore) return;

    if (loadMore) {
      _isLoadingMore = true;
      notifyListeners();
    } else {
      _isInitialLoading = true;
      _currentPage = 1; //teinicia la página cuando se hace un refresh
      _cachedHeros?.clear(); //limpia la lista al refrescar
    }

    try {
      final url = Uri.parse(ObteinValueApi.getListCharactersHome('10',
          currentPage: _currentPage.toString()));

      final response = await http.get(url);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = json.decode(response.body);
        List<dynamic> results = data['results'];

        log("Results received: ${results.length}"); //verificar la cantidad de resultados

        if (results.isEmpty) {
          _hasMore = false;
        } else {
          final comicsList = results
              .map((comic) => ListCharactersAllModel.fromJson(comic))
              .toList();

          if (loadMore) {
            _cachedHeros!.addAll(comicsList);
          } else {
            _cachedHeros = comicsList;
          }

          log("Cached characters length: ${_cachedHeros?.length}"); // verifica la longitud de _cachedComics

          if (comicsList.length < 10) {
            _hasMore = false;
          } else {
            _currentPage++; //incrementa la página solo si se obtuvieron cómics
          }
        }

        _errorMessage = null;
      } else {
        _errorMessage = 'Error en la solicitud: ${response.statusCode}';
      }
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Se produjo un error inesperado: $e';
      log('getListAllComics: $e');
    } finally {
      if (loadMore) {
        _isLoadingMore = false;
      } else {
        _isInitialLoading = false;
      }
      notifyListeners();
    }
  }

  Future<void> loadMoreComics(BuildContext context) async {
    if (_hasMore && !_isLoadingMore) {
      await getListCharactersAll(loadMore: true);
    }
  }

  scrollValues() {
    _cachedHeros?.clear();
    notifyListeners();
  }
}
