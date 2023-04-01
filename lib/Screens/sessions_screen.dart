import 'package:flutter/material.dart';
import 'package:global_app_fitness/Data/sp_helper.dart';
import '../Data/session.dart';
import '../Shared/menu_bottom.dart';
import '../Shared/menu_drawer.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({super.key});


  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  List<Session> sessions = [];
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();
  final SPHelper spHelper = SPHelper();
  @override
  void initState() {
    spHelper.init().then((value) {
      updateScreen();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuButton(),
      appBar: AppBar(
        title: const Text('Your Training Sessions'),
      ),
      body: ListView(
        children: getContent()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showSessionDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> showSessionDialog(BuildContext context)async{
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Insert Training Session'),
            content: SingleChildScrollView(
              child:Column(
                children: [
                  TextField(
                    controller: txtDescription,
                    decoration: const InputDecoration(
                      hintText: 'Description'
                    ),
                  ),
                  TextField(
                    controller: txtDuration,
                    decoration: const InputDecoration(
                      hintText: 'Duration'
                    ),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
                txtDuration.text = '';
                txtDescription.text = '';
                setState(() {});
              },
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: saveSession,
                  child: const Text('Save'))
            ],
          );
        },
    );
  }
  Future saveSession()async{
    DateTime now = DateTime.now();
    String today = '${now.day}-${now.month}-${now.year}';
    int id = spHelper.getCounter() + 1;
    Session session = Session(id, today, txtDescription.text, int.tryParse(txtDuration.text)??0);
    spHelper.writeSession(session).then((value){
        updateScreen();
        spHelper.setCounter();
    }
    );
    txtDuration.text = '';
    txtDescription.text = '';
    Navigator.pop(context);
  }
  List<Widget> getContent(){
    List<Widget> tiles = [];
    for (var session in sessions) {
      tiles.add(Dismissible(
        key: UniqueKey(),
        onDismissed: (_){
          spHelper.deleteItem(session.id).then((value) => updateScreen());
        },
        child: ListTile(
          title: Text(session.description),
          subtitle: Text('${session.date} - duration: ${session.duration} min'),
        ),
      ));
    }
    return tiles;
  }
  void updateScreen(){
    setState(() {sessions = spHelper.getSessions();});
  }
}
