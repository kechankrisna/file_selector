import 'package:file_selector/FileType.dart';
import 'package:universal_html/html.dart';
import './abstract.dart';
import './lib.dart';

class FileSelectorWeb extends AbstractFileSelector {
  @override
  selectFile({
    FileType fileType = FileType.any,
    bool multiselect = false,
    List<String> customType: const [],
  }) async {
    try {
      InputElement uploadInput = FileUploadInputElement();
      uploadInput.accept = customType.length > 0
          ? customType
              .map((type) => ".${type.replaceAll(".", "")}")
              .toList()
              .join(", ")
              .toString()
          : filetypes(fileType: fileType)
              .map((type) => ".${type.replaceAll(".", "")}")
              .toList()
              .join(", ")
              .toString();
      uploadInput.multiple = multiselect;
      uploadInput.click();
      await uploadInput.onChange.first;
      return uploadInput.files;
    } catch (e) {
      print("Error on Web: $e on line 25");
      // throw UnimplementedError();
      return [];
    }
  }
}
