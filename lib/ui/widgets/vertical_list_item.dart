import 'package:flutter/material.dart';
import 'package:news_app/core/constant/app_assets.dart';
import 'package:news_app/core/constant/app_flex.dart';
import 'package:news_app/core/constant/app_padding.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/ui/screens/news_detail_page.dart';
import 'package:news_app/utils/extension.dart';

/// yatay liste elemanı
@immutable
final class VerticalListItem extends StatelessWidget {
  /// yatay liste elemanı
  const VerticalListItem({required this.articles, super.key});

  /// haber modeli
  final Articles articles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppPadding.m.padding),
      child: SizedBox(
        height: context.height * .15,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) {
                  return NewsDetailPage(articles: articles);
                },
              ),
            );
          },
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            clipBehavior: Clip.antiAlias,
            shadowColor: context.colorScheme.onPrimary,
            child: Row(
              children: [
                Expanded(
                  flex: AppFlex.l.flex,
                  child: articles.urlToImage == null
                      ? Image.asset(
                          AppAssets.noImage.value,
                          fit: BoxFit.fill,
                          height: context.height * .2,
                        )
                      : Image.network(
                          articles.urlToImage!,
                          fit: BoxFit.fill,
                          height: context.height * .2,
                        ),
                ),
                Expanded(
                  flex: AppFlex.l.flex,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.all(AppPadding.m.padding),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            articles.title ?? '',
                            style: context.textTheme.bodyLarge,
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            articles.description ?? '',
                            style: context.textTheme.bodySmall,
                            softWrap: true,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
