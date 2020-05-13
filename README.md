# file_selector

This plugin will be inspired from file_picker and file_chooser to work fully in web, mobile and desktop application. The goal is to support for File Selector for all platform.

## Example

```
    _selectFile() async {
        var result = await FileSelector.selectFiles(
        multiselect: true, fileType: FileType.media);
        print(result);
    }
```

## Getting Started

```
MacOS: 
update DebugProfile.entitilements like this
    <key>com.apple.security.app-sandbox</key>
	<true/>
	<key>com.apple.security.cs.allow-jit</key>
	<true/>
	<key>com.apple.security.network.server</key>
	<true/>
	<key>com.apple.security.network.client</key>
	<true/>
	<key>com.apple.security.files.user-selected.read-write</key>
	<true/>

```

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
