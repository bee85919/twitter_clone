import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:twitter_clone/screens/agreement_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isEmailValid = false; // 이메일 유효성 상태 추적

  void _onEmailChanged() {
    final email = _emailController.text;
    if (RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      setState(() {
        _isEmailValid = true;
      });
    } else {
      setState(() {
        _isEmailValid = false;
      });
    }
  }

  @override
  void dispose() {
    _emailController.removeListener(_onEmailChanged);
    _emailController.dispose();
    _nameController.dispose(); // 이름 컨트롤러 정리
    super.dispose();
  }

  DateTime selectedDate = DateTime.now(); // 선택된 날짜를 저장할 변수
  final TextEditingController _birthdayController =
      TextEditingController(); // 생년월일을 표시할 컨트롤러

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_onEmailChanged);
    _updateBirthdayText(selectedDate); // 초기 생년월일 텍스트 설정
  }

  void _updateBirthdayText(DateTime date) {
    final textDate =
        "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
    _birthdayController.text = textDate;
  }

  void _selectDate(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: 300,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: selectedDate,
            maximumDate: DateTime.now(),
            onDateTimeChanged: (DateTime newDate) {
              setState(() {
                selectedDate = newDate;
                _updateBirthdayText(newDate);
              });
            },
          ),
        );
      },
    );
  }

  bool _fromAgreementScreen = false; // AgreementScreen으로부터 돌아왔는지 여부를 추적하는 변수

  void _navigateToAgreementScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AgreementScreen(),
      ),
    );

    if (result != null && result == true) {
      setState(() {
        _fromAgreementScreen = true; // AgreementScreen으로부터 돌아왔음을 나타냄
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Create your account"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: _nameController, // 이름 입력 필드에 컨트롤러 할당
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email address',
                  border: const UnderlineInputBorder(),
                  suffixIcon: _isEmailValid
                      ? const Icon(Icons.check, color: Colors.green)
                      : null,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email address'; // 이메일 주소가 비어있는 경우
                  }
                  // 이메일 유효성 검사
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Please enter a valid email address'; // 이메일 형식이 유효하지 않은 경우
                  }
                  return null; // 이메일 형식이 유효한 경우
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _birthdayController,
                decoration: const InputDecoration(
                  labelText: 'Date of birth',
                  border: UnderlineInputBorder(),
                ),
                onTap: () => _selectDate(context),
                readOnly: true, // 텍스트 필드를 읽기 전용으로 설정
              ),
              const Spacer(), // 남은 공간을 모두 차지하도록 Spacer 사용
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _navigateToAgreementScreen,
                  child: Text(_fromAgreementScreen
                      ? 'Sign up'
                      : 'Next'), // 버튼 텍스트를 조건에 따라 변경
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
