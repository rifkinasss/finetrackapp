import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({super.key});

  @override
  _AddVehiclePageState createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _vehicleNameController = TextEditingController();
  final TextEditingController _vehicleLicenseController = TextEditingController();
  Uint8List? _imageBytes; // Menyimpan gambar dalam bentuk byte
  final ImagePicker _picker = ImagePicker(); // Instance dari ImagePicker

  // Fungsi untuk memilih gambar
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes; // Simpan gambar sebagai byte
      });
    }
  }

  // Fungsi untuk menyimpan data kendaraan
  Future<void> _saveVehicle() async {
    if (_formKey.currentState!.validate()) {
      // Simpan data kendaraan ke database (misalnya Firebase, atau local)
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Data kendaraan berhasil disimpan')));
      Navigator.pop(context); // Kembali ke layar sebelumnya
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Kendaraan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _vehicleNameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Kendaraan',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama kendaraan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _vehicleLicenseController,
                decoration: const InputDecoration(
                  labelText: 'Nomor Plat Kendaraan',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor plat kendaraan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: _pickImage, // Ketuk untuk memilih gambar
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: _imageBytes == null
                      ? Image.asset(
                          'assets/images/plane.png', // Gambar placeholder
                          fit: BoxFit.cover, 
                        )
                      : Image.memory(_imageBytes!, fit: BoxFit.cover), // Menampilkan gambar yang dipilih
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _saveVehicle,
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
