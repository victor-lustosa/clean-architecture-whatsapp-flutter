import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../chat/presenter/conversa_page.dart';
import '../../contacts/presenter/contato_page.dart';
import '../infra/view_models/home_view_model.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  late TabController tabController;
  late HomeViewModel homeViewModel;

  @override
  void initState() {
    homeViewModel = HomeViewModel();
    homeViewModel.verificaUsuarioLogado(context);
    homeViewModel.recuperarEmail();
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Whatsapp'),
          bottom: TabBar(
            controller: tabController,
            indicatorColor: Colors.white,
            indicatorWeight: 2.7,
            labelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
            tabs: const <Widget>[
              Tab(text: "Conversas"),
              Tab(text: "Contatos"),
            ],),actions:<Widget> [
          PopupMenuButton<String>(
              onSelected:(selected) => homeViewModel.escolhaMenuItem(selected, context),
              itemBuilder: (context) {
            return homeViewModel.itensMenu.map((String item) {
              return PopupMenuItem<String>(value: item, child: Text(item));
            },).toList();
          })],
        ),
        body: TabBarView(
          controller: tabController,
          children: const [
            ConversaPage(),
            ContatoPage(),
          ],
        )
    );
  }
}
