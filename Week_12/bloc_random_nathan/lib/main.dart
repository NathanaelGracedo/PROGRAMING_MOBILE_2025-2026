import 'package:flutter/material.dart';
import 'random_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Pattern Nathanael',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const RandomScreen(),
    );
  }
}

class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  final _bloc = RandomNumberBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Pattern Nathanael',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _bloc.randomNumber,
          initialData: 0,
          builder: (context, snapshot) {
            return Text(
              'Random Number: ${snapshot.data}',
              style: const TextStyle(
                fontSize: 24,
                color: Colors.blue),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => _bloc.generateRandom.add(null),
        child: const Icon(
          Icons.refresh,
          color: Colors.white),
      ),
    );
  }
}
