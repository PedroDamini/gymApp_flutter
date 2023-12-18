// import 'dart:js_util';

import 'package:flutte_gym_app/_common/my_colors.dart';
import 'package:flutte_gym_app/_common/my_snackbar.dart';
import 'package:flutte_gym_app/components/field_decoration.dart';
import 'package:flutte_gym_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool queroEntrar = true;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _confirmacaoSenhaController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Accent,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  MyColors.GreenTopGradient,
                  MyColors.GreenBottomGradient,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset("assets/logo.png", height: 128,),
                      const Text(
                        "GymApp",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: getAuthenticationInputDecoration("E-mail"),
                        validator: (String? value) {
                          if (value == null){
                            return "O e-mail não pode ser vazio";
                          }
                          if (value.length < 5){
                            return "tamanho minimo não atingido"; 
                          }
                          if (!value.contains('@')){
                            return "E-mail inválido";
                          }
                          else{
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _senhaController,
                        decoration: getAuthenticationInputDecoration("Senha"),
                        obscureText: true,
                        validator: (String? value) {
                          if (value == null){
                            return "A senha não pode ser vazio";
                          }
                          if (value.length < 5){
                            return "tamanho minimo não atingido"; 
                          }
                          else{
                            return null;
                          }
                        }
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: !queroEntrar,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _confirmacaoSenhaController,
                              decoration: getAuthenticationInputDecoration("Confirme a Senha"),
                              obscureText: true,
                              validator: (String? value) {
                                if (value == null){
                                  return "A confirmação de senha não pode ser vazio";
                                }
                                if (value.length < 5){
                                  return "tamanho minimo não atingido"; 
                                }
                                else{
                                  return null;
                                }
                              }
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _nomeController,
                              decoration: getAuthenticationInputDecoration("Nome"),
                              validator: (String? value) {
                                if (value == null){
                                  return "O nome não pode ser vazio";
                                }
                                if (value.length < 2){
                                  return "tamanho minimo não atingido"; 
                                }
                                else{
                                  return null;
                                }
                              }
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          principalButtonOnpressed();
                        },
                        child: Text((queroEntrar)? "Entrar": "Cadastrar"),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            queroEntrar = !queroEntrar;
                          });
                        },
                        child: Text((queroEntrar)? "Ainda não tem uma conta? Cadastre-se" : "Já tem uma conta? Entre"),)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  principalButtonOnpressed() {
    String email = _emailController.text;
    String senha = _senhaController.text;
    String confirmacaoSenha = _confirmacaoSenhaController.text;
    String nome = _nomeController.text;
    
    if (_formKey.currentState!.validate()) {
      if (queroEntrar){
        print("Entrada validada");
      }else {
        print("${_emailController.text}, ${_senhaController.text}, ${_confirmacaoSenhaController.text}, ${_nomeController.text}");
        _authService.cadastrarUsuario(email: email, senha: senha, 
                                      confirmacaoSenha: confirmacaoSenha,nome: nome)
                                      .then(
                                        (String? erro) {
                                          if (erro != null){
                                            showSnackBar(context: context, texto: erro);
                                          }else{
                                            showSnackBar(
                                              context: context,
                                              texto: "Cadastro Efetuado com Sucesso", 
                                              isErro: false,
                                            );
                                          }
                                        });
      }
    } else {
      print("cadastro valido");
    }
  }
}