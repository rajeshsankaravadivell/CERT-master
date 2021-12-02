import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pert/models/usermodel.dart';
import 'package:pert/screens/profileupdate.dart';
// import 'package:pert/models/profile_model.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
// import 'package:fluttericon/entypo_icons.dart';
// import 'package:fluttericon/elusive_icons.dart';




class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String url = 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png';
  late UserModel userModel;

  @override
  void initState() {
    // TODO: implement initState
    userModel = widget.userModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _Size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(title: Text('Profile'),
      // centerTitle: true,),
        body: // Generated code for this Column Widget...
        StreamBuilder<Object>(
          stream: UserModel.getProfile(userModel.uid),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.connectionState == ConnectionState.active && snapshot.hasData) {
              if(snapshot.data.data()!=null) {
                var user = UserModel.fromJson(snapshot.data.data());
                userModel.bioData = user.bioData;
              }
            }
            return SingleChildScrollView(
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Material(
                        elevation: 10,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        child: Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * 0.40
                            ,
                            decoration: BoxDecoration(
                              // color: Color(0xFFED392D),
                              gradient: LinearGradient(
                                tileMode: TileMode.clamp,
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.white,
                                  Colors.red,
                                ],
                              ),
                              // image: DecorationImage(
                              //   fit: BoxFit.cover,
                              //   image: Image
                              //       .asset(
                              //     'assets/addcert/blurred-abstract-background.jpg',
                              //   )
                              //       .image,
                              // ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Material(
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.3,
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.3,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: userModel.bioData.imageUrl != null ? Image.network(userModel.bioData.imageUrl!, fit: BoxFit
                                          .fitHeight,) : Icon(
                                        Icons
                                            .person, color: Colors.black,size: 100,),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Text(userModel.bioData.name, style: TextStyle(

                                    // color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold

                                  ),textAlign: TextAlign.center,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                                  child: Text(userModel.bioData.id, style: TextStyle(
                                    color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold

                                  ),),
                                ),
                                Center(child: Text(userModel.bioData.department,style: TextStyle(color: Colors.white,shadows: [Shadow
                                  (blurRadius: 2)])
                                  ,)),

                              ],)
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: ListTile(


                        trailing: SizedBox(width: 150, height: 40,
                          child: ElevatedButton(onPressed: () {
                            Get.to(() => ProfileUpdate(profile: userModel.bioData, userModel: userModel));
                          }, child: Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: [Icon(Icons.edit), SizedBox(width: 5,), Text('Edit Profile')],
                          ),),
                        ),

                        dense: false,
                      ),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.person_outline_outlined ),
                      title: Text(
                        'Name',
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          userModel.bioData.name,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),


                      dense: true,
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(FontAwesome5.id_badge),
                      title: Text(
                        'ID',
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          userModel.bioData.id,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),


                      dense: true,
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(FontAwesome5.passport),
                      title: Text(
                        'Passport Number',
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          userModel.bioData.passportNumber,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),


                      dense: true,
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.supervised_user_circle_outlined),
                      title: Text(
                        'Department',
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          userModel.bioData.department,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),


                      dense: true,
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text(
                        'Phone Number',
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          userModel.bioData.phoneNumber!,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),


                      dense: true,
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.house),
                      title: Text(
                        'House Address',
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          userModel.bioData.houseAddress!,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),


                      dense: true,
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ListTile(
                        leading: Icon(Icons.location_city_outlined),
                        title: Text(
                          'Residence Address',
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            userModel.bioData.residenceAddress!,
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),


                        dense: true,
                      ),
                    ),

                  ],
                ),
              ),
            );
          }
        )
    );
  }
}
