import 'package:flutter/material.dart';
import 'sign_up_screen.dart'; // 가정한 다른 페이지에 대한 경로

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'See what’s happening in the world right now.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 48), // 버튼과 텍스트 사이의 간격
              // 버튼들
              const GoogleSignInButton(),
              const AppleSignInButton(),
              ElevatedButton(
                child: const Text('Create account'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
              ),
              // 텍스트 약관
              const Text(
                'By signing up, you agree to our Terms, Privacy Policy, and Cookie Use.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              // 계정이 이미 있는지 묻는 텍스트
              const TextButton(
                onPressed: null,
                child: Text('Have an account already? Log in'), // 로그인 버튼 비활성화
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: Image.asset('assets/google.png',
          height: 24, width: 24), // Google 로고 이미지 경로를 확인하세요.
      label: const Text('Continue with Google'),
      onPressed: () {
        // Google 로그인 로직 구현
      },
      style: OutlinedButton.styleFrom(
        side: const BorderSide(width: 1, color: Colors.grey),
        shape: const StadiumBorder(),
      ),
    );
  }
}

class AppleSignInButton extends StatelessWidget {
  const AppleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: const Icon(Icons.apple, size: 24), // 아이콘 크기 조절 가능
      label: const Text('Continue with Apple'),
      onPressed: () {
        // Apple 로그인 로직 구현
      },
      style: OutlinedButton.styleFrom(
        side: const BorderSide(width: 1, color: Colors.grey),
        shape: const StadiumBorder(),
      ),
    );
  }
}
