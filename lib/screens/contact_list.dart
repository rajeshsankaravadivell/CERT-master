import 'package:flutter/material.dart';
import 'package:pert/constants/constants.dart';
import 'package:pert/models/userModel.dart';

class ContactHistoryDetails extends StatefulWidget {
  ContactHistoryDetails({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ContactHistoryDetailsState createState() => _ContactHistoryDetailsState();
}

class _ContactHistoryDetailsState extends State<ContactHistoryDetails> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Contact History'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: userController.user.contactHistory != null ? userController.user.contactHistory!.length : 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      color: const Color(0xFFAF2922),
                      // image: DecorationImage(
                      //   fit: BoxFit.cover,
                      //   image: Image.asset(
                      //     'assets/images/corona image.png',
                      //   ).image,
                      // ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 10, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextForDetails(
                              data: 'Contacted Person Name : ${userController.user.contactHistory![index].contact}',
                            ),
                            TextForDetails(
                              data: 'Group ID : ${userController.user.contactHistory![index].groupId}',
                            ),
                            TextForDetails(
                              data: 'Device ID : ${userController.user.contactHistory![index].deviceID}',
                            ),
                            TextForDetails(
                              data: 'Date & Time : ${DateTime.now()}',
                            ),
                            TextForDetails(data: 'Gateway: ${userController.user.contactHistory![index].gateWay}'),
                          ],
                        )),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TextForDetails extends StatelessWidget {
  const TextForDetails({
    Key? key,
    this.data,
  }) : super(key: key);
  final String? data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data!,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: Colors.white,
        fontSize: 15,
      ),
    );
  }
}