import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';

class Dsafjmsdkfs extends StatefulWidget {
  final String ndjksandkjasd;
  final String njfkads;
  final String mkda;

  Dsafjmsdkfs({
    required this.ndjksandkjasd,
    required this.njfkads,
    required this.mkda,
  });

  @override
  State<Dsafjmsdkfs> createState() => _DsafjmsdkfsState();
}

class _DsafjmsdkfsState extends State<Dsafjmsdkfs> {
  @override
  Widget build(BuildContext context) {
    final String fjidsofdsf =
        '${widget.ndjksandkjasd}&external_id==${widget.njfkads}${widget.mkda}';
    print(fjidsofdsf);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(fjidsofdsf),
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.id,
    required this.title,
    required this.active,
    required this.onTap,
  });

  final int id;
  final String title;
  final bool active;
  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: active ? AppColors.white40 : AppColors.white8,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CupertinoButton(
        onPressed: () {
          onTap(title);
        },
        padding: EdgeInsets.zero,
        minSize: 56,
        child: Row(
          children: [
            const SizedBox(width: 16),
            SvgPicture.asset(
              'assets/cat$id.svg',
              color: active ? AppColors.white : AppColors.white40,
            ),
            const SizedBox(width: 8),
            TextM(
              title,
              fontSize: 16,
              color: active ? AppColors.white : AppColors.white40,
            ),
            const Spacer(),
            active
                ? SvgPicture.asset('assets/check.svg')
                : Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: AppColors.white8,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
            const SizedBox(width: 18),
          ],
        ),
      ),
    );
  }
}
