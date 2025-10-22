import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'home_screen.dart';

class ResultScreen extends StatefulWidget {
  final String ocrText;

  const ResultScreen({super.key, required this.ocrText});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late final FlutterTts _flutterTts;
  bool _isSpeaking = false;

  @override
  void initState() {
    super.initState();
    _flutterTts = FlutterTts();
    _setupTts();

    _flutterTts.setStartHandler(() {
      setState(() => _isSpeaking = true);
    });
    _flutterTts.setCompletionHandler(() {
      setState(() => _isSpeaking = false);
    });
    _flutterTts.setErrorHandler((err) {
      setState(() => _isSpeaking = false);
    });
  }

  Future<void> _setupTts() async {
    try {
      // Bahasa Indonesia
      await _flutterTts.setLanguage("id-ID");
      await _flutterTts.setSpeechRate(0.45);
      await _flutterTts.setPitch(1.0);
    } catch (_) {
      // cukup diabaikan bila error
    }
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }

  Future<void> _speak() async {
    final text = widget.ocrText.trim();
    if (text.isEmpty) return;

    // Jika sedang berbicara, hentikan; tekan lagi untuk memulai ulang
    if (_isSpeaking) {
      await _flutterTts.stop();
      return;
    }

    await _flutterTts.speak(text);
  }

  void _goHomeAndClearStack() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final displayText =
        widget.ocrText.isEmpty ? 'Tidak ada teks ditemukan.' : widget.ocrText;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil OCR'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: SelectableText(
            displayText,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Tombol Home
          FloatingActionButton(
            heroTag: 'home_fab',
            onPressed: _goHomeAndClearStack,
            tooltip: 'Kembali ke Home',
            backgroundColor: Colors.deepPurple,
            child: const Icon(Icons.home),
          ),
          const SizedBox(height: 12),
          // Tombol TTS
          FloatingActionButton(
            heroTag: 'tts_fab',
            onPressed: _speak,
            tooltip: _isSpeaking ? 'Berhenti membacakan' : 'Bacakan Teks',
            backgroundColor: Colors.deepPurple,
            child: Icon(_isSpeaking ? Icons.stop : Icons.volume_up),
          ),
        ],
      ),
    );
  }
}
