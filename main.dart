import 'package:flutter/material.dart';

void main() {
  runApp(const ProjectApp());
}

class ProjectApp extends StatelessWidget {
  const ProjectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark, // Menggunakan tema gelap modern
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: const ProjectDashboard(),
    );
  }
}

class ProjectDashboard extends StatefulWidget {
  const ProjectDashboard({super.key});

  @override
  State<ProjectDashboard> createState() => _ProjectDashboardState();
}

// 'with SingleTickerProviderStateMixin' -> Syarat wajib animasi di Flutter
class _ProjectDashboardState extends State<ProjectDashboard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState(); // Pemanggilan super yang benar
    
    // Mengatur durasi satu putaran penuh (3 detik)
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(); // Membuat animasi berputar terus-menerus tanpa henti
  }

  @override
  void dispose() {
    _animationController.dispose(); // Menghapus animasi saat ditutup agar hemat RAM
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📋 Project Tracker', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1F1F1F),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CARD UTAMA: Ringkasan Progres dengan Piringan Berputar
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1F1F1F),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    // BAGIAN ANIMASI: Piringan Indikator Progres yang Berputar
                    RotationTransition(
                      turns: _animationController, // Menghubungkan widget dengan pengontrol animasi
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [Colors.blue, Colors.purple, Colors.pink],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purple.withOpacity(0.5),
                              blurRadius: 15,
                              spreadRadius: 2,
                            )
                          ],
                        ),
                        child: const Center(
                          child: Icon(Icons.cached, size: 40, color: Colors.white), // Ikon panah berputar di tengah
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Teks di samping piringan animasi
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Proyek Toko Kue', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text('Status: Sedang Sinkronisasi...', style: TextStyle(color: Colors.grey[400], fontSize: 13)),
                          const SizedBox(height: 8),
                          LinearProgressIndicator(
                            value: 0.75,
                            backgroundColor: Colors.grey[800],
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // JUDUL DAFTAR TUGAS
              const Text('Tugas Hari Ini', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 15),

              // LIST TUGAS (TASK ITEMS)
              buildTaskItem('Desain UI Login', 'Prioritas Tinggi', Colors.red, true),
              buildTaskItem('Integrasi Database', 'Sedang Berjalan', Colors.amber, false),
              buildTaskItem('Testing Tanpa Deploy', 'Selesai', Colors.green, true),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi bantuan untuk membuat baris list tugas dengan cepat
  Widget buildTaskItem(String title, String tag, Color tagColor, bool isDone) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1F1F1F),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title, 
                style: TextStyle(
                  fontSize: 15, 
                  fontWeight: FontWeight.w600,
                  decoration: isDone ? TextDecoration.lineThrough : null, // Efek coret jika selesai
                  color: isDone ? Colors.grey : Colors.white,
                )
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: tagColor.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                child: Text(tag, style: TextStyle(color: tagColor, fontSize: 11, fontWeight: FontWeight.bold)),
              )
            ],
          ),
          Icon(
            isDone ? Icons.check_circle : Icons.radio_button_unchecked, 
            color: isDone ? Colors.green : Colors.grey
          )
        ],
      ),
    );
  }
}