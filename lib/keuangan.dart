  import 'package:flutter/material.dart';
  import 'package:fl_chart/fl_chart.dart';

  class Keuangan extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(title: const Text('Dashboard Keuangan')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(child: _buildBarChart()),
                  Expanded(child: _buildImageSummary()),
                ],
              ),
            ),
            Expanded(
              child: _buildAdvice(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Financial Overview',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: BarChart(
                BarChartData(
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 50, color: Colors.blue)]),
                    BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 70, color: Colors.green)]),
                    BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 30, color: Colors.orange)]),
                    BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 90, color: Colors.purple)]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSummary() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ringkasan Keuangan Mahasiswa",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Pie Chart
            SizedBox(
              height: 150,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(value: 40, title: "Makan", color: Colors.blue),
                    PieChartSectionData(value: 20, title: "Transportasi", color: Colors.red),
                    PieChartSectionData(value: 30, title: "Kos", color: Colors.green),
                    PieChartSectionData(value: 10, title: "Hiburan", color: Colors.orange),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

Widget _buildAdvice() {
  return Container(
    width: double.infinity, // Memastikan lebar penuh
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Rajin pangkal pandai, hemat pangkal kaya.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 10),
            // Saran Keuangan
            const Text(
              "💡 Saran Keuangan:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text("✅ Buat anggaran bulanan"),
            const Text("✅ Tabung minimal 10% dari pemasukan"),
            const Text("✅ Gunakan transportasi umum untuk hemat biaya"),
            const SizedBox(height: 20),
            const Spacer(),
            const Text(
              "⚠️ WARNING : KURANGI BIAYA MAKAN!!",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}

}
