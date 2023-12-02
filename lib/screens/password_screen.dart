import 'package:flutter/material.dart';
import 'package:twitter_clone/screens/interests_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isPasswordValid = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_checkPasswordValid);
  }

  void _checkPasswordValid() {
    final passwordLength = _passwordController.text.length;
    if (passwordLength >= 8 && !_isPasswordValid) {
      setState(() => _isPasswordValid = true);
    } else if (passwordLength < 8 && _isPasswordValid) {
      setState(() => _isPasswordValid = false);
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/twitter.png',
          fit: BoxFit.cover,
          height: 32,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.0), // 좌우 여백을 추가합니다.
                child: Text(
                  'You\'ll need a password',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.0), // 좌우 여백을 추가합니다.
                child: Text(
                  'Make sure it\'s 8 characters or more.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 28),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0), // 좌우 패딩을 추가
                child: TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible, // 비밀번호 숨김 여부
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          // 비밀번호 가시성 아이콘 설정
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 8) {
                        return 'Please enter a password with 8 characters or more.';
                      }
                      return null;
                    }),
              ),
              // 다른 위젯들...
            ],
          ),
        ),
      ),
      // 하단 버튼
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(28),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            shape: const StadiumBorder(),
          ),
          onPressed: _isPasswordValid && _formKey.currentState!.validate()
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InterestsScreen(),
                    ),
                  );
                }
              : null,
          child: const Text('Next'),
        ),
      ),
    );
  }
}
