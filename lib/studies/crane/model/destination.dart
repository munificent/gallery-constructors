// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';

import 'package:gallery/data/gallery_options.dart';
import 'package:gallery/studies/crane/model/formatters.dart';

abstract class const Destination({
  required final int id,
  required final String destination,
  required final String assetSemanticLabel,
  required final double imageAspectRatio,
}) {
  String get assetName;

  String subtitle(BuildContext context);

  String subtitleSemantics(BuildContext context) => subtitle(context);

  @override
  String toString() => '$destination (id=$id)';
}

class const FlyDestination({
  required super.id,
  required super.destination,
  required super.assetSemanticLabel,
  required final int stops,
  super.imageAspectRatio = 1,
  final Duration? duration,
}) extends Destination {
  @override
  String get assetName => 'crane/destinations/fly_$id.jpg';

  @override
  String subtitle(BuildContext context) {
    final stopsText = GalleryLocalizations.of(context)!.craneFlyStops(stops);

    if (duration == null) {
      return stopsText;
    } else {
      final textDirection = GalleryOptions.of(context).resolvedTextDirection();
      final durationText =
          formattedDuration(context, duration!, abbreviated: true);
      return textDirection == TextDirection.ltr
          ? '$stopsText · $durationText'
          : '$durationText · $stopsText';
    }
  }

  @override
  String subtitleSemantics(BuildContext context) {
    final stopsText = GalleryLocalizations.of(context)!.craneFlyStops(stops);

    if (duration == null) {
      return stopsText;
    } else {
      final durationText =
          formattedDuration(context, duration!, abbreviated: false);
      return '$stopsText, $durationText';
    }
  }
}

class const SleepDestination({
  required super.id,
  required super.destination,
  required super.assetSemanticLabel,
  required final int total,
  super.imageAspectRatio = 1,
}) extends Destination {
  @override
  String get assetName => 'crane/destinations/sleep_$id.jpg';

  @override
  String subtitle(BuildContext context) {
    return GalleryLocalizations.of(context)!.craneSleepProperties(total);
  }
}

class const EatDestination({
  required super.id,
  required super.destination,
  required super.assetSemanticLabel,
  required final int total,
  super.imageAspectRatio = 1,
}) extends Destination {
  @override
  String get assetName => 'crane/destinations/eat_$id.jpg';

  @override
  String subtitle(BuildContext context) {
    return GalleryLocalizations.of(context)!.craneEatRestaurants(total);
  }
}
