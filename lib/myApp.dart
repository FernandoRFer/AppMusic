import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page/SalveMusicList_Page.dart';
import 'package:flutter_application_1/Page/home_Page.dart';
import 'package:flutter_application_1/Page/lista_Page.dart';

import 'Page/Cadastro_Page.dart';
import 'Page/Pesquisa.dart';
import 'Page/cifra_page.dart';
import 'Page/login_page.dart';
import 'Star.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/start': (context) => StartPage(),
        '/pesquisa': (context) => Pesquisa(),
        '/cadastro': (context) => CadastroPage(),
        '/cifra': (context) => Cifra(),
        '/SalveList': (context) => SalveList(),
        '/ListMusic': (context) => ListMusic(),
      },
    );
  }
}
