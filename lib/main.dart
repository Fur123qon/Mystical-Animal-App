import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Creature {
  final String name;
  final String icon;
  final String description;
  final String element;
  final String habitat;
  final String skill;
  final int power;

  Creature({
    required this.name,
    required this.icon,
    required this.description,
    required this.element,
    required this.habitat,
    required this.skill,
    required this.power,
  });
}

final List<Creature> creatures = [
  Creature(
    name: "Pyro Fox",
    icon: "🦊",
    description: "Rubah api cepat yang bisa membuat jejak api saat berlari.",
    element: "Fire",
    habitat: "Volcano Forest",
    skill: "Fire Dash",
    power: 85,
  ),
  Creature(
    name: "Aqua Whale",
    icon: "🐋",
    description: "Makhluk laut raksasa yang menjaga energi samudra.",
    element: "Water",
    habitat: "Deep Ocean",
    skill: "Wave Shield",
    power: 78,
  ),
  Creature(
    name: "Thunder Hawk",
    icon: "🦅",
    description: "Burung petir yang bisa bergerak sangat cepat di langit.",
    element: "Lightning",
    habitat: "Storm Mountain",
    skill: "Thunder Strike",
    power: 92,
  ),
  Creature(
    name: "Stone Golem",
    icon: "🪨",
    description: "Penjaga kuno yang memiliki tubuh kuat seperti batu.",
    element: "Earth",
    habitat: "Ancient Ruins",
    skill: "Rock Armor",
    power: 88,
  ),
  Creature(
    name: "Frost Rabbit",
    icon: "🐇",
    description: "Kelinci es kecil yang bisa membekukan tanah di sekitarnya.",
    element: "Ice",
    habitat: "Snow Valley",
    skill: "Freeze Jump",
    power: 70,
  ),
  Creature(
    name: "Shadow Cat",
    icon: "🐈‍⬛",
    description: "Kucing bayangan yang bisa menghilang dalam gelap.",
    element: "Dark",
    habitat: "Night City",
    skill: "Shadow Hide",
    power: 80,
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fiction Catalog",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Elemental Creatures"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: creatures.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final creature = creatures[index];

            return InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailPage(creature: creature),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      creature.icon,
                      style: const TextStyle(fontSize: 55),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      creature.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Creature creature;

  const DetailPage({super.key, required this.creature});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(creature.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  creature.icon,
                  style: const TextStyle(fontSize: 100),
                ),
                const SizedBox(height: 16),
                Text(
                  creature.name,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  creature.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),

                infoTile("Element", creature.element),
                infoTile("Habitat", creature.habitat),
                infoTile("Special Skill", creature.skill),

                const SizedBox(height: 24),
                Row(
                  children: [
                    const Text(
                      "Power",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: creature.power / 100,
                        minHeight: 12,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text("${creature.power}/100"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget infoTile(String title, String value) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        "$title: $value",
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}