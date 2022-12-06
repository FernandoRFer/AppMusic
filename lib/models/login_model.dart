class LoginModel {
  final int? id;
  final String? nome;
  final String? login;
  final String? senha;
  final String? datacadastro;

  LoginModel({
    this.id,
    this.nome,
    this.login,
    this.senha,
    this.datacadastro,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        id: json["Id"],
        nome: json["Nome"],
        login: json["Login"],
        senha: json["Senha"],
        datacadastro: json["DataCadastro"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Nome'] = this.nome;
    data['Login'] = this.login;
    data['Senha'] = this.senha;
    data['DataCadastro'] = this.datacadastro;
    return data;
  }
}
