import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'catatan_screen.dart';
import 'notifikasi_screen.dart';
import 'profile_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.title});

  final String title;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0; // Menyimpan index halaman yang dipilih

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(), // Home screen
    CatatanScreen(), // Catatan screen
    NotifikasiScreen(), // Notifikasi screen
    ProfileScreen(), // Profile screen
  ];

  // Fungsi untuk mengubah halaman sesuai pilihan bottom navigation
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Tambahkan aksi untuk menu jika perlu
          },
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/plane.png'),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon:
                  Icon(Icons.home, color: Colors.black), // Ikon berwarna hitam
              label: '', // Hapus teks label
            ),
            BottomNavigationBarItem(
              icon:
                  Icon(Icons.note, color: Colors.black), // Ikon berwarna hitam
              label: '', // Hapus teks label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications,
                  color: Colors.black), // Ikon berwarna hitam
              label: '', // Hapus teks label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  color: Colors.black), // Ikon berwarna hitam
              label: '', // Hapus teks label
            ),
          ],
          selectedItemColor:
              const Color(0xFF5A57E3), // Warna ikon yang dipilih menjadi ungu
          unselectedItemColor:
              Colors.black, // Warna ikon yang tidak dipilih menjadi hitam
          backgroundColor:
              const Color(0xFF5A57E3) // Latar belakang bottom bar berwarna ungu
          ),
    );
  }
}
