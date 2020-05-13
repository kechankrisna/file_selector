import 'dart:io';
import 'package:file_picker/file_picker.dart' as filePicker;
import 'package:file_selector/FileType.dart';
import './abstract.dart';
import './lib.dart';

class FileSelectorMobile extends AbstractFileSelector {
  @override
  selectFile({
    FileType fileType = FileType.any,
    bool multiselect = false,
    List<String> customType: const [],
  }) async {
    try {
      if (multiselect) {
        List<File> files = await filePicker.FilePicker.getMultiFile(
          type: filePicker.FileType.custom,
          allowedExtensions: customType.length > 0
              ? customType
              : filetypes(fileType: fileType),
        );
        return files;
      } else {
        File file = await filePicker.FilePicker.getFile(
          type: filePicker.FileType.custom,
          allowedExtensions: customType.length > 0
              ? customType
              : filetypes(fileType: fileType),
        );
        return [file];
      }
    } catch (e) {
      print("Error on mobile $e on line 28");
      // throw UnimplementedError();
      return [];
    }
  }
}
