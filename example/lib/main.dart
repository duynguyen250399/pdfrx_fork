import 'package:flutter/material.dart';
import 'package:pdfrx_fork/pdfrx_fork.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDF Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'PDF Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final uri = Uri.parse('https://icseindia.org/document/sample.pdf');
    final params = PdfViewerParams(
      backgroundColor: Colors.white,
      loadingBannerBuilder: (context, bytesDownloaded, totalBytes) {
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: PdfViewer.uri(uri, params: params),
    );
  }
}
