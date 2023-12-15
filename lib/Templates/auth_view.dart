// import 'dart:js_util';

import 'package:flutte_gym_app/_common/my_colors.dart';
import 'package:flutte_gym_app/components/field_decoration.dart';
import 'package:flutter/material.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool queroEntrar = true;

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
                        decoration: getAuthenticationInputDecoration("E-mail"),
                        validator: (String? value) {
                          if (value == null){
                            return "O e-mail não pode ser vazio";
                          }
                          if (value.contains("@")){
                            return "O e-mail deve ter @";
                          }
                          if (value.length > 10){
                            return "tamanho minimo não atingido"; 
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
                        decoration: getAuthenticationInputDecoration("Senha"),
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: !queroEntrar,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: getAuthenticationInputDecoration("Confirme a Senha"),
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: getAuthenticationInputDecoration("Nome")
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
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
}