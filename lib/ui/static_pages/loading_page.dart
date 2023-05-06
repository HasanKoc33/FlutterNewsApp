import 'package:flutter/material.dart';
import 'package:news_app/util/extension.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class LoadingPage extends StatelessWidget {
  bool vertical;
  LoadingPage({Key? key, this.vertical = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Shimmer(
            enabled: true,
            duration: const Duration(milliseconds: 1500),
            child: SizedBox(
                width: double.infinity,
                height: double.infinity,
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
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: context.width * .8,
                                  height: context.height * .2,
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: context.width * .8,
                                  height: context.height * .2,
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    if (vertical)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: double.infinity,
                            height: context.height * .1,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            )),
                      ),
                    if (vertical)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: double.infinity,
                            height: context.height * .1,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            )),
                      ),
                  ],
                ))));
  }
}
