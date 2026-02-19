import 'package:flutter/material.dart';
import 'package:habitly/screen/dashboard_a_screen.dart';

// Form registration lengkap dengan dropdown gender & country code – thorough! 📝
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
// selectedGender dan selectedCountry sebagai global variable – ini sangat berbahaya
// karena state-nya shared antar semua instance RegisterScreen. Pindahkan ke
// dalam _RegisterScreenState. 🚨
String? selectedGender;
String? selectedCountry;

class _RegisterScreenState extends State<RegisterScreen> {
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3FFDB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 5),
                Image.asset("assets/bg-signin.png", height: 250, width: 250),
                SizedBox(height: 5),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "Account Registration",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      _inputLabel("Full Name"),
                      _textField(hintText: "Your full name"),
                      _inputLabel("Email"),
                      _textField(hintText: "Your email", isRequired: false),
                      _inputLabel("Gender"),
                      _dropdownField(
                        items: ['Gender', 'Laki-laki', 'Perempuan'],
                        selectedValue: selectedGender,
                        hint: "Gender",
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                      ),
                      _inputLabel("No. HP"),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: _dropdownField(
                              items: ['+62', '+60', '+65', '+66'],
                              selectedValue: selectedCountry,
                              hint: "Code",
                              onChanged: (value) {
                                setState(() {
                                  selectedCountry = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 3,
                            child: _textField(hintText: "Phone number"),
                          ),
                        ],
                      ),
                      _inputLabel("Password"),
                      _textField(hintText: "Your password", isPassword: true),
                      _inputLabel("Confirm Password"),
                      _textField(
                        hintText: "Confirm your password",
                        isPassword: true,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Forgot password?",
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const DashboardAScreen(),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Text(
                            "Register",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            // Login button melakukan _formKey.currentState!.validate() tapi selalu navigasi
                            // ke DashboardAScreen meskipun validasi gagal – logic error! 🐛
                            _formKey.currentState!.validate();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DashboardAScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(child: Divider()),
                          Text(
                            "   or   ",
                            style: TextStyle(color: Colors.white),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[100],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset("assets/google-logo.png"),
                              SizedBox(width: 10),
                              Text(
                                "Continue with Google",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _inputLabel(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 12, bottom: 6),
    child: RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.white),
        children: [
          TextSpan(text: text),
          TextSpan(
            text: " * ",
            style: const TextStyle(color: Colors.red),
          ),
        ],
      ),
    ),
  );
}

Widget _textField({
  String? hintText,
  bool isPassword = false,
  bool isRequired = true,
}) {
  return TextFormField(
    obscureText: isPassword,
    decoration: InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Colors.white,
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide.none,
      ),
    ),
    validator: (value) {
      if ((value == null || value.isEmpty) && isRequired) {
        return "This field is required";
      }
      return null;
    },
  );
}

Widget _dropdownField({
  required List<String> items,
  String? selectedValue,
  String? hint,
  required Function(String?) onChanged,
}) {
  return DropdownButtonFormField<String>(
    value: selectedValue,
    hint: hint != null ? Text(hint) : null,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide.none,
      ),
    ),
    validator: (value) {
      if ((value == null || value.isEmpty)) {
        return "This field is required";
      }
      return null;
    },
    items: items
        .map((label) => DropdownMenuItem(value: label, child: Text(label)))
        .toList(),
    onChanged: onChanged,
  );
}
