import 'package:flutter/material.dart';
import 'package:pert/constants/colors.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isEdit = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('Contact History'),
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
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
                          radius: 45,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Change Profile Picture',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Profile_field(
                      textFieldName: '5001',
                      headingName: 'ID',
                      icon: Icon(
                        Icons.device_hub_outlined,
                        color: Colors.red,
                      ),
                    ),
                    Profile_field(
                      textFieldName: '6841',
                      headingName: 'Group ID',
                      icon: Icon(
                        Icons.people,
                        color: Colors.red,
                      ),
                    ),
                    Profile_field(
                      textFieldName: 'Test User',
                      headingName: 'User Name',
                      icon: Icon(
                        Icons.people,
                        color: Colors.red,
                      ),
                    ),
                    Profile_field(
                      textFieldName: 'A8gdt7',
                      headingName: 'IC No',
                      icon: Icon(
                        Icons.people,
                        color: Colors.red,
                      ),
                    ),
                    Profile_field(
                      textFieldName: 'Department',
                      headingName: 'Department',
                      icon: Icon(
                        Icons.people,
                        color: Colors.red,
                      ),
                    ),
                    Profile_field(
                      textFieldName: '+65 0895 4562',
                      headingName: 'Phone No',
                      icon: Icon(
                        Icons.people,
                        color: Colors.red,
                      ),
                    ),
                    Profile_field(
                      textFieldName: 'Address 1 malaysia',
                      headingName: 'Address 1',
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.red,
                      ),
                    ),
                    Profile_field(
                      textFieldName: 'Address 2 malaysia',
                      headingName: 'Address 2',
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.red,
                      ),
                    ),
                    Profile_field(
                      textFieldName: '42',
                      headingName: 'Age',
                      icon: Icon(
                        Icons.data_usage,
                        color: Colors.red,
                      ),
                    ),
                    Profile_field(
                      textFieldName: 'Kulalumpur Federal Teritory',
                      headingName: 'State',
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                    ),
                    Profile_field(
                      textFieldName: '45120',
                      headingName: 'Post Code',
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
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
                            backgroundImage: NetworkImage(
                                'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
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
                                      onPressed: () =>
                                          setState(() => isEdit = true),
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
                                  text: 'Test User',
                                ),
                                Divider(),
                                ResultWidget(heading: 'ID', text: '5001'),
                                Divider(),
                                ResultWidget(
                                  heading: 'Group ID',
                                  text: '5051',
                                ),
                                Divider(),
                                ResultWidget(
                                  heading: 'IC No',
                                  text: 'Afrger43',
                                ),
                                Divider(),
                                ResultWidget(
                                  heading: 'Age',
                                  text: '42',
                                ),
                                Divider(),
                                ResultWidget(
                                  heading: 'Department',
                                  text: 'Department',
                                ),
                                Divider(),
                                ResultWidget(
                                  heading: 'Phone No',
                                  text: '+65 0546 5785',
                                ),
                                Divider(),
                                ResultWidget(
                                  heading: 'Address Lane 1',
                                  text: 'Address 1 Malaysia',
                                ),
                                Divider(),
                                ResultWidget(
                                  heading: 'Address Lane 2',
                                  text: 'Address 2 Malaysia',
                                ),
                                Divider(),
                                ResultWidget(
                                  heading: 'State',
                                  text: 'Kualumpur Federal Teritory',
                                ),
                                Divider(),
                                ResultWidget(
                                  heading: 'Postal/Zip Code',
                                  text: '56758',
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
  const Profile_field(
      {Key? key,
      required this.textFieldName,
      required this.icon,
      required this.headingName})
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
            // controller: loginController.userIdController,
            maxLines: 1,
            style: TextStyle(fontSize: 17),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              filled: true,
              prefixIcon: icon,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
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
