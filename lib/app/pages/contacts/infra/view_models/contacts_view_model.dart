import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/user/infra/models/usuario_model.dart';

class ContactsViewModel{

  Future <List<Usuario>> recuperarContatos() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await db.collection("usuarios").get();
    List<Usuario> listaUsuarios = [];
    for(DocumentSnapshot item in querySnapshot.docs){
      var usuario =  item.data();
      Usuario usu = Usuario.with_JSON(usuario);
      listaUsuarios.add(usu);
    }
    return listaUsuarios;
  }

}