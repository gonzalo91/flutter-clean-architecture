class LoginAttemptFailure implements Exception {
  @override
  String toString() {
    return 'Las credenciales no son validas';
  }
}
