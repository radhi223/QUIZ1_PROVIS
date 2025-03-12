import 'package:flutter/material.dart';

class Elearning extends StatefulWidget {
  const Elearning({Key? key}) : super(key: key);

  @override
  _ElearningState createState() => _ElearningState();
}

class _ElearningState extends State<Elearning> {
  final List<Widget> _pages = [
    // Halaman Materi
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Text("Materi Kuliah", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Algoritma dan Pemrograman - Sorting", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("Penjelasan tentang berbagai algoritma sorting seperti Bubble Sort, Quick Sort, dan Merge Sort."),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    // Halaman Tugas
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          for (var task in [
             {
                "title": "Tugas 1 - DPBO",
                "deadline": "12 Maret 2025",
                "details": "Buat program sorting dalam Python",
                "course": "Desain dan Pemrograman Berorientasi Objek"
              },
              {
                "title": "Tugas 2 - Provis",
                "deadline": "12 Maret 2025",
                "details": "Membuat desain UI Aplikasi Super App UPI",
                "course": "Pemrograman Visual dan Piranti Bergerak"
              },
              {
                "title": "Tugas 3 - Bahasa Jepang",
                "deadline": "18 Maret 2025",
                "details": "Mempelajari bentuk kalimat keigo",
                "course": "Bahasa Jepang"
              },
              {
                "title": "Tugas 4 - Kalkulus",
                "deadline": "19 Maret 2025",
                "details": "Mempelajari bentuk-bentuk turunan",
                "course": "Kalkulus"
              },
              {
                "title": "Tugas 5 - Machine Learning",
                "deadline": "20 Maret 2025",
                "details": "Membuat Model untuk prediksi harga saham",
                "course": "Machine Learning"
              },
              {
                "title": "Tugas 4 - Big Data",
                "deadline": "21 Maret 2025",
                "details": "Mencoba skenario secondary namenode mati",
                "course": "Big Data"
              },
          ])
            Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(task["title"]!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text("Mata Kuliah: ${task["course"]!}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                          SizedBox(height: 8),
                          Text("Deadline: ${task["deadline"]!}", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text("Detail: ${task["details"]!}"),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.upload_file, color: Colors.blue, size: 30),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    ),
    // Halaman People
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Text("Daftar Mahasiswa", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          ListTile(
            leading: CircleAvatar(child: Text("A")),
            title: Text("Naufal Fakhri Al-Najieb"),
            subtitle: Text("NIM: 2309648"),
          ),
          ListTile(
            leading: CircleAvatar(child: Text("B")),
            title: Text("Muhammad Radhi Maulana"),
            subtitle: Text("NIM: 2311119"),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("E-learning"),
          bottom: TabBar(
            indicatorColor: Colors.purple[200],
            labelColor: Colors.purple[200],
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.menu_book), text: "Materi"),
              Tab(icon: Icon(Icons.assignment), text: "Tugas"),
              Tab(icon: Icon(Icons.people), text: "People"),
            ],
          ),
        ),
        body: TabBarView(
          children: _pages,
        ),
      ),
    );
  }
}