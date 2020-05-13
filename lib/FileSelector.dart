import 'dart:async';
import 'package:file_selector/FileType.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' as io;
import './file_selector_mobile.dart';
import './file_selector_desktop.dart';
import './file_selector_web.dart';

class FileSelector {
  static const MethodChannel _channel = const MethodChannel('file_selector');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<List> selectFiles({
    FileType fileType: FileType.any,
    bool multiselect: false,
    List<String> customType: const [],
  }) async {
    //web
    if (kIsWeb) {
      FileSelectorWeb selectorWeb = FileSelectorWeb();
      return await selectorWeb.selectFile(
          fileType: fileType, multiselect: multiselect, customType: customType);
    } else {
      //mobile
      if (io.Platform.isAndroid || io.Platform.isIOS) {
        FileSelectorMobile selectorMobile = FileSelectorMobile();
        return await selectorMobile.selectFile(
            fileType: fileType,
            multiselect: multiselect,
            customType: customType);

        //desktop
      } else if (io.Platform.isWindows ||
          io.Platform.isMacOS ||
          io.Platform.isLinux) {
        FileSelectorDesktop selectorDesktop = FileSelectorDesktop();
        return await selectorDesktop.selectFile(
            fileType: fileType,
            multiselect: multiselect,
            customType: customType);
      } else {
        return [];
      }
    }
  }
}
