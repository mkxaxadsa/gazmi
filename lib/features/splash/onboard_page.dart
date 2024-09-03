import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/app_colors.dart';
import '../../core/db/prefs.dart';
import '../../core/widgets/buttons/primary_button.dart';
import '../../core/widgets/texts/text_r.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int pageIndex = 1;
  String title = 'Your personal\nfinancial advisor';
  String description =
      'With this mobile app, you can manage your personal finances simply and efficiently';

  void onNext() async {
    if (pageIndex == 1) {
      setState(() {
        pageIndex++;
        title =
            'Everything you need is already compiled in one convenient app for you';
        description =
            'Control your income and expenses, plan your budget and get updates on currency and cryptocurrency rates';
      });
    } else {
      await saveData().then((_) {
        context.go('/home');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.black,
                        AppColors.main,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 42),
                  child: Center(
                    child: Column(
                      children: [
                        const Spacer(),
                        TextM(
                          title,
                          fontSize: 32,
                          center: true,
                        ),
                        const SizedBox(height: 35),
                        Image.asset(
                          'assets/onboarding$pageIndex.png',
                          width: 240,
                        ),
                        const SizedBox(height: 35),
                        TextM(
                          description,
                          fontSize: 16,
                          center: true,
                          color: AppColors.grey,
                        ),
                        const Spacer(flex: 3),
                        PrimaryButton(
                          title: pageIndex == 1 ? 'Next' : 'Go',
                          width: 208,
                          onPressed: onNext,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
