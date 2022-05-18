import 'package:clean_architecture_whatsapp/app/pages/messages/infra/view_models/message_view_model.dart';
import 'package:flutter/material.dart';

import '../../../core/user/infra/models/usuario_model.dart';

import '../infra/models/message_model.dart';

class MensagemPage extends StatefulWidget {

  MensagemPage(this.contato);

  Usuario contato;
  @override
  _MensagemPageState createState() => _MensagemPageState();
}
class _MensagemPageState extends State<MensagemPage> {
  late MessageViewModel messageViewModel;
  @override
  initState(){
    super.initState();
    messageViewModel = MessageViewModel();
    messageViewModel.recuperarDadosUsuario();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.contato.nome),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image:DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover
              )),
          child:SafeArea(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: messageViewModel.listaMensagens.length,
                          itemBuilder:(context,index){
                            return Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  padding: const EdgeInsets.all(16),
                                  decoration: const BoxDecoration(
                                      color: Color(0xffd2ffa5),
                                      borderRadius: BorderRadius.all(Radius.circular(8))
                                  ),
                                  child: Text(messageViewModel.listaMensagens[index],
                                    style: const TextStyle(fontSize: 14) ,),
                                ),
                              ),
                            );
                          }
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: TextField(
                                  controller: messageViewModel.controllerMensagem,
                                  autofocus: true,
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                    contentPadding:
                                    const EdgeInsets.fromLTRB(32, 16, 32, 8),
                                    hintText: "Digite uma mensagem...",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(32)),
                                  ),
                                ),
                              ),
                            ),
                            FloatingActionButton(
                              onPressed: () => {},
                              // _enviarMensagem,
                              backgroundColor: const Color(0xff075E54),
                              mini: true,
                              child: const Icon(Icons.send,
                                color: Colors.white,),),
                          ],
                        )
                    )
                  ],
                ),
              )
          )
      ),
    );
  }
}
