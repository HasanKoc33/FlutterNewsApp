import 'package:flutter/material.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/util/extension.dart';

import '../../core/constant/app_assets.dart';
import '../pages/news_detail_page.dart';

class HorizontalListItem extends StatelessWidget {
  Articles articles;
  HorizontalListItem({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: SizedBox(
        width: context.width * .8,
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
              child: Stack(
                children: [
                  articles.urlToImage == null
                      ? Image.asset(
                          AppAssets.noImage.value,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        )
                      : Image.network(
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
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
