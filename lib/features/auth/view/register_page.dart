import 'package:flutter/material.dart';
import 'package:projeto02/features/auth/viewmodel/register_viewmodel.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final RegisterViewModel _viewModel = RegisterViewModel();

  final Color corPrimaria = const Color.fromARGB(255, 74, 0, 0);
  final Color corFundo = const Color(0xFFFFF5E9);

  void _salvar() {
    if (_formKey.currentState!.validate()) {
      _viewModel.salvarUsuario(
        _nomeController.text, 
        _emailController.text, 
        _senhaController.text
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cadastro realizado com sucesso!'),
          backgroundColor: Colors.green, 
        ), 
      );
      Navigator.pop(context); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corFundo, 
      appBar: AppBar(
        backgroundColor: corPrimaria,
        title: const Text(
          'Criar Conta',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white), 
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.person_add_alt_1,
                  size: 70,
                  color: corPrimaria,
                ),
                const SizedBox(height: 40),
                
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(
                    hintText: 'Nome Completo',
                    hintStyle: const TextStyle(fontSize: 16, color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30), 
                      borderSide: BorderSide(color: corPrimaria, width: 2.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: corPrimaria, width: 2.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: corPrimaria, width: 3.5),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 8.0),
                      child: Icon(Icons.person_outline, color: corPrimaria),
                    ),
                  ),
                  validator: (value) => value!.isEmpty ? 'Informe o nome' : null,
                ),
                const SizedBox(height: 20),
                
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    hintStyle: const TextStyle(fontSize: 16, color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: corPrimaria, width: 2.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: corPrimaria, width: 2.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: corPrimaria, width: 3.5),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 8.0),
                      child: Icon(Icons.email_outlined, color: corPrimaria),
                    ),
                  ),
                  validator: (value) => value!.isEmpty ? 'Informe o e-mail' : null,
                ),
                const SizedBox(height: 20),
                
                TextFormField(
                  controller: _senhaController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Senha',
                    hintStyle: const TextStyle(fontSize: 16, color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: corPrimaria, width: 2.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: corPrimaria, width: 2.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: corPrimaria, width: 3.5),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 8.0),
                      child: Icon(Icons.lock_outlined, color: corPrimaria),
                    ),
                  ),
                  validator: (value) => value!.isEmpty ? 'Informe a senha' : null,
                ),
                const SizedBox(height: 40),
                
                SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: corPrimaria,
                      foregroundColor: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), 
                      ),
                    ),
                    onPressed: _salvar, 
                    child: const Text(
                      'SALVAR CADASTRO', 
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}