import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/message_model.dart';



class MessageViewModel{
  final TextEditingController controllerMensagem = TextEditingController();
  String _idUsuarioLogado = '';

  enviarMensagem(){
    String textoMensagem = controllerMensagem.text;
    if(textoMensagem.isNotEmpty){
      // MessageModel mensagemModel = MessageModel();
      // mensagemModel.idUsuario = _idUsuarioLogado;
      // mensagemModel.mensagem = textoMensagem;
      // mensagemModel.urlImagem = "";
      // mensagemModel.tipo = "texto";
    }
  }
  salvarMensagem(){

  }
  recuperarDadosUsuario()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User usuarioLogado = await auth.currentUser!;
    _idUsuarioLogado = usuarioLogado.uid;
  }

  List<String> listaMensagens = [
    'ola, tudo bem?',
    'tudo otimo, e contigo?',
    'Estou bem, queria ver uma coisa contigo, voce vai na corrida?',
    'nao sei ainda, cara',
    'porque se voce fosse, eu poderia te da um carona',
    'ahh sim, blz',
    'te aviso depois',
    'blz'
  ];
}