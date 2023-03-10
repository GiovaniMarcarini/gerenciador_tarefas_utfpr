

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/tarefa.dart';

class ListaTarefasPage extends StatefulWidget{

  @override
  _ListaTarefasPageState createState() => _ListaTarefasPageState();
}

class _ListaTarefasPageState extends State<ListaTarefasPage>{

  final tarefas = <Tarefa>[
    //Tarefa(id: 1, descricao: 'Exercícios em sala de aula',
    //prazo: DateTime.now().add(Duration(days: 5))
   // ),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: _criarAppBar(),
      body: _criarBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Nova Tarefa',
        child: Icon(Icons.add),
      ),
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

  Widget _criarBody(){
    if(tarefas.isEmpty){
      return const Center(
        child: Text('Nenhuma tarefa cadastrada',
       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    }
    return ListView.separated(
        itemBuilder: (BuildContext context, int index){
          final tarefa = tarefas[index];
          return ListTile(
            title: Text('${tarefa.id} - ${tarefa.descricao}'),
            subtitle: Text(tarefa.prazo == null ? 'Sem prazo definido' : 'Prazo - ${tarefa.prazo}'),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: tarefas.length,
    );
  }
}