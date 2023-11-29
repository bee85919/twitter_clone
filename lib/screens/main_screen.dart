import 'package:flutter/material.dart';
import 'package:twitter_clone/screens/sign_up_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(47.5, 55, 47.5, 25),
          child: Column(
            children: <Widget>[
              Image.asset('assets/twitter.png', height: 25),
              const SizedBox(height: 100),
              const Text(
                'See what’s happening in the world right now.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 60),
              const GoogleSignInButton(),
              const SizedBox(height: 5),
              const AppleSignInButton(),
              const SizedBox(height: 10),
              const Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      thickness: 1, // 선의 두께를 설정
                      color: Colors.grey, // 선의 색상을 설정
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('or'),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1, // 선의 두께를 설정
                      color: Colors.grey, // 선의 색상을 설정
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black, // 버튼 배경색을 검은색으로 설정
                  side: const BorderSide(
                      width: 1, color: Colors.black), // 테두리를 검은색으로 설정
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.fromLTRB(
                      80, 14, 80, 14), // 왼쪽, 상단, 오른쪽, 하단 패딩 설정
                ),
                child: const Text(
                  'Create account',
                  style: TextStyle(
                    fontSize: 16, // Sizes.size16를 사용자 정의 크기로 바꾸었습니다.
                    color: Colors.white, // 글씨색을 흰색으로 설정
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // 텍스트 약관
              const Text(
                'By signing up, you agree to our Terms,\nPrivacy Policy, and Cookie Use.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              // 계정이 이미 있는지 묻는 텍스트
              const TextButton(
                onPressed: null,
                child: Text(
                    'Have an account already? Log in          '), // 로그인 버튼 비활성화
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
      label: const Text(
        'Continue with Google',
        style: TextStyle(
          fontSize: 16, // 여기에 폰트 사이즈를 지정합니다.
        ),
      ),
      onPressed: () {
        // Google 로그인 로직 구현
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(37.5, 10.0, 37.5, 10.0),
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
      label: const Text(
        'Continue with Apple   ',
        style: TextStyle(
          fontSize: 16, // 여기에 폰트 사이즈를 지정합니다.
        ),
      ),
      onPressed: () {
        // Apple 로그인 로직 구현
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(37.5, 10.0, 37.5, 10.0),
        side: const BorderSide(width: 1, color: Colors.grey),
        shape: const StadiumBorder(),
      ),
    );
  }
}
