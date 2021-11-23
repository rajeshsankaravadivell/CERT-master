import 'dart:io';
import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pert/constants/constants.dart';
import 'package:pert/models/complaint.dart';
import 'package:pert/models/usermodel.dart';
import 'package:pert/widgets/customtextbox.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';

class WhistleBlower extends StatefulWidget {
  WhistleBlower({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;

  @override
  _WhistleBlowerState createState() => _WhistleBlowerState();
}

class _WhistleBlowerState extends State<WhistleBlower> {
  File? _image;
  String? _path;
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();

  }

  Future chooseFile() async {
    var file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        _path = file.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(

        backgroundColor: Color(0xFFEF4C43),
        automaticallyImplyLeading: true,
        title: const Text(
          'Whistle Blower',
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
        child: SingleChildScrollView(
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
                      'https://static.thenounproject.com/png/89125-200.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await chooseFile();
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.all(12),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.22,
                                  height: MediaQuery.of(context).size.height * 0.1,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(
                                    Icons.attach_file,
                                    color: Colors.blueAccent,
                                    size: 24,
                                  ),
                                ),
                              ),
                              _path != null ? Text(basename(_path.toString())) : Text(''),
                            ],
                          ),
                        ),
                        CustomTextBox(controller: textController1!, labelText: 'Title', hintText: 'Sample SOP', keyboardType: TextInputType.text),
                        // CustomTextBox(
                        //     controller: textController2!, labelText: 'Description', hintText: '-------------', keyboardType: TextInputType.text),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                          child: TextFormField(
                            maxLines: 5,
                            controller: textController3,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Content',
                              labelStyle: const TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFFEF4C43),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              hintText: '------------------',
                              hintStyle: const TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF95A1AC),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    child: Text('Send'),
                    onPressed: () async {
                      print("_path");
                      var future;
                      if (_path != null)
                       {
                         future = Complaint.createComplaintWithAttachment(null, textController1!.text, textController2!.text, textController3!.text, File(_path!),
                             widget.userModel.uid);
                       }
                      else
                        {
                          future = Complaint.createComplaint(null, textController1!.text, textController2!.text, textController3!.text, null,
                            widget.userModel.uid);
                        }
                      showDialog(
                        context: context,
                        builder: (context) {
                          return FutureBuilder(
                            future: future,
                            builder: (context, snapshot) {
                              Widget title, content;
                              var textStyle = const TextStyle(color: Colors.black);
                              if (snapshot.hasData) {
                                title = const Text("Complaint Registered");
                                content = const Text("Complaint has been added successfully");
                                return AlertDialog(title: title, titleTextStyle: textStyle, content: content, actions: [
                                  TextButton(
                                    onPressed: () {
                                      textController1!.clear();
                                      textController2!.clear();
                                      textController3!.clear();
                                      _path = null;
                                      Navigator.pop(context, 'OK');
                                    },
                                    child: const Text('OK'),
                                  ),
                                ]);
                              } else {
                                return const Center(
                                    child: SizedBox(
                                  child: CircularProgressIndicator(),
                                ));
                              }
                            },
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
