import 'package:scoped_model/scoped_model.dart';

import '../models/user.dart';

mixin UsersModel on Model {
  User _authenticatedUser;

  void login(String email, String password) {
    _authenticatedUser = User(id: 'asdfasdf', email: email, password: password);
  }
}
