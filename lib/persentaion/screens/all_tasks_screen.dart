import 'package:flutter/material.dart';
import 'package:todoly/data/models/task.dart';
import '../../data/models/data.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({
    Key? key,
  }) : super(key: key);

  @override
  _AllTasksState createState() => _AllTasksState();
}

DateTime? taskDueDate = DateTime.now();
TextEditingController taskNameController = TextEditingController();

class _AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () async {
          /* Navigator.of(context)
                .pushNamed(AddTaskScreen.routeName, arguments: tasks); */
          await showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                  height: 700,
                  color: Colors.white10,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                TextField(
                                  controller: taskNameController,
                                  // onChanged: (val) {
                                  //   print(val);
                                  // },
                                  //keyboardType: TextInputType.number,
                                  //enabled: false,
                                  decoration: InputDecoration(
                                    hintText: "Enter Task Name",
                                    label: const Text("Task Name"),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextButton(
                                  onPressed: () async {
                                    taskDueDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2070));
                                  },
                                  child: const Text("Due Data"),
                                  style: TextButton.styleFrom(
                                      primary: Colors.deepPurple),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                if (taskNameController.text != "") {
                                  Navigator.of(context).pop();
                                  tasks.add(Task(
                                      taskName: taskNameController.text,
                                      dueDate: taskDueDate));
                                }
                              },
                              child: const Text("Add Task")),
                        ],
                      ),
                    ),
                  ));
            },
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              tasks[index].taskName,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    decoration:
                        tasks[index].isDone ? TextDecoration.lineThrough : null,
                  ),
            ),
            trailing: Checkbox(
              onChanged: (val) {
                setState(() {
                  tasks[index].isDone = val!;
                  if (tasks[index].isDone) {
                    tasks[index].doneTime = DateTime.now();
                  }
                });
              },
              value: tasks[index].isDone,
            ),
          );
        },
        itemCount: tasks.length,
      ),
    );
  }
}
