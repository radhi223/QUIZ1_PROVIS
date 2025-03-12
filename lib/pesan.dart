import 'package:flutter/material.dart';

class Pesan extends StatelessWidget {
  const Pesan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chats = [
      {"name": "Asep", "message": "Hello! Rauf", "time": "2:30 PM", "unread": 6},
      {"name": "Dewi", "message": "はじめまして、自己紹介。", "time": "12:35 PM", "unread": 3},
      {"name": "Chat group", "message": "Kelly: Hello everyone!", "time": "11:11 AM", "unread": 15},
      {"name": "Siti", "message": "Good morning, how are u?", "time": "10:45 AM", "unread": 0},
      {"name": "Rahmat", "message": "Hello everyone!", "time": "10:21 AM", "unread": 0},
      {"name": "Rauf", "message": "Hello Radhi!", "time": "9:58 AM", "unread": 0},
      {"name": "Fakhri", "message": "Hello Dewi!", "time": "Yesterday", "unread": 0},
      {"name": "Radhi", "message": "Hello Fakhri!", "time": "Monday", "unread": 0},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Message'),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purple[100],
              radius: 25,
            ),
            title: Text(
              chat['name'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(chat['message']),
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat['time'],
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const Spacer(),
                if (chat['unread'] > 0)
                  Container(
                    // margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      shape: BoxShape.circle,
                    ),
                    child: SizedBox(
                            width: 19, // Ukuran tetap untuk bulatan notifikasi
                            height: 19, // Ukuran tetap untuk bulatan notifikasi
                            child: Center(
                              child: Text(
                                chat['unread'].toString(),
                                style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                    ),
                  ),
              ],
            ),
            onTap: () {
              // Navigasi ke halaman chat
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.purple[100],
        child: const Icon(Icons.add),
      ),
    );
  }
}
