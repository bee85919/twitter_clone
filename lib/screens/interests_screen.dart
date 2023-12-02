import 'package:flutter/material.dart';
import 'package:twitter_clone/screens/widgets/interest_button.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  _InterestsScreenState createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final Set<String> _selectedInterests = {};
  final ScrollController _scrollController = ScrollController();
  bool _showTitle = false;

  void _handleInterestSelection(String interest, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedInterests.add(interest);
      } else {
        _selectedInterests.remove(interest);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 100 && !_showTitle) {
      setState(() => _showTitle = true);
    } else if (_scrollController.offset <= 100 && _showTitle) {
      setState(() => _showTitle = false);
    }
  }

  void _onNextTap() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "What do you want to see on Twitter?",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Interests are used to personalize your experience and will be visible on your profile.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 48),
              Wrap(
                runSpacing: 15,
                spacing: 15,
                children: interests
                    .map((interest) => InterestButton(
                          interest: interest,
                          onSelected: (isSelected) =>
                              _handleInterestSelection(interest, isSelected),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
            onPressed: _selectedInterests.length >= 3 ? _onNextTap : null,
            child: const Text('Next', style: TextStyle(fontSize: 16)),
          ),
        ),
      ),
    );
  }
}
