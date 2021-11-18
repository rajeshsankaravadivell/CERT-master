// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pert/constants/colors.dart';
import 'package:pert/constants/constants.dart';
import 'package:pert/models/profile_model.dart';
import 'package:pert/models/usermodel.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.profile, required this.userModel}) : super(key: key);
  final Profile profile;
  final UserModel userModel;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  String? _phone;
  bool _autoValidate = false;


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




  @override
  void initState() {
    idcontroller.text = widget.profile.id;
    usernamecontroller.text = widget.profile.name;
    icnocontroller.text = widget.profile.icNumber;
    phonenocontroller.text = widget.profile.phoneNumber ?? '';
    address1controller.text = widget.profile.permanentAddress ?? '';
    address2controller.text = widget.profile.currentAddress ?? '';
    agecontroller.text = (widget.profile.age != null) ? widget.profile.age.toString() : '';
    statecontroller.text = widget.profile.state ?? '';
    postcodecontroller.text = (widget.profile.pincode != null) ? widget.profile.pincode.toString() : '';
  }

  bool isEdit = false;
  String url = 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: const Text('Profile'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: bgcolor,
                size: 35,
              ),
            ),
          ],
        ),
        body: isEdit
            ? Padding(
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
                    const SizedBox(
                      height: 15.0,
                    ),
                    Profile_field(autovalidate: _autoValidate,
                      maxline: 1,
                      controller: idcontroller,
                      textFieldName: '5001',
                      headingName: 'ID',
                      icon: const Icon(
                        Icons.device_hub_outlined,
                        color: Colors.red,
                      ),
                      onChanged: (value) {
                        widget.profile.id = value;
                      },
                    ),
                    Profile_field(autovalidate: _autoValidate,
                      maxline: 1,
                      controller: groupidcontroller,
                      textFieldName: '6841',
                      headingName: 'Group ID',
                      icon: const Icon(
                        Icons.people,
                        color: Colors.red,
                      ),
                    ),
                    Profile_field(autovalidate: _autoValidate,
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
                    Profile_field(autovalidate: _autoValidate,
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
                    Profile_field(autovalidate: _autoValidate,
                      maxline: 1,
                      controller: departmentcontroller,
                      textFieldName: 'Department',
                      headingName: 'Department',
                      icon: Icon(
                        Icons.people,
                        color: Colors.red,
                      ),
                    ),
                    Profile_field(autovalidate:true,
                      onsaved: (String?val){
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
                    Profile_field(autovalidate: _autoValidate,
                      maxline: 4,
                      controller: address1controller,
                      textFieldName: 'Address 1 malaysia',
                      headingName: 'Address 1',
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.red,
                      ),
                    ),
                    Profile_field(autovalidate: _autoValidate,
                      maxline: 4,
                      controller: address2controller,
                      textFieldName: 'Address 2 malaysia',
                      headingName: 'Address 2',
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.red,
                      ),
                    ),
                    Profile_field(autovalidate: _autoValidate,
                      maxline: 1,
                      controller: agecontroller,
                      textFieldName: '42',
                      headingName: 'Age',
                      icon: Icon(
                        Icons.data_usage,
                        color: Colors.red,
                      ),
                      onChanged: (value) {
                        widget.profile.age = int.parse(value);
                      },
                    ),
                    Profile_field(autovalidate: _autoValidate,
                      maxline: 1,
                      controller: statecontroller,
                      textFieldName: 'Kulalumpur Federal Teritory',
                      headingName: 'State',
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                      onChanged: (value) {
                        widget.profile.state = value;
                      },
                    ),
                    Profile_field(autovalidate: _autoValidate,
                      maxline: 1,
                      controller: postcodecontroller,
                      textFieldName: '45120',
                      headingName: 'Post Code',
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.red,
                      ),
                      onChanged: (value) {
                        widget.profile.pincode = int.parse(value);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _autoValidate=true;
                          });
                          widget.userModel.updateUser();
                          setState(() {
                            isEdit = false;
                          });
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
              )
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
                                ResultWidget(
                                  heading: 'Age',
                                  text: widget.profile.age.toString(),
                                ),
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
                                  text: '${widget.profile.permanentAddress}',
                                ),
                                Divider(),
                                ResultWidget(
                                  heading: 'Temporary Address ',
                                  text: '${widget.profile.currentAddress}',
                                ),
                                Divider(),
                                ResultWidget(
                                  heading: 'State',
                                  text: '${widget.profile.state}',
                                ),
                                Divider(),
                                ResultWidget(
                                  heading: 'Postal/Zip Code',
                                  text: '${widget.profile.pincode}',
                                ),
                                Divider(),
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
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            headingName,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),

          height: 50,
          // width: 40,
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
              filled: true,
              prefixIcon: icon,
              border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(30))),
              fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              contentPadding: EdgeInsets.zero,
              hintText: textFieldName,
            ),
          ),
        ),
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
