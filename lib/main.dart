import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List chats = [
    {
      "id": "1",
      "name": "Matheus",
      "unread-messages": 21,
      "last-message": "Vamo toma uma breja no fim da aula?",
      "unread-messages-date": "21:32"
    },
    {
      "id": "2",
      "name": "Lucas",
      "unread-messages": 4,
      "last-message": "Faz meu TCS? te pago 5 mil",
      "unread-messages-date": "21:00"
    },
    {
      "id": "3",
      "name": "Maria",
      "unread-messages": 2,
      "last-message": "HAHAHAHA",
      "unread-messages-date": "1 JAN"
    },
    {
      "id": "4",
      "name": "Leticia",
      "unread-messages": 0,
      "last-message": "Oiii",
      "unread-messages-date": "7 FEV"
    },
    {
      "id": "5",
      "name": "Celso",
      "unread-messages": 0,
      "last-message": "Passa as resposta ai",
      "unread-messages-date": "12 NOV"
    }
  ];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text('Whatsapp'),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.camera_alt),),
              Tab(text: 'CHAT'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS')
            ],
          ),
          backgroundColor: Color.fromARGB(255, 7, 94, 84),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(''),
                        backgroundColor: Color.fromARGB(255, 7, 94, 84),
                      ),
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(chats[index]["name"].toString()),
                          ),
                          SizedBox(width: 8),
                          if (chats[index]["unread-messages"] > 0)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  chats[index]["unread-messages-date"].toString(),
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                  child: Center(
                                    child: Text(
                                      chats[index]["unread-messages"].toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                      subtitle: Text(chats[index]["last-message"].toString()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.message),
          backgroundColor: Color.fromARGB(255, 7, 94, 84),
        ),
      ),
    );
  }
}
