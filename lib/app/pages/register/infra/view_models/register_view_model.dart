import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/configs/app_routes.dart';
import '../../../../core/user/infra/models/usuario_model.dart';
class RegisterViewModel{
  //controladores
  final TextEditingController controllerNome = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerSenha = TextEditingController();

  String mensagemErro = "";

  validarCampos(context){
    String nome = controllerNome.text;
    String email = controllerEmail.text;
    String senha = controllerSenha.text;

    if(nome.length >= 3){
      if( email.isNotEmpty && email.contains('@')){
        if( senha.isNotEmpty && senha.length > 6){
          Usuario usuario = Usuario();
          usuario.nome = nome;
          usuario.email = email;
          usuario.senha = senha;
          _cadastrarUsuario(usuario, context);
          // setState(() {
            mensagemErro = "";
          // });
        }else{
          //setState(() {
            mensagemErro = "Preencha o campo senha";
          //});
        }
      }else{
        // setState(() {
          mensagemErro = "Preencha o email utilizando @";
        // });
      }
    } else{
      //setState(() {
        mensagemErro = "Nome precisa ter mais que 3 caracteres";
      //});
    }
  }

  _cadastrarUsuario(Usuario usuario, context){
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.createUserWithEmailAndPassword(
        email: usuario.email,
        password: usuario.senha).then((firebaseUser){
      //salvando dados do usuario
      FirebaseFirestore db = FirebaseFirestore.instance;
      db.collection("usuarios").doc(
          firebaseUser.user?.uid
      ).set(usuario.toMap());
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.rotaHome,(_)=> false);
    }).catchError((error){
      print(error.toString());
    });
  }
}