import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page/home_Page.dart';
import 'package:sqflite/sqflite.dart';
import 'Page/Pesquisa.dart';
import 'Page/cifra_page.dart';
import 'Page/playList.dart';
import 'package:path/path.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  late PageController pageViewControler;
  int _paginaAtual = 0;

  @override
  void initState() {
    super.initState();
    pageViewControler = PageController(initialPage: _paginaAtual);
  }
/*
  List<Widget> telas = [
    HomePage(),
    Pesquisa(),
    Home(),
  ];
  */

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body:

          ///telas[_paginaAtual],
          // ignore: prefer_const_literals_to_create_immutables
          IndexedStack(index: _paginaAtual, children: <Widget>[
        HomePage(),
        Pesquisa(),
        PlayList(),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Color.fromARGB(255, 255, 255, 255),
        backgroundColor: Color.fromARGB(46, 0, 0, 0),
        unselectedItemColor: Colors.white70,
        currentIndex: _paginaAtual,
        onTap: (index) {
          // pageViewControler.jumpToPage(index);
          setState(() {
            _paginaAtual = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Busca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.queue_music),
            label: 'Sua Biblioteca',
          ),
        ],
      ),
    );
  }
}
