class Message{

  final String _idUsuario;
  final String _mensagem;
  final String _urlImagem;
  final String _tipo;

  const Message({
    required String idUsuario,
    required String mensagem,
    required String urlImagem,
    required String tipo,
  })  : _idUsuario = idUsuario,
        _mensagem = mensagem,
        _urlImagem = urlImagem,
        _tipo = tipo;
}