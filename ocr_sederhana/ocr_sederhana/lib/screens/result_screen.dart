import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'home_screen.dart';

class ResultScreen extends StatefulWidget {
  final String ocrText;

  const ResultScreen({super.key, required this.ocrText});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late FlutterTts flutterTts;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    _initTts();
  }

  // Inisialisasi pengaturan TTS
  Future<void> _initTts() async {
    await flutterTts.setLanguage("id-ID"); // Bahasa Indonesia
    await flutterTts.setSpeechRate(0.5);   // Kecepatan bicara
    await flutterTts.setVolume(1.0);       // Volume maksimal
    await flutterTts.setPitch(1.0);        // Nada normal
  }

  // Fungsi membacakan teks OCR
  Future<void> _speakText() async {
    if (widget.ocrText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tidak ada teks untuk dibacakan.')),
      );
      return;
    }
    await flutterTts.speak(widget.ocrText);
  }

  @override
  void dispose() {
    flutterTts.stop(); // hentikan suara saat keluar halaman
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil OCR'),
        actions: [
          IconButton(
            icon: const Icon(Icons.copy),
            tooltip: 'Salin teks',
            onPressed: () {
              if (widget.ocrText.isNotEmpty) {
                Clipboard.setData(ClipboardData(text: widget.ocrText));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Teks berhasil disalin ke clipboard!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: SelectableText(
            widget.ocrText.isEmpty
                ? 'Tidak ada teks ditemukan.'
                : widget.ocrText,
            style: const TextStyle(fontSize: 18, height: 1.5),
          ),
        ),
      ),

      // Dua FloatingActionButton: Home dan TTS
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "tts",
            backgroundColor: Colors.blueAccent,
            tooltip: 'Bacakan teks',
            onPressed: _speakText,
            child: const Icon(Icons.volume_up),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: "home",
            tooltip: 'Kembali ke Menu Utama',
            onPressed: () {
              flutterTts.stop(); 
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false,
              );
            },
            child: const Icon(Icons.home),
          ),
        ],
      ),
    );
  }
}