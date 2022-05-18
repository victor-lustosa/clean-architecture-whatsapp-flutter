import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/configs/app_routes.dart';
class HomeViewModel{

  List<String> itensMenu = [
    'Configurações',
    'Deslogar'
  ];

  String _emailUsuario = "";
  Future verificaUsuarioLogado(context) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    // auth.signOut();
    User? usuario = await auth.currentUser;
    if( usuario == null ){
      Navigator.pushReplacementNamed(context, AppRoutes.rotaLogin);
    }
  }

  Future recuperarEmail() async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? usuario = await auth.currentUser;
    // setState(() {
      if(usuario != null) {
        _emailUsuario = usuario.email!;
      }
    // });
  }
  _deslogarUsuario(context) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    Navigator.pushReplacementNamed(context, AppRoutes.rotaLogin);
  }
  escolhaMenuItem(String itemSelecionado, context){
    switch(itemSelecionado){
      case "Configurações":
        break;
      case "Deslogar":
        _deslogarUsuario(context);
        break;
    }
  }
}