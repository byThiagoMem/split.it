import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:splitit/modules/login/login_state.dart';
import 'package:splitit/modules/login/models/user_model.dart';

class LoginController {
  LoginState state = LoginStateEmpty();
  VoidCallback onUpdate;
  LoginController({
    required this.onUpdate,
  });

  Future<void> googleSignIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      state = LoginStateLoading();
      final account = await _googleSignIn.signIn();
      state = LoginStateSuccess(user: UserModel.google(account!));
      onUpdate();
    } catch (error) {
      state = LoginStateFailure(message: error.toString());
      onUpdate();
    }
  }
}
