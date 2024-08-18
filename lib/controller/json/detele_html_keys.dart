class DeleteHttmlTags {
  //elimina los tag de las descripciones que retornan con esos tags
  static String removeHtmlTags(String htmlString) {
    final RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }
}
