import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
// ignore: unused_import
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pert/models/announcements.dart';


class Carousel extends StatefulWidget {
  Carousel({Key? key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  Paths? _path;
  late List<Paths?> _paths = [];
  late List<Widget> items = [];

  @override
  void initState() {
    super.initState();
  }

  Future chooseFile() async {
    var file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        _path = Paths(type: PathType.file, path: file.path);
        _paths.add(_path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          chooseFile();
        },
        backgroundColor: Colors.red,
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFFEF4C43),
        automaticallyImplyLeading: true,
        title: Text(
          'Upload slider images',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder(
          future: getCaruosel(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                snapshot.data["imageUrl"].forEach((elemnt) {
                  _paths.add(Paths(type: PathType.url, path: elemnt.toString()));
                });
                print(_paths);
              }
              return
                SingleChildScrollView(
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 300,
                          autoPlay: true,
                          aspectRatio: 2,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                        ),
                        items: getItems(),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              alignment: WrapAlignment.start,
                              children: getItems(),
                            ),
                            GestureDetector (
                              onTap: () {
                                chooseFile();
                              },
                              child: Padding(
                                padding: EdgeInsetsDirectional.all(12),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.20,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Icon(
                                      Icons.add_a_photo,
                                      // color: FlutterFlowTheme.primaryColor,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Scaffold(body: Center(child: CircularProgressIndicator()));
            }
          },
        ),
      ),
    );
  }

  Widget getTile(Paths path) {
    switch (path.type) {
      case PathType.url:
        return NetworkImage(url: path.path!);

      case PathType.file:
        return FileImage(path: path.path!);

      case PathType.noPath:
        return NullImage();
    }
  }

  void showSucessDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Successfully Compliant Created", style: TextStyle(color: Colors.black)),
          );
        });
  }

  List<Widget> getItems() {
    List<Widget> widgets = [];
    _paths.forEach((element) {
      widgets.add(getTile(element!));
    });
    return widgets;
  }
}

class NullImage extends StatelessWidget {
  const NullImage({
    Key? key,
    this.onTap,
  }) : super(key: key);
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsetsDirectional.all(12),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.42,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
            borderRadius: BorderRadius.circular(20),
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: Icon(
              Icons.add_a_photo,
              // color: FlutterFlowTheme.primaryColor,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}

class FileImage extends StatelessWidget {
  const FileImage({
    Key? key,
    required this.path,
  }) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    File file = File(path);
    return Padding(
      padding: EdgeInsetsDirectional.all(12),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.42,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.file(File(path)),
            ),
            Positioned(top: 15, right: 15, child: Icon(Icons.close_rounded))
          ],
        ),
      ),
    );
  }
}

class NetworkImage extends StatelessWidget {
  const NetworkImage({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    File file = File(url);
    return Padding(
      padding: EdgeInsetsDirectional.all(12),
      child: Container(
        child: Stack(
          children: [Image.network(url), Positioned(top: 15, right: 15, child: Icon(Icons.close_rounded))],
        ),
      ),
    );
  }
}

class Paths {
  Paths({
    required this.type,
    this.path,
  });
  String? path;
  PathType type;
}

enum PathType { url, file, noPath }

Future<Map<String, dynamic>> getCaruosel() async {
  return await firestore.collection('dashboard').doc('carousel').get().then((snapshot) {
    if (snapshot.exists) {
      return snapshot.data()!;
    } else
      return {"code": "failure"};
  });
}