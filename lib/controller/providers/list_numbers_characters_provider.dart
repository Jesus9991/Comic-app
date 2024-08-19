import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';

/*
provider para obtener los personajes enumerados
*/
class ListNumberCharacterProvider extends ChangeNotifier {
  /*moodelo para el personaje */
  List<ListCharactersNumberModel>? _listcached = [];
  /*carga de datos*/
  bool _isLoadingList = false;
  /*en caso de error*/
  String? _errorMessageList;

  /*extención get de los datos */
  List<ListCharactersNumberModel>? get listcached => _listcached;

  bool get isLoadingList => _isLoadingList;
  String? get errorMessageList => _errorMessageList;

  /*se inizializa al cargar el provider*/
  ListNumberCharacterProvider() {
    getNumberCharacters();
  }

  //*====OBTIENE LA LISTA DE PERSONAJES ENUMARADOS====*/
  getNumberCharacters() async {
    if (_listcached!.isNotEmpty) {
      //si ya hay datos en caché, no se hace la petición
      return;
    }
    _isLoadingList = true;
    notifyListeners();

    try {
      final url = Uri.parse(ObteinValueApi.getListCharacterNumbers());
      final response = await http.get(url);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = json.decode(response.body);
        List<dynamic> results = data['results'];

        // parsea los resultados a la lista de cómics
        _listcached = results
            .map((comic) => ListCharactersNumberModel.fromJson(comic))
            .toList();
        _errorMessageList = null;
      } else {
        _errorMessageList = 'Error en la solicitud: ${response.statusCode}';
      }
      notifyListeners();
    } catch (e) {
      _errorMessageList = 'Se produjo un error inesperado: $e';
      log('getListCharacters: $e');
      notifyListeners();
    } finally {
      _isLoadingList = false;
      notifyListeners();
    }
  }
}
