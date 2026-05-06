import 'package:flutter/material.dart';
import 'package:projeto02/app/data/usuario_mock_store.dart';



class LoginViewmodel extends ChangeNotifier {
  final UsuarioMockStore _store = UsuarioMockStore();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  bool obscurePassword = true;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners(); 
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe seu e-mail';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe sua senha';
    }
    return null;
  }

  bool fazerLogin(String email, String senha) {
    isLoading = true;
    notifyListeners();

    bool sucesso = _store.autenticar(email, senha);

    isLoading = false;
    notifyListeners();

    return sucesso;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

