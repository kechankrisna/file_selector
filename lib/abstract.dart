import './FileType.dart';

abstract class AbstractFileSelector {
  Future<List> selectFile({
    FileType fileType: FileType.any,
    bool multiselect: false,
    List<String> customType: const [],
  });
}
