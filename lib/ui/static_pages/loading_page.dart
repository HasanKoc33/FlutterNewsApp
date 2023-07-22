import 'package:flutter/material.dart';
import 'package:news_app/core/constant/app_padding.dart';
import 'package:news_app/utils/extension.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

/// Yükleniyor sayfası
@immutable
final class LoadingPage extends StatelessWidget {
  /// Yükleniyor sayfası
  const LoadingPage({this.vertical = false, super.key});

  /// Dikey mi olacak
  final bool vertical;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer(
        duration: const Duration(milliseconds: 1500),
        child: SizedBox.expand(
          child: ListView(
            children: [
              if (vertical)
                const SizedBox(
                  height: 50,
                ),
              if (!vertical)
                SizedBox(
                  width: context.width,
                  height: context.height * .2,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(AppPadding.m.padding),
                        child: Container(
                          width: context.width * .8,
                          height: context.height * .2,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(AppPadding.m.padding),
                        child: Container(
                          width: context.width * .8,
                          height: context.height * .2,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (vertical)
                Padding(
                  padding: EdgeInsets.all(AppPadding.m.padding),
                  child: Container(
                    width: double.infinity,
                    height: context.height * .1,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              if (vertical)
                Padding(
                  padding: EdgeInsets.all(AppPadding.m.padding),
                  child: Container(
                    width: double.infinity,
                    height: context.height * .1,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
