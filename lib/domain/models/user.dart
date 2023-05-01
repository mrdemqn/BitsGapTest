class User {
  final String email;
  final String userName;
  final String password;

  const User({
    required this.email,
    required this.userName,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map.putIfAbsent('email', () => email);
    map.putIfAbsent('userName', () => userName);
    map.putIfAbsent('password', () => password);
    return map;
  }

  static User fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      userName: json['userName'],
      password: json['password'],
    );
  }
}
