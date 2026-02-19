import 'package:flutter/material.dart';
import 'package:habitly/screen/dashboard_b_screen.dart';

class DashboardAScreen extends StatefulWidget {
  const DashboardAScreen({super.key});

  @override
  State<DashboardAScreen> createState() => _DashboardAScreenState();
}

class _DashboardAScreenState extends State<DashboardAScreen> {
  @override
  Widget build(BuildContext context) {
    final habits = [
      {'Icon': Icons.camera_alt_outlined, 'label': 'Photography'},
      {'Icon': Icons.fitness_center_outlined, 'label': 'Working Out'},
      {'Icon': Icons.book_outlined, 'label': 'Journaling'},
      {'Icon': Icons.calendar_month_outlined, 'label': 'Planning'},
      {'Icon': Icons.games_outlined, 'label': 'Game'},
      {'Icon': Icons.code_outlined, 'label': 'Reading'},
      {'Icon': Icons.music_note_outlined, 'label': 'Music'},
      {'Icon': Icons.bed_outlined, 'label': 'Sleep'},
    ];

    return Scaffold(
      backgroundColor: Color(0xFFE3FFDB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: LinearProgressIndicator(
                  value: 0.4,
                  minHeight: 8,
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),

              const SizedBox(height: 20),
              const Text(
                "What habbit you want to do ?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Select One",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  itemCount: habits.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.4,
                  ),
                  itemBuilder: (context, index) {
                    return HabitCard(
                      icon: habits[index]['Icon'] as IconData,
                      label: habits[index]['label'] as String,
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle button press
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Skip",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DashboardBScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Proceed",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// HabitCard widget yang reusable dengan GridView.builder – bagus! 👏
class HabitCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const HabitCard({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 52, color: Colors.black87),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
