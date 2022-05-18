import 'package:flutter/material.dart';

import '../infra/models/conversa_model.dart';
class ConversaPage extends StatefulWidget {
  const ConversaPage({Key? key}) : super(key: key);

  @override
  _ConversaPageState createState() => _ConversaPageState();
}

class _ConversaPageState extends State<ConversaPage> {

  List<Conversa> listaConversas = [
    Conversa('Ana claudia','Olá tudo bem','https://firebasestorage.googleapis.com/v0/b/whatsapp-9ff7d.appspot.com/o/perfil%2Fperfil1.jpg?alt=media&token=be470ad3-62d8-450e-9100-a7dd3a2cb9d9'),
    Conversa('Jose Renato','Olá tudo bem','https://firebasestorage.googleapis.com/v0/b/whatsapp-9ff7d.appspot.com/o/perfil%2Fperfil2.jpg?alt=media&token=34ac8215-b956-43e2-8f23-1bc2f3b53170'),
    Conversa('mauricio','Olá tudo bem','https://firebasestorage.googleapis.com/v0/b/whatsapp-9ff7d.appspot.com/o/perfil%2Fperfil4.jpg?alt=media&token=37bcec2e-8fec-425e-ada1-e4224c612b1d'),
    Conversa('Jamilton','Olá tudo bem','https://firebasestorage.googleapis.com/v0/b/whatsapp-9ff7d.appspot.com/o/perfil%2Fperfil5.jpg?alt=media&token=90ea843b-3a2a-46e0-9957-89dcae2315b8')
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listaConversas.length,
        itemBuilder:(context, index){
          Conversa conversa = listaConversas[index];
    return ListTile(contentPadding: const EdgeInsets.fromLTRB(16,8,16,8),
        title:Text(conversa.nome,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16
        ),),
        subtitle: Text(conversa.mensagem,
          style: const TextStyle(
              color: Colors.grey,
              fontSize: 14
          ),),
        leading: CircleAvatar(
          maxRadius: 30,
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(conversa.caminhoFoto),
          ));
    });
  }
}
