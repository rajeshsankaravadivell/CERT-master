import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pert/models/usermodel.dart';
import 'package:pert/screens/profileupdate.dart';
import 'package:pert/models/profile_model.dart';




class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.profile, required this.userModel}) : super(key: key);
  final Profile profile;
  final UserModel userModel;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String url = 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),
      centerTitle: true,),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            color: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: CircleAvatar(
                    backgroundImage: widget.profile.imageUrl != null ? NetworkImage(widget.profile.imageUrl!) : NetworkImage(url),
                    radius: 45,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 10,
                  shape: const RoundedRectangleBorder(
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
                              onPressed: (){
                              Get.to(()=>ProfileUpdate( profile: widget.userModel.bioData,
                                userModel: widget.userModel,));

                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.red,
                              ),
                              label: const Text(
                                'Edit Profile',
                                style: TextStyle(color: Colors.red),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ResultWidget(
                          heading: 'Name',
                          text: widget.profile.name,
                        ),
                        Divider(),
                        ResultWidget(heading: 'ID', text: widget.profile.id),
                        Divider(),
                        !widget.profile.isLocal ?

                        ResultWidget(
                          heading: 'IC No',
                          text: widget.profile.icNumber,
                        ) :ResultWidget(text: widget.profile.passportNumber, heading: 'Passpor Number'),

                        // ResultWidget(
                        //   heading: 'Age',
                        //   text: widget.profile.age.toString(),
                        // ),
                        Divider(),
                       ResultWidget(
                          heading: 'Department',
                          text: widget.profile.department,
                        ),
                        Divider(),
                        ResultWidget(
                          heading: 'Phone No',
                          text: widget.profile.countryCode.toString() +" "+ '${widget.profile.phoneNumber}',
                        ),
                        Divider(),
                        ResultWidget(
                          height: 120,
                          heading: 'house address',
                          text: '${widget.profile.houseAddress}',
                        ),
                        Divider(),
                        ResultWidget(
                          height: 120,
                          heading: 'resident address ',
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
    );
  }
}
