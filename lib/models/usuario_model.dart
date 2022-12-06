class UsuarioModel {
  final int? id;
  final String? nome;
  final String? login;
  final String? senha;
  final DateTime? datacadastro;

  UsuarioModel({
    this.id,
    this.nome,
    this.login,
    this.senha,
    this.datacadastro,
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
        id: json["id"],
        nome: json["nome"],
        login: json["login"],
        senha: json["senha"],
        datacadastro: json["dataCadastro"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['login'] = this.login;
    data['senha'] = this.senha;
    data['sataCadastro'] = this.datacadastro;
    return data;
  }
}
