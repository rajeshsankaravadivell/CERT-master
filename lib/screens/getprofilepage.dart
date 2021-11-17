import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pert/constants/constants.dart';
import 'package:pert/models/profile_model.dart';
import 'package:pert/models/usermodel.dart';
import 'package:pert/screens/profile.dart';

class GetProfilepage extends StatefulWidget {
  const GetProfilepage({Key? key}) : super(key: key);

  @override
  _GetProfilepageState createState() => _GetProfilepageState();
}

class _GetProfilepageState extends State<GetProfilepage> {
  final TextEditingController idcontroller = TextEditingController();
  // final TextEditingController groupidcontroller = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController icnocontroller = TextEditingController();
  final TextEditingController departmentcontroller = TextEditingController();
  final TextEditingController phonenocontroller = TextEditingController();
  final TextEditingController address1controller = TextEditingController();
  final TextEditingController address2controller = TextEditingController();
  final TextEditingController agecontroller = TextEditingController();
  final TextEditingController statecontroller = TextEditingController();
  final TextEditingController postcodecontroller = TextEditingController();
  String? imageUrl;
  String url = 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png';
  @override
  void initState() {
    idcontroller.text = "";
    usernamecontroller.text = "";
    icnocontroller.text = "";
    phonenocontroller.text = '';
    address1controller.text = '';
    address2controller.text = '';
    agecontroller.text = '';
    statecontroller.text = '';
    postcodecontroller.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: imageUrl !=null ? NetworkImage(imageUrl!) : NetworkImage(url) ,
                  radius: 45,
                ),
                TextButton(
                  onPressed: () async {
                    imageUrl = await Profile.uploadPhoto();
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
            Profile_field(
              controller: idcontroller,
              textFieldName: '',
              headingName: 'ID',
              icon: const Icon(
                Icons.device_hub_outlined,
                color: Colors.red,
              ),
            ),
            Profile_field(
              controller: usernamecontroller,
              textFieldName: '',
              headingName: 'Name',
              icon: const Icon(
                Icons.people,
                color: Colors.red,
              ),
            ),
            Profile_field(
              controller: icnocontroller,
              textFieldName: '',
              headingName: 'IC No',
              icon: const Icon(
                Icons.people,
                color: Colors.red,
              ),
            ),
            Profile_field(
              controller: departmentcontroller,
              textFieldName: '',
              headingName: 'Department',
              icon: const Icon(
                Icons.people,
                color: Colors.red,
              ),
            ),
            Profile_field(
              controller: phonenocontroller,
              textFieldName: '',
              headingName: 'Phone No',
              icon: const Icon(
                Icons.people,
                color: Colors.red,
              ),
            ),
            Profile_field(
              controller: address1controller,
              textFieldName: '',
              headingName: 'Address 1',
              icon: const Icon(
                Icons.location_city,
                color: Colors.red,
              ),
            ),
            Profile_field(
              controller: address2controller,
              textFieldName: '',
              headingName: 'Address 2',
              icon: const Icon(
                Icons.location_city,
                color: Colors.red,
              ),
            ),
            Profile_field(
              controller: agecontroller,
              textFieldName: '',
              headingName: 'Age',
              icon: const Icon(
                Icons.data_usage,
                color: Colors.red,
              ),
            ),
            Profile_field(
              controller: statecontroller,
              textFieldName: '',
              headingName: 'State',
              icon: const Icon(
                Icons.location_on,
                color: Colors.red,
              ),
            ),
            Profile_field(
              controller: postcodecontroller,
              textFieldName: '',
              headingName: 'Post Code',
              icon: const Icon(
                Icons.location_city,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  var profile = Profile(
                    email: authController.auth.currentUser!.email!,
                    icNumber: icnocontroller.text,
                    name: usernamecontroller.text,
                    id: idcontroller.text,
                    age: int.parse(agecontroller.text),
                    state: statecontroller.text,
                    phoneNumber: phonenocontroller.text,
                    permanentAddress: address1controller.text,
                    currentAddress: address2controller.text,
                    imageUrl: imageUrl,
                  );
                  print("hello");
                  UserModel(bioData: profile, uid: authController.auth.currentUser!.uid).addCurrentUserDocument();

                },
                child: const Card(
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
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
      ),
    );
  }
}
