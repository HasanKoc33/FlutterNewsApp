part of '../screens/settings_screen.dart';

/// tema seçenegi
Widget selectTheme() {
  return Padding(
    padding: EdgeInsets.all(
      AppPadding.m.padding,
    ),
    child: Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return FutureBuilder(
          future: themeProvider.getTheme(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Center();
            return ClipRRect(
              borderRadius: BorderRadius.circular(
                AppPadding.l.padding,
              ),
              child: ExpansionTile(
                leading: const Icon(
                  Icons.dark_mode,
                  color: Colors.white,
                ),
                collapsedBackgroundColor: Theme.of(context).colorScheme.primary,
                backgroundColor: Theme.of(context).colorScheme.primary,
                textColor: Colors.white,
                iconColor: Colors.white,
                collapsedIconColor: Colors.white,
                collapsedTextColor: Colors.white,
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        AppStrings.theme.translate,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleMedium
                            ?.copyWith(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                      ),
                    ),
                    Text(
                      snapshot.data == AppStrings.system.name
                          ? AppStrings.system.translate
                          : snapshot.data == AppStrings.dark.name
                              ? AppStrings.dark.translate
                              : AppStrings.light.translate,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .titleMedium
                          ?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
                children: [
                  ListTile(
                    hoverColor: Colors.white,
                    focusColor: Colors.white,
                    title: Text(
                      AppStrings.system.translate,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .titleMedium
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: snapshot.data == AppStrings.system.name
                                ? FontWeight.bold
                                : null,
                          ),
                    ),
                    trailing: snapshot.data == AppStrings.system.name
                        ? const Icon(
                            Icons.check_circle_rounded,
                            color: Colors.white,
                          )
                        : null,
                    onTap: () =>
                        themeProvider.changeTheme(AppStrings.system.name),
                  ),
                  ListTile(
                    hoverColor: Colors.white,
                    focusColor: Colors.white,
                    title: Text(
                      AppStrings.light.translate,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .titleMedium
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: snapshot.data == AppStrings.light.name
                                ? FontWeight.bold
                                : null,
                          ),
                    ),
                    trailing: snapshot.data == AppStrings.light.name
                        ? const Icon(
                            Icons.check_circle_rounded,
                            color: Colors.white,
                          )
                        : null,
                    onTap: () =>
                        themeProvider.changeTheme(AppStrings.light.name),
                  ),
                  ListTile(
                    hoverColor: Colors.white,
                    focusColor: Colors.white,
                    title: Text(
                      AppStrings.dark.translate,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .titleMedium
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: snapshot.data == AppStrings.dark.name
                                ? FontWeight.bold
                                : null,
                          ),
                    ),
                    trailing: snapshot.data == AppStrings.dark.name
                        ? const Icon(
                            Icons.check_circle_rounded,
                            color: Colors.white,
                          )
                        : null,
                    onTap: () =>
                        themeProvider.changeTheme(AppStrings.dark.name),
                  )
                ],
              ),
            );
          },
        );
      },
    ),
  );
}

/// Dil seçenegi
Widget selectLanguage(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(
      AppPadding.m.padding,
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(
        AppPadding.l.padding,
      ),
      child: ExpansionTile(
        leading: const Icon(
          Icons.translate,
          color: Colors.white,
        ),
        collapsedBackgroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        textColor: Colors.white,
        iconColor: Colors.white,
        collapsedIconColor: Colors.white,
        collapsedTextColor: Colors.white,
        title: Row(
          children: [
            Expanded(
              child: Text(
                AppStrings.language.translate,
                style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
            ),
            Text(
              context.locale.languageCode == AppStrings.tr.name
                  ? AppStrings.tr.translate
                  : AppStrings.en.translate,
              style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
        children: [
          ListTile(
            hoverColor: Colors.white,
            focusColor: Colors.white,
            title: Text(
              AppStrings.tr.translate,
              style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight:
                        context.locale.languageCode == AppStrings.tr.name
                            ? FontWeight.bold
                            : null,
                  ),
            ),
            trailing: context.locale.languageCode == AppStrings.tr.name
                ? const Icon(
                    Icons.check_circle_rounded,
                    color: Colors.white,
                  )
                : null,
            onTap: () => context.setLocale(
              AppLocale.tr,
            ),
          ),
          ListTile(
            hoverColor: Colors.white,
            focusColor: Colors.white,
            title: Text(
              AppStrings.en.translate,
              style: Theme.of(context).primaryTextTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight:
                        context.locale.languageCode == AppStrings.en.name
                            ? FontWeight.bold
                            : null,
                  ),
            ),
            trailing: context.locale.languageCode == AppStrings.en.name
                ? const Icon(
                    Icons.check_circle_rounded,
                    color: Colors.white,
                  )
                : null,
            onTap: () => context.setLocale(
              AppLocale.en,
            ),
          ),
        ],
      ),
    ),
  );
}
