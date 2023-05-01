import 'package:bitsgap/domain/models/user.dart';

abstract class AuthenticationService {
  Future<bool> login({
    required String userName,
    required String password,
  });

  Future<void> register(User user);

  Future<void> logOut();
}
