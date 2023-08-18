// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class CodeStyle extends InheritedWidget {
  const ({
    super.key,
    final TextStyle? this.baseStyle,
    final TextStyle? this.numberStyle,
    final TextStyle? this.commentStyle,
    final TextStyle? this.keywordStyle,
    final TextStyle? this.stringStyle,
    final TextStyle? this.punctuationStyle,
    final TextStyle? this.classStyle,
    final TextStyle? this.constantStyle,
    required super.child,
  });

  static CodeStyle of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CodeStyle>()!;
  }

  @override
  bool updateShouldNotify(CodeStyle oldWidget) =>
      oldWidget.baseStyle != baseStyle ||
      oldWidget.numberStyle != numberStyle ||
      oldWidget.commentStyle != commentStyle ||
      oldWidget.keywordStyle != keywordStyle ||
      oldWidget.stringStyle != stringStyle ||
      oldWidget.punctuationStyle != punctuationStyle ||
      oldWidget.classStyle != classStyle ||
      oldWidget.constantStyle != constantStyle;
}
