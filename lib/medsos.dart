import 'package:flutter/material.dart';
import 'akademik.dart';
import 'keuangan.dart';
import 'mentalhealth.dart';

class Medsos extends StatelessWidget {
  const Medsos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
            hintText: "cari pengumuman, materi kuliah",
            prefixIcon: Icon(Icons.menu, color: Colors.black),
            suffixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
        actions: [
          InkWell(
            onTap: (){},
            child : Icon(Icons.account_circle, color: Colors.black, size: 30),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: 
              Stack(
                children: [
                  Row(
                    children: [
                      Icon(Icons.image, size: 150),
                      SizedBox(width: 10),
                      Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Beasiswa Sempurna', style: TextStyle(fontWeight: FontWeight.bold)),
                                Text('Beasiswa untuk siswa berprestasi. Minimal mahasiswa semester 5.'),
                                Padding(padding: const EdgeInsets.all(20)),
                              ],
                            ),
                          ),
                    ],
                  ),

                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: (){}, 
                                  icon: Icon(Icons.chevron_left, size: 30),
                                  
                                  ),
                                SizedBox(width: 10),
                                IconButton(
                                  onPressed: (){}, 
                                  icon: Icon(Icons.chevron_right, size: 30),
                                ),
                              ],
                            ),
                          ),
                ],
              )
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Kuliah hari ini...", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Pemrograman Visual, 9.30 (C205); Data mining 13.00 (C307)"),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tugas", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Tubes 1 Provis (besok, 19.00)"),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: (){
                      Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MentalHealth()),
                          );

                    },
                    child: 
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.purple[50],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.favorite_border, size: 50, color: Colors.purple),
                          ),
                          SizedBox(height: 5),
                          Text("Mental Health"),
                        ],
                      ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Akademik()),
                          );

                    },
                    child: 
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.purple[50],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.folder, size: 50, color: Colors.purple),
                          ),
                          SizedBox(height: 5),
                          Text("Akademik"),
                        ],
                      ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Keuangan()),
                          );

                    },
                    child: 
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.purple[50],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.content_cut, size: 50, color: Colors.purple),
                          ),
                          SizedBox(height: 5),
                          Text("Keuangan"),
                        ],
                      ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
