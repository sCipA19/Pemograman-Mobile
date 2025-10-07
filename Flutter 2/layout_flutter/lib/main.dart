import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 🔹 Fungsi untuk membuat kolom tombol
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    // 🔹 Bagian judul (title section)
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pulau Jeju',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Korea Selatan',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          const Text('41'),
        ],
      ),
    );

    // 🔹 Bagian tombol (button section)
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    // 🔹 Bagian teks (text section)
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Pulau Jeju adalah salah satu destinasi populer di Korea Selatan '
        'yang memikat dengan keindahan alamnya yang menakjubkan. '
        'Dikelilingi pantai berpasir hitam, air terjun yang indah, dan gunung Hallasan yang megah, '
        'Jeju menjadi tempat favorit bagi wisatawan lokal maupun mancanegara untuk berlibur dan bersantai. '
        '— Syifa Revalina (2341760041)',
        softWrap: true,
      ),
    );

    // 🔹 Tampilan utama aplikasi
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Layout Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Destinasi Pulau Jeju'),
          backgroundColor: Colors.teal,
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/pulau-jeju-1.jpeg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}
