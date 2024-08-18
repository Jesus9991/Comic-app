/*pagina para menejar los errores de la app */
class HandlerErrorMessageJson {
  static handleHttpError(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Solicitud incorrecta. El servidor no pudo entender la solicitud.';
      case 401:
        return 'No autorizado. Se requiere autenticación o ha fallado.';
      case 403:
        return 'Prohibido. No tienes permiso para acceder a este recurso.';
      case 404:
        return 'No encontrado. El recurso solicitado no se pudo encontrar.';
      case 500:
        return 'Error interno del servidor. Algo salió mal en el servidor.';
      case 502:
        return 'Puerta de enlace incorrecta. El servidor recibió una respuesta inválida del servidor ascendente.';
      case 503:
        return 'Servicio no disponible. El servidor actualmente no puede manejar la solicitud.';
      case 504:
        return 'Tiempo de espera de la puerta de enlace. El servidor tardó demasiado en responder.';
      default:
        return 'Ocurrió un error. Código de estado: $statusCode';
    }
  }
}
