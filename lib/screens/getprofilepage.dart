import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pert/constants/constants.dart';
import 'package:pert/models/profile_model.dart';
import 'package:pert/models/usermodel.dart';
import 'package:pert/screens/profileupdate.dart';
import 'package:country_picker/country_picker.dart';

class GetProfilepage extends StatefulWidget {
  const GetProfilepage({Key? key}) : super(key: key);

  @override
  _GetProfilepageState createState() => _GetProfilepageState();
}

class _GetProfilepageState extends State<GetProfilepage> {
  bool _autovalidate = false;

  final TextEditingController idcontroller = TextEditingController();
  // final TextEditingController groupidcontroller = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController icnocontroller = TextEditingController();
  final TextEditingController departmentcontroller = TextEditingController();
  final TextEditingController phonenocontroller = TextEditingController();
  final TextEditingController address1controller = TextEditingController();
  final TextEditingController address2controller = TextEditingController();
  final TextEditingController agecontroller = TextEditingController();
  final TextEditingController passportcontroller = TextEditingController();
  final TextEditingController postcodecontroller = TextEditingController();
  String? imageUrl;
  String url = 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png';
  String? _phone;
  String? countrycode;
  @override
  void initState() {
    idcontroller.text = "";
    usernamecontroller.text = "";
    icnocontroller.text = "";
    phonenocontroller.text = '';
    address1controller.text = '';
    address2controller.text = '';
    agecontroller.text = '';
    passportcontroller.text = '';
    postcodecontroller.text = '';
  }
  String dropdownValue = 'csc';

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
                  backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : NetworkImage(url),
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


              maxline: 1,
              controller: idcontroller,
              textFieldName: '',
              headingName: 'ID',
              icon: const Icon(
                Icons.person_pin ,
                color: Colors.red,
              ),
            ),
            Profile_field(

              maxline: 1,
              controller: usernamecontroller,
              textFieldName: '',
              headingName: 'Name',
              icon: const Icon(
                Icons.person,
                color: Colors.red,
              ),
            ),
            // Profile_field(
            //
            //   maxline: 1,
            //   controller: icnocontroller,
            //   textFieldName: '',
            //   headingName: 'IC No',
            //   icon: const Icon(
            //     Icons.people,
            //     color: Colors.red,
            //   ),
            // ),
            // Profile_field(
            //
            //   maxline: 1,
            //   controller: departmentcontroller,
            //   textFieldName: '',
            //   headingName: 'Department',
            //   icon: const Icon(
            //     Icons.people,
            //     color: Colors.red,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0,bottom: 16,left: 6,right: 6),
              child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)
                ),
                child: Container(

                  color: Colors.grey.shade100,
                  margin: EdgeInsets.all(2),
                  child: Card(
                    elevation: 2,


                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(

                          alignment: Alignment.center,
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Color(0xFFEF4C43),fontWeight: FontWeight.bold),
                          underline: Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width*0.05,
                            color: Colors.redAccent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;

                            });
                          },
                          items: <String>['csc', 'mech', 'EEE', 'BIO']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              alignment: Alignment.center,
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Profile_field(

              maxline: 1,
              controller: passportcontroller,
              textFieldName: '',
              headingName: 'Passport Number ',
              icon: const Icon(
                Icons.book,
                color: Colors.red,
              ),
            ),
            Profile_field(

              maxline: 1,
              controller: phonenocontroller,
              textFieldName: '',
              headingName: 'Phone No',
              icon: const Icon(
                Icons.phone,
                color: Colors.red,
              ),
            ),
            // SizedBox(
            //   height: 110,
            //   child: Row(
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Profile_field(
            //           textInputType: TextInputType.phone,
            //           onTap: () {
            //             showCountryPicker(
            //               context: context,
            //               showPhoneCode: true, // optional. Shows phone code before the country name.
            //               onSelect: (Country country) {
            //                 print('Select country: ${country.displayName}');
            //                 countrycode = "+" + country.phoneCode;
            //                 countryCodeController.text = "+" + country.phoneCode;
            //               },
            //             );
            //           },
            //           maxline: 1,
            //           controller: countryCodeController,
            //           textFieldName: '+60',
            //           headingName: 'Code',
            //           icon: Icon(
            //             Icons.flag,
            //             color: Colors.red,
            //           ),
            //           onChanged: (value) {
            //             widget.profile.phoneNumber = value;
            //
            //           },
            //         ),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Profile_field(
            //
            //           textInputType: TextInputType.phone,
            //           maxlength: 12,
            //           onsaved: (String? val) {
            //             _phone = val;
            //           },
            //
            //           maxline: 1,
            //           controller: phonenocontroller,
            //           textFieldName: '+65 0895 4562',
            //           headingName: 'Phone No',
            //           icon: Icon(
            //             Icons.phone,
            //             color: Colors.red,
            //           ),
            //           onChanged: (value) {
            //             widget.profile.phoneNumber = value;
            //           },
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Profile_field(

              maxline: 4,
              controller: address1controller,
              textFieldName: '',
              headingName: 'House Address',
              icon: const Icon(
                Icons.home,
                color: Colors.red,
              ),
            ),
            Profile_field(

              maxline: 4,
              controller: address2controller,
              textFieldName: '',
              headingName: 'Residence Address',
              icon: const Icon(
                Icons.location_city,
                color: Colors.red,
              ),
            ),
            // Profile_field(
            //
            //   maxline: 1,
            //   controller: agecontroller,
            //   textFieldName: '',
            //   headingName: 'Age',
            //   icon: const Icon(
            //     Icons.data_usage,
            //     color: Colors.red,
            //   ),
            // ),

            // Profile_field(
            //
            //   maxline: 1,
            //   controller: postcodecontroller,
            //   textFieldName: '',
            //   headingName: 'Post Code',
            //   icon: const Icon(
            //     Icons.location_city,
            //     color: Colors.red,
            //   ),
            // ),
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
                    phoneNumber: phonenocontroller.text,
                    houseAddress: address1controller.text,
                    residenceAddress: address2controller.text,
                    imageUrl: imageUrl,
                    department: dropdownValue,
                    passportNumber: passportcontroller.text,
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
