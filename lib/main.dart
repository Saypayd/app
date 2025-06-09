import 'package:app/screens/entry.dart';
import 'package:flutter/material.dart';
import 'package:fquery/fquery.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    QueryClientProvider(
      queryClient: QueryClient(
        defaultQueryOptions: DefaultQueryOptions(retryCount: 3),
      ),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Nairanow',
      debugShowCheckedModeBanner: false,
      home: EntryScreen(),
    );
  }
}
