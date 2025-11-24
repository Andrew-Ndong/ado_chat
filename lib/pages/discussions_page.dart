import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DiscussionsPage extends StatelessWidget {
  DiscussionsPage({super.key});

  List<String> chatRoom = ["Evan's", 'Arthur', 'Raymon'];
  List<String> lastMessage = ['Yo !', "Qu'est-ce qui s'est passé au cours ?", "Bonjour"];

  void affiche() {
    SnackBar(content: Text("$chatRoom[index] : $lastMessage[index]"));
  }
  @override
  Widget build(BuildContext context){
    return 
      ListView.builder(
        itemCount: chatRoom.length,
        itemBuilder: (context, index) =>
          ListTile(
            leading: Icon(Icons.account_circle, size: 64,),
            title: Text(chatRoom[index]),
            subtitle: Text(lastMessage[index]),
            onTap: 
              affiche
          )
        
        );
      // ListTile(
      //   leading: Icon(Icons.account_circle, size: 64,),
      //   title: Text("Evan's"),
      //   subtitle: const Text('Yo ! Ton appli fonctionne ?'),
      //   onTap: () {
      //     // Affiche un message en bas
      //     ScaffoldMessenger.of(context)
      //     .showSnackBar( const SnackBar(content: Text("Fonctionnalité en développement")));
      //   },
      //);
  }
}