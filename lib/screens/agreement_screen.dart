import 'package:flutter/material.dart';

class AgreementScreen extends StatefulWidget {
  const AgreementScreen({Key? key}) : super(key: key);

  @override
  _AgreementScreenState createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
  bool _isSwitched = false;

  void _onSignUpPressed() {
    if (_isSwitched) {
      Navigator.pop(context, true); // true 값을 결과로 전달하며 돌아감
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        toolbarHeight: 35,
        // AppBar 설정을 추가하세요.
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              // 트위터 이미지를 중앙에 배치
              child: Image.asset('assets/twitter.png', height: 25),
            ),
            const SizedBox(height: 30), // 이미지와 텍스트 사이의 간격을 주기 위해
            const Padding(
              padding: EdgeInsets.only(left: 16.0), // 왼쪽에 16.0만큼 패딩을 추가합니다.
              child: Text(
                'Customize your experience',
                style: TextStyle(
                  fontSize: 28, // 폰트 사이즈를 28로 설정
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 25), // 텍스트 사이의 간격을 주기 위해
            const Padding(
              padding: EdgeInsets.only(left: 16.0), // 왼쪽에 16.0만큼 패딩을 추가합니다.
              child: Text(
                'Track where you see Twitter content across the web',
                style: TextStyle(
                    fontSize: 20, // 폰트 사이즈를 20으로 설정
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            SwitchListTile(
              title: const Text(
                'Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.\n',
              ),
              subtitle: const Text(
                  'by signing up, you agree to our Terms, Privacy Policy, and Cookie Use. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. Learn more. \n'),
              value: _isSwitched,
              onChanged: (bool value) {
                setState(() {
                  _isSwitched = value;
                });
              },
            ),
            const SizedBox(height: 25),
            Center(
              child: SizedBox(
                width: 325,
                child: ElevatedButton(
                  onPressed: _isSwitched ? _onSignUpPressed : null,
                  child: const Text('Sign up'),
                ),
              ),
            ),
            // 여기에 추가적인 위젯을 배치할 수 있습니다.
          ],
        ),
      ),
    );
  }
}
