import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/news.dart';
import '../../../core/widgets/texts/text_r.dart';

class NewsSheet extends StatelessWidget {
  const NewsSheet({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xff101112).withOpacity(0.75),
            const Color(0xff0E2B2B).withOpacity(0.75),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.05),
            blurRadius: 100,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const SizedBox(height: 22),
              TextB(
                news.title,
                fontSize: 32,
              ),
              const SizedBox(height: 24),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    AppColors.green.withOpacity(0.15),
                    BlendMode.color,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: news.imgURL,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) {
                      return Container();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextR(
                news.content,
                fontSize: 20,
                color: AppColors.white50,
              ),
              const SizedBox(height: 24),
            ],
          ),
          Positioned(
            top: 6,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 5,
                width: 36,
                decoration: BoxDecoration(
                  color: AppColors.white8,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
          Positioned(
            top: 14,
            right: 23,
            child: CupertinoButton(
              onPressed: () {
                context.pop();
              },
              padding: EdgeInsets.zero,
              minSize: 20,
              child: const TextM(
                'Close',
                fontSize: 16,
                color: AppColors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
