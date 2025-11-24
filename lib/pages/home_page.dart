import 'package:ado_chat/pages/appels_page.dart';
import 'package:ado_chat/pages/discussions_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  void enDeveloppement() {
    ScaffoldMessenger.of(context)
    .showSnackBar( const SnackBar(content: Text("Fonctionnalité en développement")));
  }

  final pages = [
    DiscussionsPage(),
    AppelsPage()
  ];

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/logo/logo_ADOChat_1280x1280.png',
              height: 54,
            ),
            const SizedBox(width: 10,),
            Text("ADOChat")
          ],
        ),
        elevation: 15,
        actions: [
          // Bonton Rechercher
          IconButton(onPressed: enDeveloppement, icon: Icon(Icons.search))
        ],

      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: Text('Menu')
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Profil"),
              onTap: enDeveloppement,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Paramètre"),
              onTap: enDeveloppement,
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Aide !"),
              onTap: enDeveloppement,
            ),
            ListTile(
              leading: Icon(Icons.close),
              title: Text("Sortir"),
              onTap: enDeveloppement,
            ),
          ],
        ),
      ),

      
      body: pages[pageIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.2)
          )
        ),
          child: NavigationBar(
          selectedIndex: pageIndex,
          onDestinationSelected: (int index){
            setState(() {
              pageIndex = index;
              
            });
          },
          backgroundColor: Colors.white,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.message), 
              label: 'Discussion',
            ),
            NavigationDestination(
              icon: Icon(Icons.phone), 
              label: 'Appels',
            )
          ]
        ),
      ),


      floatingActionButton: FloatingActionButton(
        //foregroundColor: Colors.white,
        onPressed: enDeveloppement,
        child: Icon(Icons.add)),

    );
  }
}