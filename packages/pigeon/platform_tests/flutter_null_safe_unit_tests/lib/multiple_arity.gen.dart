// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// 
// Autogenerated from Pigeon (v7.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

class MultipleArityHostApi {
  /// Constructor for [MultipleArityHostApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  MultipleArityHostApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = StandardMessageCodec();

  Future<int> subtract(int arg_x, int arg_y) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.MultipleArityHostApi.subtract', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_x, arg_y]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as int?)!;
    }
  }
}

abstract class MultipleArityFlutterApi {
  static const MessageCodec<Object?> codec = StandardMessageCodec();

  int subtract(int x, int y);

  static void setup(MultipleArityFlutterApi? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.MultipleArityFlutterApi.subtract', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.MultipleArityFlutterApi.subtract was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final int? arg_x = (args[0] as int?);
          assert(arg_x != null, 'Argument for dev.flutter.pigeon.MultipleArityFlutterApi.subtract was null, expected non-null int.');
          final int? arg_y = (args[1] as int?);
          assert(arg_y != null, 'Argument for dev.flutter.pigeon.MultipleArityFlutterApi.subtract was null, expected non-null int.');
          final int output = api.subtract(arg_x!, arg_y!);
          return output;
        });
      }
    }
  }
}
