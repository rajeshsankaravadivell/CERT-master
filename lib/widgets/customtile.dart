import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pert/models/UserModel.dart';
// import 'package:pert/screens/quarantinedetails.dart';
class CustomTile extends StatelessWidget {
  const CustomTile({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: (){  Get.to(QuarantineDetails(
      //   user: user,
      // ));},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          elevation: 5,
          shadowColor: Colors.grey,
          // color: Color(0xFF373737),
          color: Colors.white,
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: Padding(
                  padding: EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      "https://cdn.pixabay"
                          ".com/photo/2013/07/13/10/07/man-156584_960_720.png",
                    ),
                  ),
                ),
                title:  Text(
                  'Rajesh',
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: Text(
                  'ds001',
                  style: TextStyle(color: Colors.black38),
                ),
              ),

              Padding(
                padding: EdgeInsetsDirectional.all(0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 100,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    // color: Color(0xFF616161),
                    // image: DecorationImage(
                    //   fit: BoxFit.cover,
                    //   image: Image.asset(
                    //     'assets/images/corona image.png',
                    //   ).image,
                    // ),
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('GROUPID   :  Grp001\t                        DEVICEID   :  '
                          'ds001}\nEMAIL        '
                          ' :  1234@gmail.com'
                          '\nPHONE NO :  1234567'

                        ,  style: TextStyle(color: Colors.black, height: 2.5),
                          textAlign: TextAlign.left),

                    ),
                  ),
                ),
              ),






              ButtonBar(
                alignment: MainAxisAlignment.end,
                children: [


                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green)
                      ),
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text('Negative'),
                    ),

                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}