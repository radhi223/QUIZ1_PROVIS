import 'package:flutter/material.dart';
import 'akademik.dart';
import 'keuangan.dart';
import 'mentalhealth.dart';
import 'secondary.dart'; // Import secondary.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz 1"), centerTitle: true,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 50,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondaryScreen(iteration: 0)),
                  );
                },
                child: Text("Go to Main Screen"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondaryScreen(iteration: 1)),
                  );
                },
                child: Text("Go to E-Learning"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondaryScreen(iteration: 2)),
                  );
                },
                child: Text("Go to Jadwal & To-do"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondaryScreen(iteration: 3)),
                  );
                },
                child: Text("Go to Pesan & Group"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondaryScreen(iteration: 4)),
                  );
                },
                child: Text("Go to Notifikasi"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MentalHealth()),
                  ).then((_) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondaryScreen(iteration: 0)),
                    );
                  });
                },
                child: Text("Go to Mental Health"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Akademik()),
                  ).then((_) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondaryScreen(iteration: 0)),
                    );
                  });
                },
                child: Text("Go to Akademik"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Keuangan()),
                  ).then((_) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondaryScreen(iteration: 0)),
                    );
                  });
                },
                child: Text("Go to Keuangan"),
              ),
              SizedBox(height: 150,)
          ],
        )
      ),
    );
  }
}