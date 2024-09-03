import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/texts/text_r.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 44 + getStatusBar(context)),
          const Center(
            child: TextB(
              'Settings',
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.main,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.white50,
              ),
            ),
            child: const Column(
              children: [
                SizedBox(height: 16),
                _SettingsTile(
                  id: 1,
                  title: 'Terms of use',
                  url:
                      'https://docs.google.com/document/d/19QmiK7-YAIpQ8LCLhT6fZszk7aWZpcC2wdqWVNlzoM0/edit?usp=sharing',
                ),
                SizedBox(height: 16),
                _SettingsTile(
                  id: 2,
                  title: 'Privacy Policy',
                  url:
                      'https://docs.google.com/document/d/1yp441G6rWkMj09YIXlZTw2fq4b2Ml4UVE5ZFp_Osz1o/edit?usp=sharing',
                ),
                SizedBox(height: 16),
                _SettingsTile(
                  id: 3,
                  title: 'Support page',
                  url: 'https://forms.gle/SpzW9TuhmPytxxe16',
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.id,
    required this.title,
    required this.url, // New parameter
  });

  final int id;
  final String title;
  final String url; // New field

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: AppColors.navbar,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CupertinoButton(
        onPressed: () => _launchURL(url), // Use the new method
        padding: EdgeInsets.zero,
        minSize: 45,
        child: Row(
          children: [
            SizedBox(
              width: 54,
              child: SvgPicture.asset('assets/s$id.svg'),
            ),
            TextM(title, fontSize: 16),
            const Spacer(),
            SvgPicture.asset('assets/chevron.svg'),
            const SizedBox(width: 25),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
