// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoly/logic/helpers/db_helper.dart';
import 'package:todoly/persentaion/screens/done_screen.dart';
import 'package:todoly/persentaion/screens/to_do_screen.dart';
import 'package:todoly/persentaion/screens/all_tasks_screen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Database? db;
 

  @override
  void initState() {
    intilizeDB();
    super.initState();
  }

  Future<void> intilizeDB() async {
    db = await DBHelper.database();
  }
   int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    AllTasks(),
    ToDoScreen(),
    DoneScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Organize your tasks"),
          
        ),
        body:
 
  Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'All Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alarm),
            label: 'To do',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Done',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple[800],
        onTap: _onItemTapped,
      ),
    ),
     );
     }


    /* DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Organize your tasks"),
          bottom: TabBar(
            // ignore: prefer_const_literals_to_create_immutables
            tabs: [
              Tab(
                child: Text(
                  "All Tasks",
                ),
              ),
              Tab(
                child: Text("ToDo Tasks"),
              ),
              Tab(
                child: Text("Done Tasks"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: tasks
                  .map(
                    (e) => ListTile(
                      title: Text(
                        e.taskName,
                        style: TextStyle(
                          decoration:
                              e.isDone ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      trailing: Checkbox(
                        value: e.isDone,
                        onChanged: (bool? value) {
                          setState(() {
                            e.isDone = value!;
                          });
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
            ToDoScreen(),
            DoneScreen(),
          ],
        ),
      ),
    ); */
  }

