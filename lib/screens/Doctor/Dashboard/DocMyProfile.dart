import 'package:flutter/material.dart';
import 'package:user/localization/localizations.dart';
import 'package:user/providers/app_data.dart';

import 'package:user/scoped-models/MainModel.dart';
import 'package:user/models/PatientListModel.dart';

class DocMyProfile extends StatefulWidget {
  MainModel model;

  DocMyProfile({Key key, this.model}) : super(key: key);

  @override
  _DocMyProfileState createState() => _DocMyProfileState();
}

class _DocMyProfileState extends State<DocMyProfile> {
  String loAd = "Loading..";
  //Body model;

  @override
  void initState() {
    super.initState();
    //model = widget.model.model;
  }

  getGender(String gender) {
    switch (gender) {
      case "0":
        return "Male";
        break;
      case "1":
        return "Female";
        break;
      case "3":
        return "Transgender";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: Text("User Profile"),
          titleSpacing: 2,
          elevation: 0,
          leading: InkWell(
            child: Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body:
        // (model != null)
        //     ?
        Container(
          height: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 120.0,
                      decoration: BoxDecoration(
                        color: AppData.matruColor.withOpacity(0.7),
                      ),
                    ),
                    _buildHeader(context)
                  ],
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    MyLocalizations.of(context).text("USER_INFORMATION"),
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Card(
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            ...ListTile.divideTiles(
                              color: Colors.grey,
                              tiles: [
                                ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  leading: Icon(Icons.calendar_today),
                                  title: Text("BIRTH DATE"),
                                  subtitle: Text("01/06/1997"),
                                ), ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  leading: Icon(Icons.person),
                                  title: Text("GENDER"),
                                  subtitle: Text("Female "),
                                ),
                                ListTile(
                                  leading: Icon(Icons.book),
                                  title: Text(
                                    "EDUCATION",
                                  ),
                                  subtitle: Text("Mca"),
                                ),
                                ListTile(
                                  leading: Icon(Icons.face),
                                  title: Text(
                                    "SPECIALITY",
                                  ),
                                  subtitle: Text("Software"),
                                ),

                                ListTile(
                                  leading: Icon(Icons.email),
                                  title: Text("ORGANIZATION"),
                                  subtitle: Text("NIRMALYA"),
                                ),
                                ListTile(
                                  leading: Icon(Icons.contact_phone),
                                  title: Text("IMA NO"),
                                  subtitle: Text("12345652 "),
                                ),
                                ListTile(
                                  leading: Icon(Icons.info_outline),
                                  title: Text(
                                    "PAN CARD NO",
                                  ),
                                  subtitle: Text("123655FCV5"),
                                ),
                                ListTile(
                                  leading: Icon(Icons.info_outline),
                                  title: Text(
                                    "PASSPORT NO",
                                  ),
                                  subtitle: Text("12365422257425"),
                                ),
                                ListTile(
                                  leading: Icon(Icons.info_outline),
                                  title: Text(
                                    "VOTER CARD NO",
                                  ),
                                  subtitle: Text("12365422257425"),
                                ), ListTile(
                                  leading: Icon(Icons.filter),
                                  title: Text(
                                    "LICENCE NO",
                                  ),
                                  subtitle: Text("12365422257425"),
                                ),

                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                SizedBox(
                  height: 13,
                )
              ],
            ),
          ),
        )

        //     : Center(
        //   child: Text(
        //     loAd,
        //     style: TextStyle(color: Colors.black, fontSize: 23),
        //   ),
        // )
    );
  }


  Container _buildHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 200.0,
      child: Stack(
        children: <Widget>[
          Container(
            margin:
            EdgeInsets.only(top: 40.0, left: 40.0, right: 40.0, bottom: .0),
            width: double.maxFinite,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(15.0),
                topRight: const Radius.circular(15.0),
                bottomLeft: const Radius.circular(15.0),
                bottomRight: const Radius.circular(15.0),
              ),
              /*image: DecorationImage(
                  image: AssetImage(
                    "assets/card.png",
                  ),
                  fit: BoxFit.fitWidth,
                ),*/
              /*gradient: LinearGradient(
                  colors: [AppData.matruColor, Colors.black54],
                ),*/
              color: AppData.matruColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                /*SizedBox(
                  height: 45.0,
                ),*/
                Text(
                  "Ipsita Sahoo",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(color: Colors.white, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 6.0,
                ),
                Text(
                  "AADHAAR NO" +
                      ": " +
                      "123456789012",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                ),

              ],
            ),
            // ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                elevation: 5.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage(AppData.defaultImgUrl),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
