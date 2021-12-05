// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pert/constants/constants.dart';
// import 'package:pert/models/profile_model.dart';
// import 'package:pert/models/usermodel.dart';
// import 'package:pert/screens/profileupdate.dart';
// import 'package:country_picker/country_picker.dart';
//
// class GetProfilepage extends StatefulWidget {
//   const GetProfilepage({Key? key}) : super(key: key);
//
//   @override
//   _GetProfilepageState createState() => _GetProfilepageState();
// }
//
// class _GetProfilepageState extends State<GetProfilepage> {
//   bool _autovalidate = false;
//
//   final TextEditingController idcontroller = TextEditingController();
//   // final TextEditingController groupidcontroller = TextEditingController();
//   final TextEditingController usernamecontroller = TextEditingController();
//   final TextEditingController icnocontroller = TextEditingController();
//   final TextEditingController departmentcontroller = TextEditingController();
//   final TextEditingController phonenocontroller = TextEditingController();
//   final TextEditingController address1controller = TextEditingController();
//   final TextEditingController address2controller = TextEditingController();
//   final TextEditingController agecontroller = TextEditingController();
//   final TextEditingController passportcontroller = TextEditingController();
//   final TextEditingController postcodecontroller = TextEditingController();
//   String? imageUrl;
//   String url = 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png';
//   String? _phone;
//   String? countrycode;
//   @override
//   void initState() {
//     idcontroller.text = "";
//     usernamecontroller.text = "";
//     icnocontroller.text = "";
//     phonenocontroller.text = '';
//     address1controller.text = '';
//     address2controller.text = '';
//     agecontroller.text = '';
//     passportcontroller.text = '';
//     postcodecontroller.text = '';
//   }
//   UserType userType = UserType.localStudent;
//   String dropdownValue = 'Computer Science';
//   bool isLocal=false;
//   bool isStaff=false;
//   // String?  IcNumber='';
//   // String?  PassportNumber='';
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CircleAvatar(
//                   backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : NetworkImage(url),
//                   radius: 45,
//                 ),
//                 TextButton(
//                   onPressed: () async {
//                     imageUrl = await Profile.uploadPhoto();
//                     setState(() {});
//                   },
//                   child: const Text(
//                     'Change Profile Picture',
//                     style: TextStyle(
//                       color: Colors.red,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 15.0,
//             ),
//
//             Text('Are you an international student ?'),
//
//             // Padding(
//             //   padding: const EdgeInsets.only(left: 10, top: 4),
//             //   child: SizedBox(
//             //     height: 40,
//             //     child: Row(
//             //       children: [
//             //         const Text("Yes"),
//             //         Radio<bool>(
//             //           value: true,
//             //           groupValue: isLocal,
//             //           onChanged: (bool? value) {
//             //             setState(() {
//             //               isLocal = value!;
//             //             });
//             //           },
//             //         ),
//             //         const Text("No"),
//             //         Radio<bool>(
//             //           value: false,
//             //           groupValue:isLocal,
//             //           onChanged: (bool? value) {
//             //             setState(() {
//             //               isLocal = value!;
//             //             });
//             //           },
//             //         ),
//             //       ],
//             //     ),
//             //   ),
//             // ),
//             // Text('Are you an staff ?'),
//
//             Padding(
//               padding: const EdgeInsets.only(left: 10, top: 4),
//               child: SizedBox(
//                 height: 40,
//                 child: Row(
//                   children: [
//                     const Text("Yes"),
//                     Radio<bool>(
//                       value: true,
//                       groupValue: isLocal,
//                       onChanged: (bool? value) {
//                         setState(() {
//                           isLocal = value!;
//                         });
//                       },
//                     ),
//                     const Text("No"),
//                     Radio<bool>(
//                       value: false,
//                       groupValue:isLocal,
//                       onChanged: (bool? value) {
//                         setState(() {
//                           isLocal = value!;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Profile_field(
//
//
//               maxline: 1,
//               controller: idcontroller,
//               textFieldName: '',
//               headingName: 'ID',
//               icon: const Icon(
//                 Icons.person_pin ,
//                 color: Colors.red,
//               ),
//             ),
//             Profile_field(
//
//               maxline: 1,
//               controller: usernamecontroller,
//               textFieldName: '',
//               headingName: 'Name',
//               icon: const Icon(
//                 Icons.person,
//                 color: Colors.red,
//               ),
//             ),
//             // Profile_field(
//             //
//             //   maxline: 1,
//             //   controller: icnocontroller,
//             //   textFieldName: '',
//             //   headingName: 'IC No',
//             //   icon: const Icon(
//             //     Icons.people,
//             //     color: Colors.red,
//             //   ),
//             // ),
//             // Profile_field(
//             //
//             //   maxline: 1,
//             //   controller: departmentcontroller,
//             //   textFieldName: '',
//             //   headingName: 'Department',
//             //   icon: const Icon(
//             //     Icons.people,
//             //     color: Colors.red,
//             //   ),
//             // ),
//             Padding(
//               padding: const EdgeInsets.only(top: 16.0,bottom: 16,left: 6,right: 6),
//               child: Material(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18)
//                 ),
//                 child: Container(
//
//                   color: Colors.grey.shade100,
//                   margin: EdgeInsets.all(2),
//                   child: Card(
//                     elevation: 2,
//
//
//                     child: Padding(
//                       padding: const EdgeInsets.all(2),
//                       child: DropdownButtonHideUnderline(
//                         child: DropdownButton<String>(
//
//                           alignment: Alignment.center,
//                           value: dropdownValue,
//                           icon: const Icon(Icons.arrow_downward),
//                           iconSize: 24,
//                           elevation: 16,
//                           style: const TextStyle(color: Color(0xFFEF4C43),fontWeight: FontWeight.bold),
//                           underline: Container(
//                             height: 1,
//                             width: MediaQuery.of(context).size.width*0.05,
//                             color: Colors.redAccent,
//                           ),
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               dropdownValue = newValue!;
//
//                             });
//                           },
//                           items: <String>['Computer Science', 'Mechanical Engineering', 'Civil Engineering', 'Information Technology']
//                               .map<DropdownMenuItem<String>>((String value) {
//                             return DropdownMenuItem<String>(
//                               alignment: Alignment.center,
//                               value: value,
//                               child: Text(value),
//                             );
//                           }).toList(),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             // Profile_field(
//             //
//             //   maxline: 1,
//             //   controller: passportcontroller,
//             //   textFieldName: '',
//             //   headingName: 'Passport Number ',
//             //   icon: const Icon(
//             //     Icons.book,
//             //     color: Colors.red,
//             //   ),
//             // ),
//             isLocal==false
//                 ? Profile_field(
//               textCapitalization: TextCapitalization.characters,
//               maxline: 1,
//               controller: icnocontroller,
//               textFieldName: '',
//               headingName: 'IC No',
//               icon: const Icon(
//                 Icons.people,
//                 color: Colors.red,
//               ),
//               onChanged: (value) {
//                icnocontroller.text = value;
//               },
//             )
//                 : Profile_field(
//
//
//               textCapitalization: TextCapitalization.characters,
//               maxline: 1,
//               textFieldName: '',
//               headingName: 'Passport Number',
//               icon: const Icon(
//                 Icons.book,
//                 color: Colors.red,
//               ),
//               onChanged: (value) {
//                 passportcontroller.text = value;
//               },
//             ),
//             Profile_field(
//
//               maxline: 1,
//               controller: phonenocontroller,
//               textFieldName: '',
//               headingName: 'Phone No',
//               icon: const Icon(
//                 Icons.phone,
//                 color: Colors.red,
//               ),
//             ),
//
//             Profile_field(
//
//               maxline: 4,
//               controller: address1controller,
//               textFieldName: '',
//               headingName: 'House Address',
//               icon: const Icon(
//                 Icons.home,
//                 color: Colors.red,
//               ),
//             ),
//             Profile_field(
//
//               maxline: 4,
//               controller: address2controller,
//               textFieldName: '',
//               headingName: 'Residence Address',
//               icon: const Icon(
//                 Icons.location_city,
//                 color: Colors.red,
//               ),
//             ),
//
//             const SizedBox(
//               height: 20,
//             ),
//             Center(
//               child: InkWell(
//                 onTap: () {
//                   var profile = Profile(
//                      userType: userType,
//                     email: authController.auth.currentUser!.email!,
//                     icNumber: icnocontroller.text,
//                     name: usernamecontroller.text,
//                     id: idcontroller.text,
//                     phoneNumber: phonenocontroller.text,
//                     houseAddress: address1controller.text,
//                     residenceAddress: address2controller.text,
//                     imageUrl: imageUrl,
//                     department: dropdownValue,
//                     passportNumber: passportcontroller.text,
//                   );
//                   print("hello");
//                   UserModel(bioData: profile, uid: authController.auth.currentUser!.uid, isStaff:isStaff ).addCurrentUserDocument();
//                 },
//                 child: const Card(
//                   color: Colors.red,
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Update',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         )),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:pert/constants/constants.dart';

import 'package:pert/models/profile_model.dart';
import 'package:pert/models/usermodel.dart';
import 'package:country_picker/country_picker.dart';
import 'package:pert/screens/profileupdate.dart';



enum SingingCharacter { Yes, No }

class GetProfilepage extends StatefulWidget {
  const GetProfilepage({Key? key }) : super(key: key);


  @override
  _GetProfilepageState createState() => _GetProfilepageState();
}

class _GetProfilepageState extends State<GetProfilepage> {


  int? age;
  int? postalcode;
  String dropdownValue = 'Computer Science';
  UserType userType = UserType.localStudent;
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    backgroundImage: NetworkImage(url),
                    radius: 45,
                  ),
                  TextButton(
                    onPressed: () async {
                      url = await Profile.uploadPhoto();
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
                      userType = newValue ?? UserType.localStudent;
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

              ),
              Profile_field(
                maxline: 1,
                controller: idcontroller,
                textFieldName: '5001',
                headingName: 'Student ID',
                icon:const Icon(FontAwesome5.id_badge),

              ),
              // Profile_field(
              //   maxline: 1,
              //   controller: groupidcontroller,
              //   textFieldName: '6841',
              //   headingName: 'Group ID',
              //   icon: const Icon(
              //     Icons.people,
              //     color: Colors.red,
              //   ),
              // ),
              userType == UserType.internationalStudent ?
              Profile_field(


                textCapitalization: TextCapitalization.characters,
                maxline: 1,
                textFieldName: '',
                headingName: 'Passport Number',
                icon: const Icon(FontAwesome5.passport),
              ) :
              Profile_field(
                textCapitalization: TextCapitalization.characters,
                maxline: 1,
                controller: icnocontroller,
                textFieldName: '',
                headingName: 'IC No',
                icon: const Icon(FontAwesome5.passport),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 16.0,bottom: 16,left: 6,right: 6),
              //   child: Material(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(18)
              //     ),
              //     child: Container(
              //
              //       color: Colors.grey.shade100,
              //       margin: EdgeInsets.all(2),
              //       child: Card(
              //         elevation: 2,
              //
              //
              //         child: Padding(
              //           padding: const EdgeInsets.all(2),
              //           child: DropdownButtonHideUnderline(
              //             child: DropdownButton<String>(
              //
              //               alignment: Alignment.center,
              //               value: dropdownValue,
              //               icon: const Icon(Icons.arrow_downward),
              //               iconSize: 24,
              //               elevation: 16,
              //               style: const TextStyle(color: Color(0xFFEF4C43),fontWeight: FontWeight.bold),
              //               underline: Container(
              //                 height: 1,
              //                 width: MediaQuery.of(context).size.width*0.05,
              //                 color: Colors.redAccent,
              //               ),
              //               onChanged: (String? newValue) {
              //                 setState(() {
              //                   dropdownValue = newValue!;
              //                   widget.profile.department=newValue;
              //                 });
              //               },
              //               items: <String>['Computer Science', 'Mechanical Engineering', 'Civil Engineering', 'Information Technology']
              //                   .map<DropdownMenuItem<String>>((String value) {
              //                 return DropdownMenuItem<String>(
              //                   alignment: Alignment.center,
              //                   value: value,
              //                   child: Text(value),
              //                 );
              //               }).toList(),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                  style: const TextStyle(color: Color(0xFFEF4C43),fontWeight: FontWeight.normal),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      // widget.profile.department=newValue;
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
                  items: departmentsController.departments
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
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Profile_field(

                        textInputType: TextInputType.phone,
                        maxlength: 12,
                        onsaved: (String? val) {

                        },
                        validator: validateMobile,
                        maxline: 1,
                        controller: phonenocontroller,
                        textFieldName: '+65 0895 4562',
                        headingName: 'Phone No',
                        icon: Icon(
                          Icons.phone,

                        ),
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

              ),
              Profile_field(
                maxline: 4,
                controller: address2controller,
                textFieldName: 'Address 2 malaysia',
                headingName: 'Residence Adddress',
                icon: Icon(
                  Icons.location_city,

                ),
              ),

              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
            onPressed: () {
                  var profile = Profile(
                     userType: userType,
                    email: authController.auth.currentUser!.email!,
                    icNumber: icnocontroller.text,
                    name: usernamecontroller.text,
                    id: idcontroller.text,
                    phoneNumber: phonenocontroller.text,
                    houseAddress: address1controller.text,
                    residenceAddress: address2controller.text,
                    imageUrl: url,
                    department: dropdownValue,
                    passportNumber: icnocontroller.text,

                  );
                  print("hello");
                  UserModel(bioData: profile, uid: authController.auth.currentUser!.uid).addCurrentUserDocument();
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




