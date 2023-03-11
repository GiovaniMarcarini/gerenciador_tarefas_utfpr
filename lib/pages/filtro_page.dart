
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/tarefa.dart';

class FiltroPage extends StatefulWidget{
  static const ROUTE_NAME = '/filtro';
  static const CHAVE_CAMPO_ORDENACAO = 'campoOrdenacao';
  static const CHAVE_USAR_ORDEM_DECRESCENTE = 'usarOrdemDecrescente';
  static const CHAVE_FILTRO_DESCRICAO = 'filtroDescricao';

  @override
  _FiltroPageState createState() => _FiltroPageState();
}

class _FiltroPageState extends State<FiltroPage>{

  late final SharedPreferences pref;
  final descricaoController = TextEditingController();
  String campoOrdenao = Tarefa.CAMPO_ID;
  bool usarOrdemDecrescente = false;
  bool _alterouValores = false;

  @override
  void initiState(){
    super.initState();
    _carregaSharedPreferences();
  }

  Widget build (BuildContext context){
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(title: Text('Filtro e Ordenação'),
          ),
          body: _criarBody,
        ),
        onWillPop: _onClickVoltar,
    );
  }

  Widget _criarBody(){
    return ListView(
      children: [
        Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
          child: Text('Campo para Ordenação'),
        ),
        for (final campo in _camposParaOrdenacao.key)
      ];
    );
  }

  void _carregaSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    pref = prefs;
    setState(() {
      campoOrdenao = pref.getString(FiltroPage.CHAVE_CAMPO_ORDENACAO) ?? Tarefa.CAMPO_ID;
      usarOrdemDecrescente = pref.getBool(FiltroPage.CHAVE_USAR_ORDEM_DECRESCENTE) ?? false;
      descricaoController.text = prefs.getString(FiltroPage.CHAVE_FILTRO_DESCRICAO) ?? '';
    });
  }

}