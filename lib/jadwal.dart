import 'package:flutter/material.dart';

class Jadwal extends StatelessWidget {
  const Jadwal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalendarScreen(),
    );
  }
}

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDate = DateTime(2025, 3, 11);

  final Map<String, List<Map<String, String>>> schedule = {
    "2025-03-11": [
      {
        'kode': 'IK101',
        'nama': 'DPBO',
        'dosen': 'Rosa A.S.',
        'jam': '08:00 - 10:00',
        'tempat': 'Ruang 101'
      },
      {
        'kode': 'IK102',
        'nama': 'Provis',
        'dosen': 'Yudi Wibisono',
        'jam': '10:30 - 12:30',
        'tempat': 'Ruang 202'
      },
      {
        'kode': 'IK103',
        'nama': 'Bahasa Jepang',
        'dosen': 'Matcha Samurai',
        'jam': '13:30 - 15:30',
        'tempat': 'Ruang 303'
      },
    ]
  };

  final Map<String, List<Map<String, String>>> jadwaltugas = {
    "2025-03-11": [
      {
        'kode': 'IK101',
        'nama': 'DPBO',
        'tugas': 'Buat program sorting dalam Python',
        'deadline': '12 Maret 2025; 23:50',
      },
      {
        'kode': 'IK102',
        'nama': 'Provis',
        'tugas': 'Membuat desain UI Aplikasi Super App UPI',
        'deadline': '12 Maret 2025; 10:00',
      },
    ]
  };


  void _pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => _pickDate(context),
          child: Text('${selectedDate.year} ${_getMonthName(selectedDate.month)}'),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          Icon(Icons.calendar_today, color: Colors.black),
          SizedBox(width: 10),
          Icon(Icons.more_vert, color: Colors.black),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CalendarWidget(selectedDate: selectedDate),
            Divider(),
            ScheduleSection(schedule: schedule, selectedDate: selectedDate, onAdd: () {}),
            tasksheduleSection(schedule: jadwaltugas, selectedDate: selectedDate, onAdd: () {}),
            TodoSection(todos: {}, selectedDate: selectedDate, onAdd: () {}),
            WeatherSection(),
          ],
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    List<String> months = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    return months[month - 1];
  }
}

class tasksheduleSection extends StatelessWidget {
   final Map<String, List<Map<String, String>>> schedule;
  final DateTime selectedDate;
  final VoidCallback onAdd;

  tasksheduleSection({required this.schedule, required this.selectedDate, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    String formattedDate = "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.purple[100],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Jadwal Deadline Pengumpulan Tugas", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            if (!schedule.containsKey(formattedDate) || schedule[formattedDate]!.isEmpty)
              Text('Tidak ada tugas hari ini.', style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic))
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: schedule[formattedDate]!
                    .map(
                      (entry) => Container(
                        width: double.infinity,
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${entry['kode']} - ${entry['nama']}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                Text("Tugas: ${entry['tugas']}", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                                Text("deadline: ${entry['deadline']}", style: TextStyle(fontSize: 14, color: Colors.red[700])),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )


                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}

class ScheduleSection extends StatelessWidget {
  final Map<String, List<Map<String, String>>> schedule;
  final DateTime selectedDate;
  final VoidCallback onAdd;

  ScheduleSection({required this.schedule, required this.selectedDate, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    String formattedDate = "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.purple[100],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Jadwal Kuliah", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            if (!schedule.containsKey(formattedDate) || schedule[formattedDate]!.isEmpty)
              Text('Tidak ada jadwal kuliah.', style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic))
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: schedule[formattedDate]!
                    .map(
                      (entry) => Container(
                        width: double.infinity,
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${entry['kode']} - ${entry['nama']}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                Text("Dosen: ${entry['dosen']}", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                                Text("Jam: ${entry['jam']}", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                                Text("Tempat: ${entry['tempat']}", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )


                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}

class CalendarWidget extends StatelessWidget {
  final DateTime selectedDate;
  CalendarWidget({required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    int daysInMonth = DateTime(selectedDate.year, selectedDate.month + 1, 0).day;
    int firstDayOfWeek = DateTime(selectedDate.year, selectedDate.month, 1).weekday;
    
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (index) {
              return Expanded(
                child: Center(
                  child: Text(
                    ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'][index],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemCount: 42,
            itemBuilder: (context, index) {
              int day = index - firstDayOfWeek + 2;
              return day > 0 && day <= daysInMonth
                  ? Container(
                      decoration: BoxDecoration(
                        color: day == selectedDate.day ? Colors.purple[100] : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          day.toString(),
                          style: TextStyle(
                            color: day == selectedDate.day ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    )
                  : Container();
            },
          ),
        ],
      ),
    );
  }
}

class TodoSection extends StatelessWidget {
  final Map<DateTime, List<String>> todos;
  final DateTime selectedDate;
  final VoidCallback onAdd;

  TodoSection({required this.todos, required this.selectedDate, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.purple[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("To-Do", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                IconButton(icon: Icon(Icons.add), onPressed: onAdd),
              ],
            ),
            SizedBox(height: 8),
            if (todos[selectedDate] == null || todos[selectedDate]!.isEmpty)
              Text('No to-do items', style: TextStyle(fontSize: 16))
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: todos[selectedDate]!
                    .asMap()
                    .entries
                    .map((entry) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Text("${entry.key + 1}. ${entry.value}", 
                              style: TextStyle(fontSize: 16)),
                        ))
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}

class WeatherSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.purple[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Weather', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('22°C', style: TextStyle(fontSize: 24)),
            Text('Rain'),
            SizedBox(height: 8),
            Text('Ciwaruga'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sunrise 05:55 AM'),
                Text('Sunset 06:05 PM'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}