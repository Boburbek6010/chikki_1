import 'dart:async';
import 'package:demo1/src/app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:l/l.dart';

void run() => l.capture<void>(
      () => runZonedGuarded<void>(
        () async {
          WidgetsFlutterBinding.ensureInitialized();
          EasyLocalization.ensureInitialized();
          await SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp],
          ).then(
            (_) => App.run(),
          );
        },
        (final error, final stackTrace) {
          l.e(
            'io_top_level_error: ${error.toString()}\n $stackTrace',
            stackTrace,
          );
        },
      ),
      const LogOptions(
        printColors: true,
        handlePrint: true,
        outputInRelease: true,
      ),
    );
