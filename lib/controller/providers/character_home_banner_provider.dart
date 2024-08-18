import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:comic_app/controller/exports/exports.dart';

/*
obtiene el personaje en el home, para los banner
*/
class CharacterHomeBannerProvider extends ChangeNotifier {
  /*moodelo para el personaje */
  BannerCharacterHomeModels? _cachedCharacter;
  /*carga de datos*/
  bool _isLoading = false;
  /*en caso de error*/
  String? _errorMessage;

  /*extención get de los datos */
  BannerCharacterHomeModels? get character => _cachedCharacter;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  /*inicializa obteniendo los datos del personaje */
  CharacterHomeBannerProvider() {
    getDataCharacterMain();
  }

  Future<void> getDataCharacterMain() async {
    if (_cachedCharacter != null) {
      // Si ya hay datos en caché, no se hace la petición
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      final url = Uri.parse(ObteinValueApi.getCharacterUrl('Deadpool'));
      final response = await http.get(url);

      // log('response.statusCode: ${response.statusCode}');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = json.decode(response.body);

        // Verifica la estructura de la respuesta
        if (data['results'] != null && data['results'].isNotEmpty) {
          final character =
              BannerCharacterHomeModels.fromJson(data['results'][0]);
          _cachedCharacter = character;
          _errorMessage = null;

          log('real name: ${character.realName}');
        } else {
          _errorMessage = 'No se encontraron resultados en la respuesta.';
        }
      } else {
        _errorMessage =
            HandlerErrorMessageJson.handleHttpError(response.statusCode);
      }
    } catch (e) {
      _errorMessage = 'Se produjo un error inesperado: $e';
      log('error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
