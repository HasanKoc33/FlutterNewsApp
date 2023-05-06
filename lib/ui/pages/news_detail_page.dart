import 'package:flutter/material.dart';
import 'package:news_app/util/extension.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constant/app_assets.dart';
import '../../data/model/news_model.dart';

class NewsDetailPage extends StatelessWidget {
  Articles articles;

  NewsDetailPage({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
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
                            width: double.infinity,
                          ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(0.5),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              articles.source != null ? articles.source!.name! : "",
                              style: context.textTheme.bodySmall,
                            ),
                            Text(
                              articles.publishedAt ?? "",
                              style: context.textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          articles.title ?? "",
                          style: context.textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          articles.description ?? "",
                          style: context.textTheme.bodySmall,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          articles.content ?? "",
                          style: context.textTheme.bodySmall,
                        ),
                        Spacer(),
                        Text(
                          articles.author ?? "",
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
        ));
  }
}
