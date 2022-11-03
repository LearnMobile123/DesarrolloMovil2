import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interfaz/pages/logine_page.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Genre{ masculino, femenino }

class _RegisterPageState extends State<RegisterPage> {
  final _name        = TextEditingController();
  final _email       = TextEditingController();
  final _password    = TextEditingController();
  final _repPassword = TextEditingController();
  final _ciudad      = TextEditingController();
  final _depto       = TextEditingController();
  final _temp        = TextEditingController();

  String _data = "Informacion: ";

  Genre? _genere = Genre.masculino;

  void _showMsg(String msg){
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
     SnackBar(content: Text(msg),
     action: SnackBarAction(
       label: 'Aceptar', onPressed: scaffold.hideCurrentSnackBar),
     )
    );
  }

  void saveUser(User user)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(user));
  }

  void _onRegisterButtonClicked(){
    setState(() {
      if(_password.text == _repPassword.text) {
        String genere = "Masculino";
        if (_genere == Genre.femenino) {
          genere = "Femenino";
        }
        //_data = "Nombre: ${_name.text} \nCorreo electronico: ${_email.text} \nGenero: $genere \nCiudad: ${_ciudad.text} \n Departamento: ${_depto.text} \n Temperatura: ${_temp.text} grados";
        var user = User(
            _name.text, _email.text, _password.text, _ciudad.text, _depto.text, _temp.text);
        saveUser(user);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }else{
        _showMsg("Las constraseñas deben ser iguales;");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center (
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                const Image(image: AssetImage('assets/images/logo.png')),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Nombre'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Email'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _password,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Contraseña'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _repPassword,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Repetir contraseña'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _ciudad,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Ciudad'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _depto,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Departamento'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _temp,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Temperatura'),
                  keyboardType: TextInputType.text,
                ),
                Row(
                  children: [
                    Expanded(
                      child:
                        ListTile(
                          title: const Text('Masculino'),
                          leading: Radio<Genre>(
                            value: Genre.masculino,
                            groupValue: _genere,
                            onChanged: (Genre? value){
                              setState(() {
                                _genere = value;
                              });
                            }
                          ),
                        ),
                      ),
                        Expanded(
                          child: ListTile(
                            title: const Text('Femenino'),
                            leading: Radio<Genre>(
                                value: Genre.femenino,
                                groupValue: _genere,
                                onChanged: (Genre? value){
                                  setState(() {
                                    _genere = value;
                                  });
                                }
                            ),
                          ),
                        ),
                  ],
                ),

                ElevatedButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: (){
                    _onRegisterButtonClicked();
                  },
                  child: const Text("Registrar"),
                ),
                Text(
                  _data,
                  style: const TextStyle(
                    fontSize: 12, fontStyle: FontStyle.italic
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
