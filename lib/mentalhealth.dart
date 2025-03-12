  import 'package:flutter/material.dart';

  class MentalHealth extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Mental Health'),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.purple,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Stay alert to stay safe',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('Scan QR Code pressed');
                    },
                    child: const Text('Scan QR Code'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: const [
                  HealthServiceItem(icon: Icons.self_improvement, label: 'Self-Care & Well-being'),
                  HealthServiceItem(icon: Icons.people_outline, label: 'Peer Support'),
                  HealthServiceItem(icon: Icons.psychology, label: 'Mental Health Support'),
                  HealthServiceItem(icon: Icons.support_agent, label: 'Counseling Services'),
                  HealthServiceItem(icon: Icons.phone, label: 'Hotline'),
                  HealthServiceItem(icon: Icons.local_hospital, label: 'Healthcare Facility'),
                ],
              ),
            ),
          ],
        ),
      );
  }
}

class HealthServiceItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const HealthServiceItem({Key? key, required this.icon, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('$label tapped');
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.purple,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}