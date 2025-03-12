  import 'package:flutter/material.dart';

  class Akademik extends StatelessWidget {
    final List<ClassCard> classes = [
    ClassCard("DPBO", "Rosa A.S", "A+", 3, Colors.red),
    ClassCard("Calculus", "M.Salman", "B+", 2, Colors.blueGrey),
    ClassCard("Provis", "Yudi Wibisono", "A", 3, Colors.purple),
    ClassCard("Machine Learning", "Yaya Wihardi", "B", 2, Colors.blue),
    ClassCard("Japanese", "Matcha Samurai", "A-", 2, Colors.blueAccent),
    ClassCard("Big Data", "Lala Septem Riza", "B+", 3, Colors.green),
  ];
    @override
    Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: const Text("Akademik"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        actions: [
          InkWell(
            onTap: (){},
            child : Icon(Icons.add, color: Colors.black),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: classes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${classes[index].title} clicked")),
                );
              },
              child: Card(
                color: classes[index].color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        classes[index].title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        classes[index].teacher,
                        style: const TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const Spacer(),
                      Text(
                        'Grade : ${classes[index].grade}',
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Text(
                        'Credit : ${classes[index].credits}',
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ClassCard {
  final String title;
  final String teacher;
  final String grade;
  final int credits;
  final Color color;

  ClassCard(this.title, this.teacher, this.grade, this.credits, this.color);
}
