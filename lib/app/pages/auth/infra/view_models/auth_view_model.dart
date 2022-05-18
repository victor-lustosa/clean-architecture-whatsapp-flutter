import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/configs/app_routes.dart';
import '../../../../core/user/infra/models/usuario_model.dart';
class AuthViewModel{
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerSenha = TextEditingController();
  String mensagemErro = "";
  Future verificaUsuarioLogado(context) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    // auth.signOut();
    User usuario = await auth.currentUser!;
    if( usuario != null ){
      Navigator.pushReplacementNamed(context, AppRoutes.rotaHome);
    }
  }
  validarCampos(context) {
    String email = controllerEmail.text;
    String senha = controllerSenha.text;

    if (email.isNotEmpty && email.contains('@')) {
      if (senha.isNotEmpty) {
        Usuario usuario = Usuario();

        usuario.email = email;
        usuario.senha = senha;
        _logarUsuario(usuario, context);
          mensagemErro = "";
      } else {
          mensagemErro = "Preencha o campo senha";
      }
    } else {
        mensagemErro = "Preencha o email utilizando @";
    }
  }

  _logarUsuario(Usuario usuario, context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(
        email: usuario.email,
        password: usuario.senha
    ).then((firebaseUser){
      Navigator.pushReplacementNamed(context, AppRoutes.rotaHome);
    }).catchError((error){
      print(error.toString());
      // setState(() {
      //   _mensagemErro = "Erro ao autenticar usuário, verique seu e-mail e senha";
      // });
    });
  }
}