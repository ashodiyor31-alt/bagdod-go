import 'package:flutter/material.dart';

void main() {
  runApp(const BagdodGo());
}

class BagdodGo extends StatelessWidget {
  const BagdodGo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bagdod Go',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool driver = false;
  final from = TextEditingController();
  final to = TextEditingController();
  final km = TextEditingController(text: '5');

  @override
  Widget build(BuildContext context) {
    int distance = int.tryParse(km.text) ?? 0;

    return Scaffold(
      backgroundColor: const Color(0xFF101A15),
      appBar: AppBar(
        backgroundColor: const Color(0xFF101A15),
        title: const Text('🚕 BAG‘DOD GO'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text(
              'Xush kelibsiz!',
              style: TextStyle(fontSize: 28,
                fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SegmentedButton<bool>(
              segments: const [
                ButtonSegment(
                  value: false,
                  label: Text('Yo‘lovchi'),
                ),
                ButtonSegment(
                  value: true,
                  label: Text('Haydovchi'),
                ),
              ],
              selected: {driver},
              onSelectionChanged: (v) {
                setState(() => driver = v.first);
              },
            ),
            const SizedBox(height: 25),
            if (!driver) ...[
              TextField(
                controller: from,
                decoration: const InputDecoration(
                  labelText: 'Qayerdan?',
                  prefixIcon: Icon(Icons.location_on),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: to,
                decoration: const InputDecoration(
                  labelText: 'Qayerga?',
                  prefixIcon: Icon(Icons.flag),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: km,
                keyboardType: TextInputType.number,
                onChanged: (_) => setState(() {}),
                decoration: const InputDecoration(
                  labelText: 'Masofa (km)',
                ),
              ),
              const SizedBox(height: 25),
              Card(
                color: const Color(0xFF174D32),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text('YO‘L HAQI'),
                      Text(
                        '${distance * 2500} so‘m',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent,
                        ),
                      ),
                      const Text('1 km = 2 500 so‘m'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Buyurtma tizimi keyingi bosqichda ulanadi',
                      ),
                    ),
                  );
                },
                child: const Text('TAKSI CHAQIRISH'),
              ),
            ] else ...[
              const Icon(
                Icons.local_taxi,
                size: 90,
                color: Colors.greenAccent,
              ),
              const Text(
                'Haydovchi rejimi',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
              const Text(
                'Buyurtmalar tizimi ulanadi',
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}