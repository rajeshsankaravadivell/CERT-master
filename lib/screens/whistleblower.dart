

import 'package:pert/widgets/customtextbox.dart';

import 'package:flutter/material.dart';


class WhistleBlower extends StatefulWidget {
  WhistleBlower({Key? key}) : super(key: key);

  @override
  _WhistleBlowerState createState() => _WhistleBlowerState();
}

class _WhistleBlowerState extends State<WhistleBlower> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFEF4C43),
        automaticallyImplyLeading: true,
        title: Text(
          'Contact History',
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
                    child: Image.asset(
                      'assets/images/mega phone.png',
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
                        Padding(
                          padding: EdgeInsetsDirectional.all(12),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.22,
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Icons.attach_file,
                              color:Colors.blueAccent,
                              size: 24,
                            ),
                          ),
                        ),
                        CustomTextBox(controller: textController1!, labelText:
                        'Title', hintText:'Sample SOP', keyboardType:
                        TextInputType.text),
                        CustomTextBox(controller: textController2!, labelText:
                        'Description', hintText:'-------------', keyboardType:
                        TextInputType.text),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                          child: TextFormField(
                            maxLines: 5,
                            controller: textController3,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Content',
                              labelStyle: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFFEF4C43),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              hintText: '------------------',
                              hintStyle: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF95A1AC),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                              EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                            ),
                            style: TextStyle(
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
                  ElevatedButton(child: Text('Send'),onPressed: (){},)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
