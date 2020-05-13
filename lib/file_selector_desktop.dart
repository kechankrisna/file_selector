import 'package:file_chooser/file_chooser.dart';
import 'package:file_selector/FileType.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import './abstract.dart';
import './lib.dart';

class FileSelectorDesktop extends AbstractFileSelector {
  @override
  selectFile({
    FileType fileType = FileType.any,
    bool multiselect = false,
    List<String> customType: const [],
  }) async {
    String initialDirectory;
    if (io.Platform.isMacOS || io.Platform.isWindows || io.Platform.isLinux) {
      initialDirectory = (await getApplicationDocumentsDirectory()).path;
    }
    final result = await showOpenPanel(
      allowsMultipleSelection: multiselect,
      initialDirectory: initialDirectory,
      allowedFileTypes: [
        FileTypeFilterGroup(
            fileExtensions: customType.length > 0
                ? customType
                : filetypes(fileType: fileType))
      ],
    );
    if (result == null) return [];
    return result.paths;
  }
}
