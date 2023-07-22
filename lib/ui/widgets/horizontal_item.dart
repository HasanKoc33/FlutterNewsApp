import 'package:flutter/material.dart';
import 'package:news_app/core/constant/app_assets.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/ui/screens/news_detail_page.dart';
import 'package:news_app/utils/extension.dart';

/// Yatay liste elemanı
@immutable
final class HorizontalListItem extends StatelessWidget {
  /// Yatay liste elemanı
  const HorizontalListItem({required this.articles, super.key});

  /// Haber modeli
  final Articles articles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: SizedBox(
        width: context.width * .8,
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
                    height: context.height * .2,
                  ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: context.colorScheme.surface.withOpacity(.7),
                    padding: const EdgeInsets.all(5),
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
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
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
