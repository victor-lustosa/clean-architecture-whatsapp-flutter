
import 'package:clean_architecture_whatsapp/app/pages/auth/infra/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';

import '../../../core/configs/app_routes.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  late AuthViewModel authViewModel;

  @override
  void initState() {
    authViewModel = AuthViewModel();
    authViewModel.verificaUsuarioLogado(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xff075E54)),
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 200,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: authViewModel.controllerEmail,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "E-mail",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32))),
                  ),
                ),
                TextField(
                  controller: authViewModel.controllerSenha,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Senha",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32)),
                          primary: Colors.green,
                          padding: const EdgeInsets.fromLTRB(32, 18, 32, 18),
                          textStyle: const TextStyle(fontSize: 20)),
                      onPressed: () {
                        authViewModel.validarCampos(context);
                      },
                      child: const Text(
                        "Entrar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                ),
                Center(
                  child: GestureDetector(
                    child: const Text("Não tem conta? cadastre-se!",
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.rotaCadastro);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Center(
                      child: Text(
                        authViewModel.mensagemErro,
                    style: const TextStyle(color: Colors.red, fontSize: 20),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
