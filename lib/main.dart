import 'package:audio_app/audiopayer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      title: 'Flutter Audio',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black87,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 29,
        ),
        textTheme: Theme.of(context).textTheme.apply(
              //displayColor: Colors.white,
              bodyColor: Colors.white,
              //fontSizeFactor: 20,
            ),
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey).copyWith(
          background: const Color.fromARGB(221, 1, 17, 1),
        ),
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 29,
        ),
        textTheme: Theme.of(context).textTheme.apply(
              //displayColor: Colors.white,
              bodyColor: Colors.black,
              //fontSizeFactor: 20,
            ),
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple).copyWith(
          background: const Color.fromARGB(221, 255, 247, 247),
        ),
        //primarySwatch: Colors.grey,
      ),
      home: AudioPayer(),
    );
  }
}
