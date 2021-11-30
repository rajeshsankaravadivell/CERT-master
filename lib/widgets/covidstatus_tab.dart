import 'package:flutter/material.dart';
import 'package:pert/constants/colors.dart';
import 'package:pert/constants/constants.dart';
import 'package:pert/models/usermodel.dart';

class CovidStatusTab extends StatefulWidget {
  const CovidStatusTab({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  _CovidStatusTabState createState() => _CovidStatusTabState();
}

class _CovidStatusTabState extends State<CovidStatusTab> {

  @override
  void initState(){
    super.initState();
    if(widget.user.covidHistory == null) widget.user.covidHistory = [];
  }

  late List<CovidInfo>? items;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: widget.user.covidHistory!.length!=null?widget.user.covidHistory!.length: 0,
      itemBuilder: (context, index) {
        CovidInfo covidInfo = widget.user.covidHistory!.elementAt(index);
        return CovidTileHistory(covidInfo : covidInfo);
      },
    );
  }
}

class CovidTileHistory extends StatelessWidget {

  const CovidTileHistory({
    Key? key,
    required this.covidInfo,
  }) : super(key: key);

  final CovidInfo covidInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: 100,
        child: Stack(
          children: [
            Image.asset(
              'assets/studenthomepage/MaskGroup1.png',
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: covidInfo.type.toString(),
                              style: TextStyle(fontWeight: FontWeight.normal, color: cardcolor, fontSize: 15.0),
                            ),
                          ],
                          text: 'Test Type                 : ',
                          style: TextStyle(fontWeight: FontWeight.bold, color: cardcolor, fontSize: 15.0),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 30,
                        width: 100,
                        child: Center(
                          child: Text(
                            covidInfo.result == false ? 'Negative' : 'Positive',
                            style: TextStyle(fontWeight: FontWeight.bold, color: cardcolor),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: covidInfo.result == false ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(14),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: covidInfo.method.toString(),
                            style: TextStyle(fontWeight: FontWeight.normal, color: cardcolor, fontSize: 15.0),
                          ),
                        ],
                        text: 'Test Method            : ',
                        style: TextStyle(fontWeight: FontWeight.bold, color: cardcolor, fontSize: 15.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: covidInfo.vaccinated ? "Vaccinated" : "Not Vaccinated",
                            style: TextStyle(fontWeight: FontWeight.normal, color: cardcolor, fontSize: 15.0),
                          ),
                        ],
                        text: 'Vaccination Status : ',
                        style: TextStyle(fontWeight: FontWeight.bold, color: cardcolor, fontSize: 15.0),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
