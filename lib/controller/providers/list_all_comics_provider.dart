import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:comic_app/controller/exports/exports.dart';

/*
lista de comic completos para la pantalla de comics
*/
class ListAllComicsProvider extends ChangeNotifier {
  List<ListAllComicsModels>? _cachedComics = [];

  bool _isInitialLoading = false;
  bool _isLoadingMoreComics = false;

  String? _errorMessageComics;

  int _currentPage = 1;

  bool _hasMoreComics = true;

  List<ListAllComicsModels>? get cachedComics => _cachedComics;
  bool get isInitialLoading => _isInitialLoading;
  bool get isLoadingMoreComics => _isLoadingMoreComics;
  String? get errorMessageComics => _errorMessageComics;
  int get currentPage => _currentPage;
  bool get hasMoreComics => _hasMoreComics;

  ListAllComicsProvider(BuildContext context) {
    getListAllComics(context);
  }

  Future<void> getListAllComics(BuildContext context,
      {bool loadMore = false}) async {
    if (_isInitialLoading || _isLoadingMoreComics) return;

    if (loadMore) {
      if (!_hasMoreComics) {
        SnackBarAppWidgets.showSnackBar(
          context,
          'No se encontraron más comics',
          Icons.error_outline,
          PaletteColorsTheme.redColor,
        );
        return;
      }
      _isLoadingMoreComics = true;
    } else {
      _isInitialLoading = true;
      _currentPage = 1; //teinicia la página cuando se hace un refresh
      _cachedComics?.clear(); //limpia la lista al refrescar
    }

    try {
      final url =
          Uri.parse(ObteinValueApi.getListAllComics(_currentPage.toString()));

      final response = await http.get(url);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = json.decode(response.body);
        List<dynamic> results = data['results'];

        log("Results received: ${results.length}"); //verificar la cantidad de resultados

        if (results.isEmpty) {
          _hasMoreComics = false;
        } else {
          final comicsList = results
              .map((comic) => ListAllComicsModels.fromJson(comic))
              .toList();

          if (loadMore) {
            _cachedComics!.addAll(comicsList);
          } else {
            _cachedComics = comicsList;
          }

          log("Cached comics length: ${_cachedComics?.length}"); // verifica la longitud de _cachedComics

          if (comicsList.length < 10) {
            _hasMoreComics = false;
          } else {
            _currentPage++; //incrementa la página solo si se obtuvieron cómics
          }
        }

        _errorMessageComics = null;
      } else {
        _errorMessageComics = 'Error en la solicitud: ${response.statusCode}';
      }
      notifyListeners();
    } catch (e) {
      _errorMessageComics = 'Se produjo un error inesperado: $e';
      log('getListAllComics: $e');
    } finally {
      if (loadMore) {
        _isLoadingMoreComics = false;
      } else {
        _isInitialLoading = false;
      }
      notifyListeners();
    }
  }

  Future<void> loadMoreComics(BuildContext context) async {
    if (_hasMoreComics && !_isLoadingMoreComics) {
      await getListAllComics(context, loadMore: true);
    }
  }

  scrollValues() {
    _cachedComics?.clear();
    notifyListeners();
  }
}
