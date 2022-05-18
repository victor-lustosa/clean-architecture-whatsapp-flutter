import 'package:flutter/material.dart';

import '../../pages/auth/presenter/auth_page.dart';
import '../../pages/home/presenter/home_page.dart';
import '../../pages/messages/presenter/message_page.dart';
import '../../pages/register/presenter/cadastro_page.dart';
import '../user/infra/models/usuario_model.dart';


class AppRoutes{

  static const String rotaInicial = "/";
  static const String rotaHome = "/home";
  static const String rotaLogin = "/login";
  static const String rotaCadastro = "/cadastro";
  static const String rotaMensagem = "/mensagens";

  static Route<dynamic>? generateRoute(RouteSettings routeSettings){

    switch(routeSettings.name){
      case rotaInicial:
        return MaterialPageRoute(
            builder: (_) =>  const AuthPage());

      case rotaLogin:
        return MaterialPageRoute(
            builder: (_) =>  const AuthPage());

      case rotaCadastro:
        return MaterialPageRoute(
            builder: (_) =>  const CadastroPage());

      case rotaHome:
        return MaterialPageRoute(
            builder: (_) =>  const HomePage());

      case rotaMensagem:
        return MaterialPageRoute(
            builder: (_) =>  MensagemPage(routeSettings.arguments as Usuario));
      default:
        _erroRota();
    }
  }
  static Route<dynamic>_erroRota(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(title: const Text("tela nao encontrada"),),
        body: const Center(
          child: Text("tela nao encontrada"),
        ),
      );
    });
  }
}