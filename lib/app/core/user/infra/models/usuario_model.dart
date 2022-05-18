class Usuario{
  late String _nome;
  late String _email;
  late String _senha;
  late String _urlImagem;
  Usuario();

  String get urlImagem => _urlImagem;

  set urlImagem(String value) {
    _urlImagem = value;
  }

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  Map<String, dynamic> toMap() {
    return {
      '_nome': this._nome,
      '_email': this._email
    };
  }
  Usuario.with_JSON(json)
      : _nome = json['_nome'],
        _email = json['_email'];

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario.named(
      nome: map['_nome'] as String,
      email: map['_email'] as String,
      senha: map['_senha'] as String,
      urlImagem: map['_urlImagem'] as String
    );
  }

  Usuario.named({
    required String nome,
    required String email,
    required String senha,
    required String urlImagem,
  })  : _nome = nome,
        _email = email,
        _senha = senha,
        _urlImagem = urlImagem;
}