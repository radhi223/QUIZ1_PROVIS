import 'package:flutter/material.dart';

class Notifikasi extends StatelessWidget {
  const Notifikasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notifikasi'),
        ),
        body: ListView(
          children: const [
            NotificationItem(
              icon: Icon(Icons.campaign),
              title: "Pengumuman",
              subtitle: "Bagi Mahasiswa Yang Belum Membaya...",
              notificationCount: 14,
            ),
            NotificationItem(
              icon: Icon(Icons.calendar_month_outlined),
              title: "Jadwal Perkuliahan",
              subtitle: "Pemograman Visual, 9.30 (C205); Data...",
              notificationCount: 12,
            ),
            NotificationItem(
              icon: Icon(Icons.assignment),
              title: "Tugas",
              subtitle: "Tubes 1 Provis (besok, 19.00)",
              notificationCount: 11,
            ),
            NotificationItem(
              icon: Icon(Icons.payment),
              title: "Tagihan UKT",
              subtitle: "Mohon Untuk Segera Membayar UKT a...",
              notificationCount: 9,
            ),
          ],
        ),
      );
  }
}

class NotificationItem extends StatelessWidget {
  final Icon icon;
  final String title;
  final String subtitle;
  final int notificationCount;

  const NotificationItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.notificationCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: ListTile(
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle, overflow: TextOverflow.ellipsis),
      trailing: CircleAvatar(
        backgroundColor: Colors.purple[300],
        radius: 12,
        child: Text(
          notificationCount.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    ),
    );
  }
}
