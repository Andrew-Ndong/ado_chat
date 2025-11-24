import 'package:flutter/material.dart';
import 'package:ado_chat/data/discussion.data.dart'; // contient la liste conversations
import 'package:ado_chat/pages/salon_message_page.dart';

class DiscussionsPage extends StatelessWidget {
  const DiscussionsPage({super.key});

  void affiche(BuildContext context, Map<String, dynamic> conv) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${conv['name']} : ${conv['lastMessage']}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: conversations.length,
      itemBuilder: (context, index) {
        final conv = conversations[index];

        return ListTile(
          leading: Icon(
            conv["icon"],
            size: 48,
          ),
          title: Text(conv["name"]),
          subtitle: Text(conv["lastMessage"]),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                conv["date"],
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              const SizedBox(height: 6),
              if (conv["unread"] > 0)
                Badge.count(
                  count: conv["unread"],
                  backgroundColor: Colors.green,
                ),
            ],
          ),
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SalonMessagePage(
                  name: conv["name"],
                  icon: conv["icon"],
                ),
              ),
            )
          },
        );
      },
    );
  }
}
