import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Constants/colors.dart';
import '../WebServices/auth_service.dart';
import '../Widget/card_widget.dart';
import '../Widget/logo_widget.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({Key? key}) : super(key: key);

  @override
  _ConnexionPageState createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void onForgotPasswordClicked(BuildContext context) {
    GoRouter.of(context).go('/reinitialisation');
  }

  void onCreateAccountClicked(BuildContext context) {
    GoRouter.of(context).go('/inscription');
  }

  Future<void> onLoginClicked() async {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;
      try {
        String? token = await AuthService().loginUser(email, password);
        if (token != null)
          showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Registration Success'),
            content: Text("Utilisateur connecté"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.go('/');
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      else {
        setState(() {
        });
      }
      } catch (e) {
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenApp,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoWidget(),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 559,
                  child: CustomCard(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Bienvenue',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            'Bon retour ! Entrez vos informations pour accéder à votre espace !',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Ce champ est requis';
                              }if (!value.contains('@') && !value.contains('.')) {
                                return 'Veuillez entrer une adresse e-mail valide';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Votre Email',
                            ),
                          ),
                          TextFormField(
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Ce champ est requis';
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Votre mot de passe',
                            ),
                          ),
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: () => onForgotPasswordClicked(context),
                            child: const Text(
                              'Mot de passe oublié ?',
                              style: TextStyle(
                                color: greenApp,
                                decoration: TextDecoration.underline,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 30),
                          InkWell(
                            onTap: () => onCreateAccountClicked(context),
                            child: const Text(
                              'Vous n’avez pas de compte ? Créer un compte',
                              style: TextStyle(
                                color: greenApp,
                                decoration: TextDecoration.underline,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              onPressed: onLoginClicked,
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: greenApp,
                                side: const BorderSide(color: greenApp, width: 2),
                              ),
                              child: const Text(
                                'Connexion',
                                style: TextStyle(color: greenApp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
