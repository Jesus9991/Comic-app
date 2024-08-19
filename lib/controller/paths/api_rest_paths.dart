/*
clase para manejar los dominios y url de la api(base de datos)
*/
class ApiRestPath {
  static const String apiKey = '142596c57d2184f0313704846c8d40f9da20de07';
  static const String formatKey = 'json';
  static String httpDomain = 'https://comicvine.gamespot.com/api';
  static String domain = 'comicvine.gamespot.com/api';

  //paths
  static const String characters = '/characters';
  static const String search = '/search';
  static const String comicsHome = '/issues';
}

//obtiene los valores formateados
class ObteinValueApi {
  //#1 obtiene el formato de el banner del home
  static String getCharacterUrl(String characterName) {
    return '${ApiRestPath.httpDomain}${ApiRestPath.search}?api_key=${ApiRestPath.apiKey}&format=${ApiRestPath.formatKey}&field_list=id,image,name,origin,publisher,real_name,name&query=$characterName';
  }

  // #2 obtiene el formato para los comics del home
  static String getListComics(String limit) {
    return '${ApiRestPath.httpDomain}${ApiRestPath.comicsHome}?api_key=${ApiRestPath.apiKey}&format=${ApiRestPath.formatKey}&field_list=id,volume,issue_number,cover_date,description,image,credits,characters,teams,locations,concepts&sort=cover_date:desc&limit=$limit&error="OK"';
  }

  //#3 obtiene la lista de personajes en el home
  static String getListCharactersHome(String limit) {
    return '${ApiRestPath.httpDomain}${ApiRestPath.characters}?api_key=${ApiRestPath.apiKey}&format=${ApiRestPath.formatKey}&field_list=id,aliases,description,image,name,origin,publisher,date_added,real_name&limit=$limit&error="OK"';
  }

  static String getListAllComics(String currentPage) {
    return '${ApiRestPath.httpDomain}${ApiRestPath.comicsHome}'
        '?api_key=${ApiRestPath.apiKey}'
        '&format=${ApiRestPath.formatKey}'
        '&field_list=id,volume,issue_number,cover_date,description,image,credits,characters,teams,locations,concepts'
        '&sort=cover_date:desc'
        '&limit=10'
        '&number_of_page_results=$currentPage';
  }
}
