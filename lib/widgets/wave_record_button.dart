import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class WaveRecordButton extends StatefulWidget {
  const WaveRecordButton({super.key});

  @override
  State<WaveRecordButton> createState() => _WaveRecordButtonState();
}

class _WaveRecordButtonState extends State<WaveRecordButton>
    with SingleTickerProviderStateMixin {
  final Record _record = Record();
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0.8,
      upperBound: 1.0,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _startRecording() async {
    if (await _record.hasPermission()) {
      await _record.start();
      _controller.repeat(reverse: true);
    }
  }

  Future<void> _stopRecording() async {
    final path = await _record.stop();
    _controller.stop();
    if (path != null) {
      final file = await MultipartFile.fromFile(path);
      final form = FormData.fromMap({'file': file});
      try {
        await Dio().post('https://example.com/upload', data: form);
      } catch (_) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (_) => _startRecording(),
      onLongPressEnd: (_) => _stopRecording(),
      child: ScaleTransition(
        scale: Tween<double>(begin: 1, end: 1.2).animate(_controller),
        child: Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
          ),
          child: const Icon(Icons.mic, color: Colors.white),
        ),
      ),
    );
  }
}
