import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:habitly/screen/dashboard_e_screen.dart';

class DashboardDScreen extends StatefulWidget {
  const DashboardDScreen({super.key});

  @override
  State<DashboardDScreen> createState() => _DashboardDScreenState();
}

class _DashboardDScreenState extends State<DashboardDScreen> {
  int _selectedIndex = 0; // Track selected index

  final List<HabitCard> habits = [
    HabitCard(
      title: "Morning Meditation",
      subtitle: "Completed",
      isCompleted: false,
    ),
    HabitCard(
      title: "Drink Water",
      subtitle: "Completed at 7:00 AM",
      isCompleted: true,
    ),
    HabitCard(
      title: "Exercise",
      subtitle: "Completed at 7:00 AM",
      isCompleted: false,
    ),
    HabitCard(
      title: "Read Book",
      subtitle: "Completed at 7:00 AM",
      isCompleted: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3FFDB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today.",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    DateFormat('MMMM d').format(DateTime.now()),
                    style: TextStyle(fontSize: 30, color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 20),
                  Icon(Icons.person_2_outlined, size: 30, color: Colors.black),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(7, (index) {
                  List<Map<String, String>> days = [
                    {'num': '1', 'label': 'M'},
                    {'num': '2', 'label': 'T'},
                    {'num': '3', 'label': 'W'},
                    {'num': '4', 'label': 'T'},
                    {'num': '5', 'label': 'F'},
                    {'num': '6', 'label': 'S'},
                    {'num': '7', 'label': 'S'},
                  ];
                  return Column(
                    children: [
                      Text(
                        days[index]['label']!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey[350],
                          shape: BoxShape.circle,
                        ),
                        child: Center(child: Text(days[index]['num']!)),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                }),
              ),
              const SizedBox(height: 20),
              Text(
                "My Habits",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  itemCount: habits.length,
                  separatorBuilder: (_, __) => const Divider(),
                  //const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final habit = habits[index];
                    return ListTile(
                      title: Text(habit.title, style: TextStyle(fontSize: 24)),
                      subtitle: Text(habit.subtitle),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Highlight active tab
        backgroundColor: Colors.white,
        onTap: (index) async {
          if (index == 1) {
            final newHabit = await Navigator.push<HabitCard>(
              context,
              MaterialPageRoute(builder: (_) => const DashboardEScreen()),
            );
            if (newHabit != null) {
              setState(() {
                habits.add(newHabit);
              });
            }
          }
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 30, color: Colors.green),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline, size: 40, color: Colors.green),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 30, color: Colors.green),
            label: "",
          ),
        ],
      ),
    );
  }
}

class HabitCard {
  final String title;
  final String subtitle;
  final bool isCompleted;

  HabitCard({
    required this.title,
    required this.subtitle,
    required this.isCompleted,
  });
}
