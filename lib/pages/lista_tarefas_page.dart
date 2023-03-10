

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/tarefa.dart';
import 'conteudo_form_dialog.dart';

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
        onPressed: _abrirForm(),
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

  void _abrirForm({Tarefa? tarefaAtual, int? index}){
    final key = GlobalKey<ConteudoFormDialogState>();
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(tarefaAtual == null ? 'Nova tarefa' :
            ' Alterar a tarefa ${tarefaAtual.id}'),
            content: ConteudoFormDialog(key: key, tarefaAtual: tarefaAtual),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  if (key.currentState != null && key.currentState!.dadosValidados()){
                    setState(() {
                      final novaTarefa = key.currentState!.novaTarefa;
                    });
                  }
                },
                child: Text('Salvar'),
              )
            ],
          );
        }
    );
  }
}