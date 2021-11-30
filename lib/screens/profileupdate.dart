// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import 'package:pert/models/profile_model.dart';
import 'package:pert/models/usermodel.dart';
import 'package:country_picker/country_picker.dart';



enum SingingCharacter { Yes, No }

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({Key? key, required this.profile, required this.userModel}) : super(key: key);
  final Profile profile;
  final UserModel userModel;

  @override
  _ProfileUpdateState createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  String? _phone;

  int? age;
  int? postalcode;
  String dropdownValue = 'Computer Science';
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
  final TextEditingController countryCodeController = TextEditingController();

  String validateMobile(String? value) {
// Indian Mobile number are of 10 digit only
    if (value!.length != 10) {
      return 'Mobile Number must be of 10 digit';
    } else {
      return "";
    }
  }

  String validateName(int value) {
    if (value <= 100) {
      return 'Age must be Numbers up to 100';
    } else {
      return "";
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
    countryCodeController.text = widget.profile.countryCode ?? '';
    // agecontroller.text = (widget.profile.age != null) ? widget.profile.age.toString() : '';
    // statecontroller.text = widget.profile.state ?? '';
    // postcodecontroller.text = (widget.profile.pincode != null) ? widget.profile.pincode.toString() : '';
    // widget.profile.isLocal ??= widget.profile.isLocal=true;
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
        body:
             Padding(
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
                            setState(() {



                            });
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
                    Divider(),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 16, left: 10),
                    //   child: Text("Are you an International student ?"),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 10, top: 4),
                    //   child: SizedBox(
                    //     height: 40,
                    //     child: Row(
                    //       children: [
                    //         Text("Yes"),
                    //         Radio<bool>(
                    //           value: true,
                    //           groupValue: widget.profile.isLocal,
                    //           onChanged: (bool? value) {
                    //             setState(() {
                    //               widget.profile.isLocal = value!;
                    //             });
                    //           },
                    //         ),
                    //         Text("No"),
                    //         Radio<bool>(
                    //           value: false,
                    //           groupValue: widget.profile.isLocal,
                    //           onChanged: (bool? value) {
                    //             setState(() {
                    //               widget.profile.isLocal = value!;
                    //             });
                    //           },
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField(
                        style: const TextStyle(color: Color(0xFFEF4C43),fontWeight: FontWeight.normal),
                        onChanged: (UserType? newValue) {
                          setState(() {
                            widget.profile.userType=newValue ?? UserType.localStudent;
                          });
                        },
                        decoration: InputDecoration(
                          constraints: BoxConstraints.expand(height: 65),
                          prefixIcon: Icon(Icons.person),
                          enabled: true,
                          labelText: 'User Category',
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
                        ),
                        items: [UserType.internationalStudent, UserType.localStudent, UserType.staff]
                            .map<DropdownMenuItem<UserType>>((UserType value) {
                          return DropdownMenuItem<UserType>(
                            alignment: Alignment.center,
                            value: value,
                            child: getText(value),
                          );
                        }).toList(),
                      ),
                    ),

                    const SizedBox(
                      height: 15.0,
                    ),

                    Profile_field(
                      maxline: 1,
                      controller: usernamecontroller,
                      textFieldName: 'Test User',
                      headingName: 'User Name',
                      icon: Icon(
                        Icons.person_outline_outlined ,

                      ),
                      onChanged: (value) {
                        widget.profile.name = value;
                      },
                    ),
                    Profile_field(
                      maxline: 1,
                      controller: idcontroller,
                      textFieldName: '5001',
                      headingName: 'Student ID',
                      icon: const Icon(FontAwesome5.id_badge),
                      onChanged: (value) {
                        widget.profile.id = value;
                      },
                    ),
                    // Profile_field(

                    widget.profile.userType==UserType.internationalStudent?
                    Profile_field(


                      textCapitalization: TextCapitalization.characters,
                      maxline: 1,
                      textFieldName: '',
                      headingName: 'Passport Number',
                      icon: const Icon(FontAwesome5.passport),
                      onChanged: (value) {
                        widget.profile.passportNumber = value;
                      },
                    ) :
               Profile_field(
               textCapitalization: TextCapitalization.characters,
               maxline: 1,
             controller: icnocontroller,
             textFieldName: '',
             headingName: 'IC No',
             icon: const Icon(FontAwesome5.passport),
        onChanged: (value) {
          widget.profile.icNumber = value;
        },
      ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField(
                        style: const TextStyle(color: Color(0xFFEF4C43),fontWeight: FontWeight.normal),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                            widget.profile.department=newValue;
                          });
                        },
                        decoration: InputDecoration(
                          constraints: BoxConstraints.expand(height: 65),
                          prefixIcon: Icon(Icons.supervised_user_circle_outlined),
                          enabled: true,
                          labelText: 'Department',
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
                        ),
                        items: <String>['Computer Science', 'Mechanical Engineering', 'Civil Engineering', 'Information Technology']
                              .map<DropdownMenuItem<String>>((String value) {
             return DropdownMenuItem<String>(
             alignment: Alignment.center,
             value: value,
             child: Text(value),
             );
             }).toList(),
                      ),
                    ),



                    SizedBox(
                      height: 110,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Profile_field(
                              textInputType: TextInputType.phone,
                              onTap: () {
                                showCountryPicker(
                                  context: context,
                                  showPhoneCode: true, // optional. Shows phone code before the country name.
                                  onSelect: (Country country) {
                                    print('Select country: ${country.displayName}');
                                    widget.profile.countryCode = "+" + country.phoneCode;
                                    countryCodeController.text = "+" + country.phoneCode;
                                  },
                                );
                              },
                              maxline: 1,
                              controller: countryCodeController,
                              textFieldName: '+60',
                              headingName: 'Code',
                              icon: Icon(
                                Icons.flag,

                              ),
                              onChanged: (value) {
                                widget.profile.phoneNumber = value;

                              },
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Profile_field(

                              textInputType: TextInputType.phone,
                              maxlength: 12,
                              onsaved: (String? val) {
                                _phone = val;
                              },
                              validator: validateMobile,
                              maxline: 1,
                              controller: phonenocontroller,
                              textFieldName: '+65 0895 4562',
                              headingName: 'Phone No',
                              icon: Icon(
                                Icons.phone,

                              ),
                              onChanged: (value) {
                                widget.profile.phoneNumber = value;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Profile_field(
                      maxline: 4,
                      controller: address1controller,
                      textFieldName: 'Address 1 malaysia',
                      headingName: 'House Address',
                      icon: Icon(
                        Icons.home,

                      ),
                      onChanged: (value) {
                        widget.profile.houseAddress = value;
                      },
                    ),
                    Profile_field(
                      maxline: 4,
                      controller: address2controller,
                      textFieldName: 'Address 2 malaysia',
                      headingName: 'Residence Adddress',
                      icon: Icon(
                        Icons.location_city,

                      ),
                      onChanged: (value) {
                        widget.profile.residenceAddress = value;
                      },
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          print('tapped');
                          widget.userModel.bioData = widget.profile;

                          var result = await widget.userModel.updateUser();
                          if (result != null) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result["message"].toString())));
                          }
                        },
                        child: Text(
                          'Update',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

      ),
    );
  }

  getText(UserType value) {
    switch(value.index) {
      case 0: return Text("Local Student");
      case 1 : return Text("International Student");
      case 2 : return Text("Staff");
      default : return Text("");
    }
  }
}

class Profile_field extends StatelessWidget {
  final String textFieldName;
  final String headingName;
  final TextInputType? textInputType;
  final Icon icon;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String Function(String?)? validator;
  final int maxline;
  final void Function(String?)? onsaved;
  final int? maxlength;
  final void Function()? onTap;
  final bool? enabled;
  final TextCapitalization? textCapitalization;

  const Profile_field({
    Key? key,
    required this.textFieldName,
    required this.icon,
    required this.headingName,
    this.controller,
    this.onChanged,
    this.validator,
    required this.maxline,
    this.onsaved,
    this.maxlength,
    this.textInputType,
    this.onTap,
    this.enabled = true,
    this.textCapitalization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(

            textCapitalization: textCapitalization ?? TextCapitalization.none,
            keyboardType: textInputType,
            maxLength: maxlength,
            onSaved: onsaved,
            validator: validator,
            onChanged: onChanged,
            controller: controller,
            maxLines: maxline,
            onTap: onTap,
            style: TextStyle(fontSize: 17),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              prefixIcon: icon,
              enabled: enabled!,
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
            ),
          ),
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
  final double? height;
  const ResultWidget({
    Key? key,
    required this.text,
    required this.heading, this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.ltr,
        children: [
          Text(
            heading,
            style: TextStyle(


              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(

            height: height,
            child: Text(
              text,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          )
        ],
      ),
    );
  }
}
