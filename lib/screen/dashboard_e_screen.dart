import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:habitly/screen/dashboard_d_screen.dart';

class DashboardEScreen extends StatefulWidget {
  const DashboardEScreen({super.key});

  @override
  State<DashboardEScreen> createState() => _DashboardEScreenState();
}

class _DashboardEScreenState extends State<DashboardEScreen> {
  final TextEditingController _habitController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text = DateFormat('MM/dd/yyyy').format(pickedDate);
      });
    }
  }

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
                  const BackButton(color: Colors.black),
                  const SizedBox(width: 20),
                  Text(
                    "Add New Habbit",
                    style: TextStyle(fontSize: 30, color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 20),
                  Icon(Icons.person_2_outlined, size: 30, color: Colors.black),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _habitController,
                decoration: InputDecoration(
                  hintText: "Enter your new habit",
                  filled: true,
                  fillColor: Color(0xFFE3FFDB),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.green, width: 3),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _dateController,
                readOnly: true,
                onTap: _pickDate,
                decoration: InputDecoration(
                  hintText: "mm/dd/yyyy",
                  suffixIcon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.green,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.green, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_habitController.text.isNotEmpty) {
                      final habitTitle = _habitController.text;
                      Navigator.pop(
                        context,
                        HabitCard(
                          title: habitTitle,
                          subtitle: "Just added",
                          isCompleted: false,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please enter a habit name"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  //  const Text(
                  //               "When we should remind you ?",
                  //               style: TextStyle(
                  //                 fontSize: 18,
                  //                 fontWeight: FontWeight.w500,
                  //               ),
                  //             ),
                  child: const Text(
                    "Add Habit",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 30, color: Colors.green),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline, size: 40, color: Colors.green),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 30, color: Colors.green),
            label: "",
          ),
        ],
      ),
    );
  }
}

// Widget reminderButton(String text) {
//   return ElevatedButton(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: selectedReminder == text
//           ? Colors.green
//           : Colors.green.shade400,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
//     ),
//     onPressed: () {
//       setState(() {
//         selectedReminder = text;
//       });
//     },
//     child: Text(text),
//   );
// }
