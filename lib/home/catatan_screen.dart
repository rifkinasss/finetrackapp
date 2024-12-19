import 'package:flutter/material.dart';

class CatatanScreen extends StatelessWidget {
  const CatatanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Daftar catatan
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Ganti dengan jumlah catatan
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text('Catatan ${index + 1}'),
                      subtitle: Text('Detail catatan ${index + 1}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
