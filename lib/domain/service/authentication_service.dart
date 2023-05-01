import 'package:bitsgap/domain/models/user.dart';

abstract class AuthenticationService {
  // User login function
  // Required for input fields:
  // userName and password
  Future<bool> login({
    required String userName,
    required String password,
  });

  // User register function
  // User object required
  Future<void> register(User user);

  // Get user which was log in
  User? getCurrentLoggedInUser();

  // Logout function Removes the logged in user from memory when invoked
  Future<void> logOut();
}
