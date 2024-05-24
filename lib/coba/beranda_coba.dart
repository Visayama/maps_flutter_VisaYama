import 'package:flutter/material.dart';
class BerandaCoba extends StatefulWidget {
  const BerandaCoba({super.key});

  @override
  State<BerandaCoba> createState() => _BerandaCobaState();
}

class _BerandaCobaState extends State<BerandaCoba> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Latihan'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('anjay')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
