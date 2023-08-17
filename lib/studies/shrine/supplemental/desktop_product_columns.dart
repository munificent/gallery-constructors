// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';

import 'package:gallery/studies/shrine/model/product.dart';
import 'package:gallery/studies/shrine/supplemental/product_card.dart';

/// Height of the text below each product card.
const productCardAdditionalHeight = 84.0 * 2;

/// Height of the divider between product cards.
const productCardDividerHeight = 84.0;

/// Height of the space at the top of every other column.
const columnTopSpace = 84.0;

class const DesktopProductCardColumn({
  super.key,
  required final bool alignToEnd,
  required final bool startLarge,
  required final bool lowerStart,
  required final List<Product> products,
  required final double largeImageWidth,
  required final double smallImageWidth,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final currentColumnProductCount = products.length;
      final currentColumnWidgetCount =
          max(2 * currentColumnProductCount - 1, 0);

      return SizedBox(
        width: largeImageWidth,
        child: Column(
          crossAxisAlignment:
              alignToEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (lowerStart) Container(height: columnTopSpace),
            ...List<Widget>.generate(currentColumnWidgetCount, (index) {
              Widget card;
              if (index % 2 == 0) {
                // This is a product.
                final productCardIndex = index ~/ 2;
                card = DesktopProductCard(
                  product: products[productCardIndex],
                  imageWidth: startLarge
                      ? ((productCardIndex % 2 == 0)
                          ? largeImageWidth
                          : smallImageWidth)
                      : ((productCardIndex % 2 == 0)
                          ? smallImageWidth
                          : largeImageWidth),
                );
              } else {
                // This is just a divider.
                card = Container(
                  height: productCardDividerHeight,
                );
              }
              return RepaintBoundary(child: card);
            }),
          ],
        ),
      );
    });
  }
}
