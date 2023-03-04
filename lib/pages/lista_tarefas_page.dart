

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/tarefa.dart';

class ListaTarefasPage extends StatefulWidget{

  @override
  _ListaTarefasPageState createState() => _ListaTarefasPageState();
}

class _ListaTarefasPageState extends State<ListaTarefasPage>{

  final tarefas = <Tarefa>[
    Tarefa(id: 1, descricao: 'Exercícios em sala de aula',
    prazo: DateTime.now().add(Duration(days: 5))),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: _criarAppBar(),
    );
  }

  AppBar _criarAppBar() {
    return AppBar(
      title: Text('Gerenciador de Tarefas'),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_list)),
      ],
    );
  }
}