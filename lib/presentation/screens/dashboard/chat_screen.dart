import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mensajes'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const ListTile(
            leading: CircleAvatar(
              child: Text('L'),
            ),
            title: Text('Los 2 hermanos'),
            subtitle: Text('Le esperamos pronto...'),
            trailing: Text('10:00 am'),
          );
        },
      )
    );
  }
}