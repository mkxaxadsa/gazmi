import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:project19/features/home/pages/news_sheet.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/news.dart';

class HomeNewsCard extends StatelessWidget {
  const HomeNewsCard({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: CupertinoButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            useSafeArea: true,
            builder: (context) {
              return NewsSheet(news: news);
            },
          );
        },
        padding: EdgeInsets.zero,
        child: Stack(
          children: [
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
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: AppColors.main.withOpacity(0.75),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      news.title.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: Fonts.mulishB,
                      ),
                    ),
                    Text(
                      news.content,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.white50,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: Fonts.mulishR,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
