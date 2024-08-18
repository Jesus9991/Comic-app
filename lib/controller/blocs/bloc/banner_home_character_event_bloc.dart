import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerHomeCharacterBloc
    extends Bloc<BannerHomeCharacterEvent, BannerHomeCharacterState> {
  BannerCharacterHomeModels? _cachedCharacter;

  // BannerHomeCharacterBloc() : super(BannerHomeCharacterInitial());

  BannerHomeCharacterBloc() : super(BannerHomeCharacterInitial()) {
    on<FetchBannerCharacter>((event, emit) {
      // Lógica para manejar el evento FetchBannerCharacter
    });
  }

  Stream<BannerHomeCharacterState> mapEventToState(
      BannerHomeCharacterEvent event) async* {
    if (event is FetchBannerCharacter) {
      if (_cachedCharacter != null) {
        yield BannerHomeCharacterLoaded(_cachedCharacter!);
      } else {
        yield BannerHomeCharacterLoading();
        try {
          final response = await http
              .get(Uri.parse(ObteinValueApi.getCharacterUrl('Deadpool')));
          if (response.statusCode == 200) {
            final data = json.decode(response.body);
            // Asegúrate de que `data` contiene la estructura esperada
            final character =
                BannerCharacterHomeModels.fromJson(data['results'][0]);
            _cachedCharacter = character;
            yield BannerHomeCharacterLoaded(character);
          } else {
            yield BannerHomeCharacterError('Error: ${response.statusCode}');
          }
        } catch (e) {
          yield BannerHomeCharacterError('An unexpected error occurred: $e');
        }
      }
    }
  }

  String handleHttpError(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request. The server could not understand the request.';
      case 401:
        return 'Unauthorized. Authentication is required or has failed.';
      case 403:
        return 'Forbidden. You do not have permission to access this resource.';
      case 404:
        return 'Not found. The requested resource could not be found.';
      case 500:
        return 'Internal server error. Something went wrong on the server.';
      case 502:
        return 'Bad gateway. The server received an invalid response from the upstream server.';
      case 503:
        return 'Service unavailable. The server is currently unable to handle the request.';
      case 504:
        return 'Gateway timeout. The server took too long to respond.';
      default:
        return 'An error occurred. Status code: $statusCode';
    }
  }
}
