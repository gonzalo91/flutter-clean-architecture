class NoNetworkConnection implements Exception {
  @override
  String toString() => 'No tienes acceso a internet';
}

class AuthTokenNotFound implements Exception {
  @override
  String toString() => 'No fue encontrado token';
}

class UserNotFound implements Exception {
  @override
  String toString() => 'La informacion del usuario no fue encontrado';
}
