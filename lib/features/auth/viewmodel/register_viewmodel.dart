import 'package:projeto02/app/data/usuario_mock_store.dart';
import 'package:projeto02/features/auth/model/usuario_model.dart';

class RegisterViewModel {
  final UsuarioMockStore _store = UsuarioMockStore();

  void salvarUsuario(String nome, String email, String senha) {
    final novoUsuario = UsuarioModel(nome: nome, email: email, senha: senha);
    _store.cadastrar(novoUsuario);
  }
}