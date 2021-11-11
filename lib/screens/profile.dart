// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pert/constants/colors.dart';
import 'package:pert/constants/constants.dart';
import 'package:pert/models/profile_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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

  @override
  void initState(){
      idcontroller.text = userController.user.bioData.id;
      usernamecontroller.text = userController.user.bioData.name;
      icnocontroller.text = userController.user.bioData.icNumber;
      phonenocontroller.text =userController.user.bioData.phoneNumber ?? '';
      address1controller.text = userController.user.bioData.permanentAddress ?? '';
      address2controller.text = userController.user.bioData.currentAddress ?? '';
      agecontroller.text = (userController.user.bioData.age != null) ? userController.user.bioData.age.toString() : '';
      statecontroller.text = userController.user.bioData.state ?? '';
      postcodecontroller.text = (userController.user.bioData.pincode != null) ? userController.user.bioData.pincode.toString() : '';
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
                          backgroundImage: userController.user.bioData.imageUrl !=null ? NetworkImage(userController.user.bioData.imageUrl!) :
                          NetworkImage(url),
                          radius: 45,
                        ),
                        TextButton(
                          onPressed: () async {
                            userController.user.bioData.imageUrl = await Profile.uploadPhoto();
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
                    const SizedBox(
                      height: 15.0,
                    ),
                    Profile_field(
                      controller: idcontroller,
                      textFieldName: '5001',
                      headingName: 'ID',
                      icon: const Icon(
                        Icons.device_hub_outlined,
                        color: Colors.red,
                      ),
                      onChanged: (value) {
                        userController.user.bioData.id = value;
                      },
                    ),
                    Profile_field(
                      controller: groupidcontroller,
                      textFieldName: '6841',
                      headingName: 'Group ID',
                      icon: const Icon(
                        Icons.people,
                        color: Colors.red,
                      ),
                    ),
                    Profile_field(
                      controller: usernamecontroller,
                      textFieldName: 'Test User',
                      headingName: 'User Name',
                      icon: Icon(
                        Icons.people,
                        color: Colors.red,
                      ),
                      onChanged: (value) {
                        userController.user.bioData.name = value;
                      },
                    ),
                    Profile_field(
                      controller: icnocontroller,
                      textFieldName: 'A8gdt7',
                      headingName: 'IC No',
                      icon: const Icon(
                        Icons.people,
                        color: Colors.red,
                      ),
                      onChanged:  (value) {
                        userController.user.bioData.icNumber=value;
                      },
                    ),
                    Profile_field(
                      controller: departmentcontroller,
                      textFieldName: 'Department',
                      headingName: 'Department',
                      icon: Icon(
                        Icons.people,
                        color: Colors.red,
                      ),
                    ),
                    Profile_field(
                      controller: phonenocontroller,
                      textFieldName: '+65 0895 4562',
                      headingName: 'Phone No',
                      icon: Icon(
                        Icons.people,
                        color: Colors.red,
                      ),
                      onChanged:  (value) {
                        userController.user.bioData.phoneNumber=value;
                      },
                    ),
                    Profile_field(
                      controller: address1controller,
                      textFieldName: 'Address 1 malaysia',
                      headingName: 'Address 1',
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.red,
                      ),
                    ),
                    Profile_field(
                      controller: address2controller,
                      textFieldName: 'Address 2 malaysia',
                      headingName: 'Address 2',
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.red,
                      ),
                    ),
                    Profile_field(
                      controller: agecontroller,
                      textFieldName: '42',
                      headingName: 'Age',
                      icon: Icon(
                        Icons.data_usage,
                        color: Colors.red,
                      ),
                      onChanged: (value){
                        userController.user.bioData.age = int.parse(value);
                      },
                    ),
                    Profile_field(
                      controller: statecontroller,
                      textFieldName: 'Kulalumpur Federal Teritory',
                      headingName: 'State',
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                      onChanged:  (value) {
                        userController.user.bioData.state= value;
                      },
                    ),
                    Profile_field(
                      controller: postcodecontroller,
                      textFieldName: '45120',
                      headingName: 'Post Code',
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.red,
                      ),
                      onChanged:  (value) {
                        userController.user.bioData.pincode = int.parse(value) ;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          userController.user.updateUser();
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
                          child:CircleAvatar(
                            backgroundImage: userController.user.bioData.imageUrl !=null ? NetworkImage(userController.user.bioData.imageUrl!) :
                            NetworkImage(url),
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
                                  text: userController.user.bioData.name,
                                ),
                                Divider(),
                                ResultWidget(heading: 'ID', text: userController.user.bioData.id),
                                Divider(),
                                ResultWidget(
                                  heading: 'IC No',
                                  text: userController.user.bioData.icNumber,
                                ),
                                Divider(),
                                ResultWidget(
                                  heading: 'Age',
                                  text: userController.user.bioData.age.toString(),
                                ),
                                Divider(),
                                ResultWidget(
                                  heading: 'Department',
                                  text: 'Department',
                                ),
                                Divider(),
                                ResultWidget(
                                  heading: 'Phone No',
                                  text: '${userController.user.bioData.phoneNumber}',
                                ),
                                Divider(),
                                ResultWidget(
                                  heading: 'Permanent Address',
                                  text: '${userController.user.bioData.permanentAddress}',
                                ),
                                Divider(),
                                ResultWidget(
                                  heading: 'Temporary Address ',
                                  text: '${userController.user.bioData.currentAddress}',
                                ),
                                Divider(),
                                ResultWidget(
                                  heading: 'State',
                                  text: '${userController.user.bioData.state}',
                                ),
                                Divider(),
                                ResultWidget(
                                  heading: 'Postal/Zip Code',
                                  text: '${userController.user.bioData.pincode}',
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
  const Profile_field({Key? key, required this.textFieldName, required this.icon, required this.headingName, this.controller, this.onChanged})
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

          height: 36,
          // width: 40,
          child: TextField(
            onChanged: onChanged,
            controller: controller,
            maxLines: 1,
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
