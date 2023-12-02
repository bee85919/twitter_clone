import 'package:flutter/material.dart';

class InterestButton extends StatefulWidget {
  final String interest;
  final Function(bool) onSelected;

  const InterestButton({
    Key? key,
    required this.interest,
    required this.onSelected,
  }) : super(key: key);

  @override
  _InterestButtonState createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _isSelected = false;

  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
    });
    widget.onSelected(_isSelected); // 상태 변경을 부모 위젯에 알림
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
        decoration: BoxDecoration(
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Colors.black.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Text(
          widget.interest,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _isSelected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
