import 'package:flutter/material.dart';

class NotifikasiScreen extends StatelessWidget {
  const NotifikasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 10, // Ganti dengan jumlah notifikasi
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.notifications),
                title: Text('Notifikasi ${index + 1}'),
                subtitle: Text('Detail notifikasi ${index + 1}'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  // Aksi ketika notifikasi diklik
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
