// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pert/constants/colors.dart';
import 'package:pert/constants/constants.dart';
import 'package:pert/models/profile_model.dart';
import 'package:pert/models/usermodel.dart';
enum SingingCharacter { Yes, No }

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.profile, required this.userModel}) : super(key: key);
  final Profile profile;
  final UserModel userModel;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  String? _phone;

  int ? age;
  int? postalcode;
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  final TextEditingController idcontroller = TextEditingController();
  final TextEditingController groupidcontroller = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController icnocontroller = TextEditingController();
  final TextEditingController departmentcontroller = TextEditingController();
  final TextEditingController phonenocontroller = TextEditingController();
  final TextEditingController address1controller = TextEditingController();
  final TextEditingController address2controller = TextEditingController();
  final TextEditingController agecontroller = TextEditingController();
  final TextEditingController statecontroller = TextEditingController();
  final TextEditingController postcodecontroller = TextEditingController();

  String validateMobile(String? value) {
// Indian Mobile number are of 10 digit only
    if (value!.length != 10) {
      return 'Mobile Number must be of 10 digit';
    } else {
      return "";
    }
  }

  String validateName(int value) {
    if (value<=100) {
      return 'Age must be Numbers up to 100';
    } else {
      return "";
    }
  }


  void _validateInputs() {
    print("I am in validateINputs");
    print(_formKey.currentState);
    if (_formKey.currentState!.validate()) {
//    If all data are correct then save data to out variables
      print("I am in IF validateINputs");
      _formKey.currentState!.save();
    } else {
//    If all data are not valid then start auto validation.
      print("I am in Else validateINputs");
      setState(() {
        _autoValidate = true;
      });
    }
  }




  @override
  void initState() {
    idcontroller.text = widget.profile.id;
    usernamecontroller.text = widget.profile.name;
    icnocontroller.text = widget.profile.icNumber;
    phonenocontroller.text = widget.profile.phoneNumber ?? '';
    address1controller.text = widget.profile.houseAddress ?? '';
    address2controller.text = widget.profile.residenceAddress ?? '';
    // agecontroller.text = (widget.profile.age != null) ? widget.profile.age.toString() : '';
    // statecontroller.text = widget.profile.state ?? '';
    // postcodecontroller.text = (widget.profile.pincode != null) ? widget.profile.pincode.toString() : '';
    widget.profile.isLocal ??= widget.profile.isLocal=true;
    super.initState();
  }

  bool isEdit = false;
  String url = 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text('Profile'),

        ),
        body: isEdit
            ? Form(  key: _formKey,
            autovalidate: _autoValidate
            ,child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: widget.profile.imageUrl != null ? NetworkImage(widget.profile.imageUrl!) : NetworkImage(url),
                    radius: 45,
                  ),
                  TextButton(
                    onPressed: () async {
                      widget.profile.imageUrl = await Profile.uploadPhoto();
                      setState(() {});
                    },
                    child: const Text(
                      'Change Profile Picture',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),

              ListTile(
                title: const Text('Yes'),
                leading: Radio<bool>(
                  value: true,
                  groupValue: widget.profile.isLocal,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.profile.isLocal= value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('No'),
                leading: Radio<bool>(
                  value: false,
                  groupValue: widget.profile.isLocal,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.profile.isLocal = value!;
                    });
                  },
                ),
              ),

              const SizedBox(
                height: 15.0,
              ),


              Profile_field(autovalidate: false,
                maxline: 1,
                controller: usernamecontroller,
                textFieldName: 'Test User',
                headingName: 'User Name',
                icon: Icon(
                  Icons.people,
                  color: Colors.red,
                ),
                onChanged: (value) {
                  widget.profile.name = value;
                },
              ),
              Profile_field(autovalidate: false,
                maxline: 1,
                controller: idcontroller,
                textFieldName: '5001',
                headingName: 'Student ID',
                icon: const Icon(
                  Icons.device_hub_outlined,
                  color: Colors.red,
                ),
                onChanged: (value) {
                  widget.profile.id = value;
                },
              ),
              // Profile_field(autovalidate: false,
              //   maxline: 1,
              //   controller: groupidcontroller,
              //   textFieldName: '6841',
              //   headingName: 'Group ID',
              //   icon: const Icon(
              //     Icons.people,
              //     color: Colors.red,
              //   ),
              // ),

              Profile_field(autovalidate: false,
                maxline: 1,
                controller: icnocontroller,
                textFieldName: 'A8gdt7',
                headingName: 'IC No',
                icon: const Icon(
                  Icons.people,
                  color: Colors.red,
                ),
                onChanged: (value) {
                  widget.profile.icNumber = value;
                },
              ),
              Profile_field(autovalidate: false,
                maxline: 1,
                controller: icnocontroller,
                textFieldName: 'A8gdt7',
                headingName: 'IC No',
                icon: const Icon(
                  Icons.people,
                  color: Colors.red,
                ),
                onChanged: (value) {
                  widget.profile.icNumber = value;
                },
              ),
              Profile_field(autovalidate: false,
                maxline: 1,
                controller: departmentcontroller,
                textFieldName: 'Department',
                headingName: 'Department',
                icon: Icon(
                  Icons.people,
                  color: Colors.red,
                ),
              ),
              Profile_field(autovalidate:_autoValidate,
                onsaved: (String? val){
                  _phone=val;
                },
                validator: validateMobile,
                maxline: 1,
                controller: phonenocontroller,
                textFieldName: '+65 0895 4562',
                headingName: 'Phone No',
                icon: Icon(
                  Icons.people,
                  color: Colors.red,
                ),
                onChanged: (value) {
                  widget.profile.phoneNumber = value;
                },
              ),
              Profile_field(autovalidate: false,
                maxline: 4,
                controller: address1controller,
                textFieldName: 'Address 1 malaysia',
                headingName: 'Address 1',
                icon: Icon(
                  Icons.location_city,
                  color: Colors.red,
                ),
              ),
              Profile_field(autovalidate: false,
                maxline: 4,
                controller: address2controller,
                textFieldName: 'Address 2 malaysia',
                headingName: 'Address 2',
                icon: Icon(
                  Icons.location_city,
                  color: Colors.red,
                ),
              ),
              // Profile_field(autovalidate: _autoValidate,
              //   maxline: 1,
              //   onsaved: (String? val){
              //   age=int.parse(val??"0");
              //   },
              //   controller: agecontroller,
              //   textFieldName: '42',
              //   headingName: 'Age',
              //   icon: Icon(
              //     Icons.data_usage,
              //     color: Colors.red,
              //   ),
              //   onChanged: (value) {
              //     widget.profile.age = int.parse(value);
              //   },
              // ),
              // Profile_field(autovalidate: false,
              //   maxline: 1,
              //   controller: statecontroller,
              //   textFieldName: 'Kulalumpur Federal Teritory',
              //   headingName: 'State',
              //   icon: Icon(
              //     Icons.location_on,
              //     color: Colors.red,
              //   ),
              //   onChanged: (value) {
              //     widget.profile.state = value;
              //   },
              // ),
              // Profile_field(autovalidate: false,
              //   maxline: 1,
              //   controller: postcodecontroller,
              //   textFieldName: '45120',
              //   headingName: 'Post Code',
              //   icon: Icon(
              //     Icons.location_city,
              //     color: Colors.red,
              //   ),
              //   onChanged: (value) {
              //     widget.profile.pincode = int.parse(value);
              //   },
              // ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  onTap: () {

                    _validateInputs();


                    if(_formKey.currentState!.validate()){
                      widget.userModel.updateUser();
                      print("form Saved");
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Check Your Fields')));
                    }

                  },
                  child: Card(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Update',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ))
            : Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    color: Colors.red,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: CircleAvatar(
                            backgroundImage: widget.profile.imageUrl != null ? NetworkImage(widget.profile.imageUrl!) : NetworkImage(url),
                            radius: 45,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ListTile(
                                  // title: Text('Your Profile'),
                                  trailing: TextButton.icon(
                                      onPressed: () => setState(() => isEdit = true),
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.red,
                                      ),
                                      label: Text(
                                        'Edit Profile',
                                        style: TextStyle(color: Colors.red),
                                      )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ResultWidget(
                                  heading: 'Name',
                                  text: widget.profile.name,
                                ),
                                Divider(),
                                ResultWidget(heading: 'ID', text: widget.profile.id),
                                Divider(),
                                ResultWidget(
                                  heading: 'IC No',
                                  text: widget.profile.icNumber,
                                ),
                                Divider(),
                                // ResultWidget(
                                //   heading: 'Age',
                                //   text: widget.profile.age.toString(),
                                // ),
                                Divider(),
                                ResultWidget(
                                  heading: 'Department',
                                  text: 'Department',
                                ),
                                Divider(),
                                ResultWidget(
                                  heading: 'Phone No',
                                  text: '${widget.profile.phoneNumber}',
                                ),
                                Divider(),
                                ResultWidget(
                                  heading: 'Permanent Address',
                                  text: '${widget.profile.houseAddress}',
                                ),
                                Divider(),
                                ResultWidget(
                                  heading: 'Temporary Address ',
                                  text: '${widget.profile.residenceAddress}',
                                ),
                                // Divider(),
                                // ResultWidget(
                                //   heading: 'State',
                                //   text: '${widget.profile.state}',
                                // ),
                                // Divider(),
                                // ResultWidget(
                                //   heading: 'Postal/Zip Code',
                                //   text: '${widget.profile.pincode}',
                                // ),
                                // Divider(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class Profile_field extends StatelessWidget {
  final String textFieldName;
  final String headingName;
  final Icon icon;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String Function(String?)? validator;
  final int maxline;
  final void Function(String?)? onsaved;
  final bool autovalidate;
  const Profile_field(
      {Key? key,
      required this.textFieldName,
      required this.icon,
      required this.headingName,
      this.controller,
      this.onChanged,
      this.validator,
      required this.maxline, this.onsaved, required this.autovalidate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(left: 15),
        //   child: Text(
        //     headingName,
        //     style: TextStyle(
        //       color: Colors.red,
        //       fontWeight: FontWeight.bold,
        //       fontSize: 15,
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            autovalidate: autovalidate,
            onSaved: onsaved,
            validator: validator,
            onChanged: onChanged,
            controller: controller,
            maxLines:maxline,
            style: TextStyle(fontSize: 17),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
    labelText: headingName,
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
    contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
    ),),
        )
        //   InputDecoration(
        //     filled: true,
        //     prefixIcon: icon,
        //     border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(30))),
        //     fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        //     contentPadding: EdgeInsets.zero,
        //     hintText: textFieldName,
        //   ),
        // ),
        // Container(
        //   margin: const EdgeInsets.all(15.0),
        //   padding: const EdgeInsets.all(3.0),
        //   decoration: BoxDecoration(
        //     border: Border.all(color: Colors.grey),
        //     borderRadius: BorderRadius.circular(12),
        //     color: Colors.white,
        //   ),
        //
        //   height: 50,
        //   // width: 40,
        //   child:
        // ),
      ],
    );
  }
}

class ResultWidget extends StatelessWidget {
  final String heading;
  final String text;
  const ResultWidget({
    Key? key,
    required this.text,
    required this.heading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            text,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
