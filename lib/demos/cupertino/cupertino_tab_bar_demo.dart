// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';

import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';

// BEGIN cupertinoNavigationDemo

class _TabInfo {
  const (final String this.title, final IconData this.icon);
}

class CupertinoTabBarDemo extends StatelessWidget {
  const ({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = GalleryLocalizations.of(context)!;
    final tabInfo = [
      _TabInfo(
        localizations.cupertinoTabBarHomeTab,
        CupertinoIcons.home,
      ),
      _TabInfo(
        localizations.cupertinoTabBarChatTab,
        CupertinoIcons.conversation_bubble,
      ),
      _TabInfo(
        localizations.cupertinoTabBarProfileTab,
        CupertinoIcons.profile_circled,
      ),
    ];

    return DefaultTextStyle(
      style: CupertinoTheme.of(context).textTheme.textStyle,
      child: CupertinoTabScaffold(
        restorationId: 'cupertino_tab_scaffold',
        tabBar: CupertinoTabBar(
          items: [
            for (final tabInfo in tabInfo)
              BottomNavigationBarItem(
                label: tabInfo.title,
                icon: Icon(tabInfo.icon),
              ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            restorationScopeId: 'cupertino_tab_view_$index',
            builder: (context) => _CupertinoDemoTab(
              title: tabInfo[index].title,
              icon: tabInfo[index].icon,
            ),
            defaultTitle: tabInfo[index].title,
          );
        },
      ),
    );
  }
}

class _CupertinoDemoTab extends StatelessWidget {
  const ({
    required final String this.title,
    required final IconData this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      backgroundColor: CupertinoColors.systemBackground,
      child: Center(
        child: Icon(
          icon,
          semanticLabel: title,
          size: 100,
        ),
      ),
    );
  }
}

// END
