import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<TextEditingController> _controllers = [];
  bool _isButtonActive = false;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 4; i++) {
      _controllers.add(TextEditingController());
      _controllers[i].addListener(() {
        _checkCodeFilled();
      });
    }
  }

  void _checkCodeFilled() {
    bool isFilled =
        _controllers.every((controller) => controller.text.length == 1);
    setState(() {
      _isButtonActive = isFilled;
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
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
          height: 32, // Set the image height
        ),
        centerTitle: true, // Center the title image
        elevation: 0, // Remove shadow
      ),
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // 이것으로 모든 자식들을 왼쪽으로 정렬합니다.
        children: <Widget>[
          const SizedBox(height: 48),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0), // 좌우 여백을 추가합니다.
            child: Text(
              'We sent you a code',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0), // 좌우 여백을 추가합니다.
            child: Text(
              'Enter it below to verify\nbee@gmail.com',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 20),
          // Code input fields and the rest of your widgets...
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Container(
                width: 50,
                margin: const EdgeInsets.all(8),
                child: TextFormField(
                  controller: _controllers[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  decoration: const InputDecoration(
                    counterText: "", // Hide the counterText
                  ),
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
              );
            }),
          ),
          // Check mark and Next button
          const SizedBox(height: 20),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Visibility(
                visible: _isButtonActive,
                child: const Icon(Icons.check, color: Colors.green),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(28), // 바닥과의 간격
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50), // 버튼의 최소 크기를 설정
            // 이 부분에서 필요에 따라 추가적인 스타일링을 할 수 있습니다.
          ),
          onPressed: _isButtonActive
              ? () {
                  // TODO: Implement navigation to next screen
                }
              : null,
          child: const Text('Next'),
        ),
      ),
    );
  }
}
