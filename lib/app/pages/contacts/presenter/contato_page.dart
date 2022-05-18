
import 'package:clean_architecture_whatsapp/app/pages/home/infra/view_models/home_view_model.dart';
import 'package:flutter/material.dart';

import '../../../core/configs/app_routes.dart';
import '../../../core/user/infra/models/usuario_model.dart';
import '../infra/view_models/contacts_view_model.dart';

class ContatoPage extends StatefulWidget {
  const ContatoPage({Key? key}) : super(key: key);

  @override
  _ContatoPageState createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  late ContactsViewModel contactsViewModel;
  @override
  initState(){
    super.initState();
    contactsViewModel = ContactsViewModel();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Usuario>>(
      future: contactsViewModel.recuperarContatos(),
        builder: (context,snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  children: const [
                    Text("Carregando Contatos")
                  ],
                )
              );
              break;
            case ConnectionState.active:
              return Center(
                  child: Column(
                    children: const [
                      Text("Carregando Contatos")
                    ],
                  )
              );
              break;
            case ConnectionState.done:
             return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder:(context, index){
                    Usuario usuario = snapshot.data![index];
                    return ListTile(contentPadding: const EdgeInsets.fromLTRB(16,8,16,8),
                        onTap: (){
                          Navigator.pushNamed(context, AppRoutes.rotaMensagem,
                          arguments: usuario);
                        },
                        title:Text(usuario.nome,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),),
                        // leading: CircleAvatar(
                        //   maxRadius: 30,
                        //   backgroundColor: Colors.grey,
                        //   backgroundImage: NetworkImage(usuario.urlImagem),
                        // )
                    );
                  });
              break;
            default:
              break;
          } return Center(
              child: Column(
                children: const [
                  Text("Erro ao carregar Contatos")
                ],
              )
          );
        },
    );
  }
}

