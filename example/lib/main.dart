import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:file_selector/file_selector.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  _selectFile() async {
    var result = await FileSelector.selectFiles(
        multiselect: true, fileType: FileType.media);
    print(result);
  }

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            RaisedButton.icon(
                onPressed: () {
                  _selectFile();
                },
                icon: Icon(Icons.file_upload),
                label: Text("Files"))
          ],
        ),
      ),
    );
  }
}
