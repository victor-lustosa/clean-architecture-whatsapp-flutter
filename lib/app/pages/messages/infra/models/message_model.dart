import '../../domain/entities/message.dart';

class MessageModel extends Message {

  late String _idUsuario;
  late String _mensagem;
  late String _urlImagem;
  late String _tipo;

  MessageModel({
    required String idUsuario,
    required String mensagem,
    required String urlImagem,
    required String tipo,
  })
      : _idUsuario = idUsuario,
        _mensagem = mensagem,
        _urlImagem = urlImagem,
        _tipo = tipo,
        super(idUsuario: idUsuario,
          mensagem: mensagem,
          tipo: tipo,
          urlImagem: urlImagem);

  get getTipo => _tipo;

  setTipo(String value) {
    _tipo = value;
  }

  String get urlImagem => _urlImagem;

  set urlImagem(String value) {
    _urlImagem = value;
  }

  String get mensagem => _mensagem;

  set mensagem(String value) {
    _mensagem = value;
  }

  String get idUsuario => _idUsuario;

  set idUsuario(String value) {
    _idUsuario = value;
  }

  Map<String, dynamic> toMap() {
    return {
      '_idUsuario': _idUsuario,
      '_mensagem': _mensagem,
      '_urlImagem': _urlImagem,
      '_tipo': _tipo,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel.json(
        idUsuario: map['_idUsuario'],
        mensagem: map['_mensagem'],
        urlImagem: map['_urlImagem'],
        tipo: map['_tipo']
    );
  }

  MessageModel.json({
    required String idUsuario,
    required String mensagem,
    required String urlImagem,
    required String tipo,
  })
      : _idUsuario = idUsuario,
        _mensagem = mensagem,
        _urlImagem = urlImagem,
        _tipo = tipo,
        super(idUsuario: idUsuario,
          mensagem: mensagem,
          tipo: tipo,
          urlImagem: urlImagem);

}