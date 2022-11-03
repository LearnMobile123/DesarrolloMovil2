import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interfaz/pages/logine_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  void initState(){
    _closeSpash();
    super.initState();
  }
  
  Future<void> _closeSpash() async{
    Future.delayed(const Duration(seconds: 2), () async{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(image: AssetImage('assets/images/logo.png'),
        ),
      ),
    );
  }
}
