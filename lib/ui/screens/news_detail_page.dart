import 'package:flutter/material.dart';
import 'package:news_app/core/constant/app_assets.dart';
import 'package:news_app/core/constant/app_flex.dart';
import 'package:news_app/core/constant/app_padding.dart';
import 'package:news_app/core/constant/app_strings.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/ui/widgets/app_bar.dart';
import 'package:news_app/utils/extension.dart';
import 'package:url_launcher/url_launcher.dart';

/// Haber detay sayfası
@immutable
final class NewsDetailPage extends StatelessWidget {
  /// Haber detay sayfası
  const NewsDetailPage({required this.articles, super.key});

  /// Sayfaya gönderilen haber modeli
  final Articles articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewsAppBar(
        pageTitle: AppStrings.newsDetail.translate,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: AppFlex.s.flex,
              child: Padding(
                padding: EdgeInsets.all(AppPadding.m.padding),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      if (articles.urlToImage == null)
                        Image.asset(
                          AppAssets.noImage.value,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        )
                      else
                        Image.network(
                          articles.urlToImage!,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: AppFlex.l.flex,
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppPadding.m.padding),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            articles.source != null
                                ? articles.source!.name!
                                : '',
                            style: context.textTheme.bodySmall,
                          ),
                          Text(
                            articles.publishedAt ?? '',
                            style: context.textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        articles.title ?? '',
                        style: context.textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        articles.description ?? '',
                        style: context.textTheme.bodySmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        articles.content ?? '',
                        style: context.textTheme.bodySmall,
                      ),
                      const Spacer(),
                      Text(
                        articles.author ?? '',
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (!await launchUrl(Uri.parse(articles.url!))) {
            throw Exception('Could not launch ${articles.url}');
          }
        },
        child: const Icon(Icons.arrow_forward_ios_sharp),
      ),
    );
  }
}
