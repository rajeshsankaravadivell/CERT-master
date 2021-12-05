import 'package:flutter/material.dart';
import 'package:pert/models/usermodel.dart';

class ContactHistoryDetails extends StatefulWidget {
  const ContactHistoryDetails({Key? key, this.title, required this.contactHistory}) : super(key: key);
  final List<ContactHistory>? contactHistory;
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
          widget.contactHistory==null ? const Expanded(child: Center(child: Text("No Contact History Found"))) : Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: widget.contactHistory != null ? widget.contactHistory!.length : 0,
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
                              data: 'Contacted Person Name : ${widget.contactHistory![index].contact}',
                            ),
                            TextForDetails(
                              data: 'Group ID : ${widget.contactHistory![index].groupId}',
                            ),
                            TextForDetails(
                              data: 'Device ID : ${widget.contactHistory![index].deviceID}',
                            ),
                            TextForDetails(
                              data: 'Date & Time : ${DateTime.now()}',
                            ),
                            TextForDetails(data: 'Gateway: ${widget.contactHistory![index].gateWay}'),
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