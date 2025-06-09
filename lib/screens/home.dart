import 'package:flutter/material.dart';
import '../widgets/wave_record_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      {'title': 'Grocery', 'amount': -20.0},
      {'title': 'Salary', 'amount': 1500.0},
      {'title': 'Coffee', 'amount': -5.5},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Balance', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 8),
                    Text(
                      '\$1,200.00',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Recent Transactions', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final tx = transactions[index];
                  return ListTile(
                    title: Text(tx['title'].toString()),
                    trailing: Text(tx['amount'].toString()),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Center(child: WaveRecordButton()),
          ],
        ),
      ),
    );
  }
}
