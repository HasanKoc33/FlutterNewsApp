import 'package:flutter/material.dart';
import 'package:news_app/core/constant/app_assets.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/util/extension.dart';

import '../pages/news_detail_page.dart';

class VerticalListItem extends StatelessWidget {
  Articles articles;

  VerticalListItem({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.height * 0.15,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NewsDetailPage(articles: articles);
            }));
          },
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            clipBehavior: Clip.antiAlias,
            shadowColor: context.colorScheme.onPrimary,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
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
                  flex: 2,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            articles.title ?? "",
                            style: context.textTheme.bodyLarge,
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            articles.description ?? "",
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
        ));
  }
}
