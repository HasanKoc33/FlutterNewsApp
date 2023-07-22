import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/app/app_config.dart';

/// NewsAppBar
@immutable
class NewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// constructor
  const NewsAppBar({required this.pageTitle, this.isAction = false, super.key});

  /// App bar başkıgı
  final String pageTitle;

  /// app bar da ayarlar butonu görünsün mü?
  final bool isAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(pageTitle),
      actions: [
        if (isAction)
          IconButton(
            onPressed: () => context.go(RouteName.settings.path),
            icon: const Icon(Icons.settings),
          )
      ],
    );
  }

  @override

  /// App bar yüksekliği
  Size get preferredSize => const Size.fromHeight(50);
}
