import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoly/data/models/task.dart';
import '../../data/models/data.dart';

class ToDoScreen extends StatelessWidget {

  const ToDoScreen({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      List<Task> toDoTasks;
    toDoTasks = tasks.where((element) => element.isDone == false).toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(tasks[index].taskName),
          subtitle: Text(DateFormat('dd/MM').add_jm().format(toDoTasks[index].dueDate!)),

        );
      },
      itemCount: toDoTasks.length,
    );
    /* SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 900,
          ),
          GestureDetector(
            onTap: () {
              /* Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return DoneScreen(
                    screenName: 'test',
                  );
                }),
              ); */
              Navigator.of(context).pushNamed(AddTaskScreen.routeName);
            },
            child: Container(
              height: MediaQuery.of(context).size.height * .2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                //BorderRadius.only(topLeft: Radius.circular(50)),
                gradient: LinearGradient(
                  colors: [
                    Colors.red,
                    Colors.yellow,
                    Colors.blue,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                //color: Colors.red,
                border: Border.all(
                  color: Colors.black,
                  width: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    ); */
  }
}
