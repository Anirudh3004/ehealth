import 'package:user/models/AppointmentlistModel.dart';
import 'package:user/providers/Const.dart';
import 'package:user/providers/api_factory.dart';
import 'package:user/providers/app_data.dart';
import 'package:user/scoped-models/MainModel.dart';
import 'package:user/widgets/MyWidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class MyAppointmentCancle extends StatefulWidget {
   MainModel model;
  MyAppointmentCancle({Key key, this.model}) : super(key: key);
  @override
  _MyAppointmentCancleState createState() => _MyAppointmentCancleState();
}

class _MyAppointmentCancleState extends State<MyAppointmentCancle> {
  DateTime selectedDate = DateTime.now();
  AppointmentlistModel appointmentlistModel;
  TextEditingController fromThis_ = TextEditingController();
  TextEditingController toThis_ = TextEditingController();
  String selectedDatestr;
  final df = new DateFormat('dd/MM/yyyy');
  var selectedMinValue;
  DateTime date = DateTime.now();
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      var df = DateFormat("dd/MM/yyyy");
      fromThis_.text = df.format(date);
      selectedDatestr =  df.format(date).toString();
      //toThis_.text = df.format(date);
      callAPI("");
    });
  }
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        locale: Locale("en"),
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 100)),
        lastDate: DateTime.now()
      /*.add(Duration(days: 60))*/); //18 years is 6570 days
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        fromThis_.value = TextEditingValue(text: df.format(selectedDate));
        selectedDatestr =  df.format(selectedDate).toString();
        callAPI(selectedDatestr);

      });
  }
  callAPI(String today) {
    /*if (comeFrom == Const.HEALTH_SCREENING_APNT) {*/
    widget.model.GETMETHODCALL_TOKEN(
        api: ApiFactory.USER_APPOINTMENT_LIST +widget.model.user+"&date="+today+"&status="+"4",
        token: widget.model.token,
        fun: (Map<String, dynamic> map) {
          setState(() {
            String msg = map[Const.MESSAGE];
            if (map[Const.CODE] == Const.SUCCESS) {
              appointmentlistModel=AppointmentlistModel.fromJson(map);
              // appointModel = lab.LabBookModel.fromJson(map);
            } else {
              // isDataNotAvail = true;
            //  AppData.showInSnackBar(context, msg);
            }
          });
        });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  appointdate(),

                  (appointmentlistModel != null)
                      ? ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        Body appointmentlist = appointmentlistModel.body[i];
                        /* itemCount: lists.length,
                  itemBuilder: (context, index) {*/
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0, right: 5.0,),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 10,),
                                  Card(
                                    elevation: 5,
                                    child: Container(
                                        //height: 120,
                                        //width: double.maxFinite,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.grey[300],
                                            ),
                                            borderRadius: BorderRadius.circular(8)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(appointmentlist.doctorName??"N/A",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 18),),
                                                    SizedBox(height: 5,),
                                                    Text(appointmentlist.speciality??"N/A",
                                                      overflow: TextOverflow.clip,
                                                      style: TextStyle(),),
                                                    SizedBox(height: 5,),
                                                    Text(
                                                      "Patient Notes:"+appointmentlist.notes??"N/A",
                                                      overflow: TextOverflow.clip,
                                                      style: TextStyle(),),
                                                    Text(
                                                      appointmentlist.patname??"N/A",
                                                      overflow:
                                                      TextOverflow.clip,
                                                      style: TextStyle(color: Colors.blue),
                                                    ),
                                                  ],
                                                ),),
                                              /*new Spacer(),*/
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 15.0,),
                                                child: Column(
                                                  // mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .end,
                                                  children: [
                                                    Text(/*'Confirmed'*/appointmentlist.status??"N/A",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 15,
                                                          color: Colors.green),),
                                                    SizedBox(height: 3,),
                                                    Text(/*'23-Nov-2020-11:30AM'*/appointmentlist.appdate??"N/A"+appointmentlist.apptime??"N/A",
                                                      overflow: TextOverflow.clip,
                                                      style: TextStyle(),),

                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),

                                ],
                              ),

                            ),
                          ],
                        );
                      },itemCount: appointmentlistModel.body.length,

                  ): Container(),
                ],
              ),
            ),
          ),


        )
    );
  }
  Widget appointdate() {
    return Container(
      height: 40,
      width: 190,
      margin: EdgeInsets.only(top: 20, bottom: 10),
      child: Expanded(
        child: InkWell(
          onTap: () {
            print("Click done");
            _selectDate(context);
          },
          child: AbsorbPointer(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextFormField(
                autofocus: false,
                controller: fromThis_,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today),
                  floatingLabelBehavior:
                  FloatingLabelBehavior.always,
                  hintText: 'From this',
                  //labelText: 'Booking Date',
                  alignLabelWithHint: false,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  contentPadding:
                  EdgeInsets.only(left: 10, top: 4, right: 4),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),);
  }
  Widget _submitButton() {
    return MyWidgets.nextButton(
      text: "search".toUpperCase(),
      context: context,
      fun: () {
        //Navigator.pushNamed(context, "/navigation");
        /*if (_loginId.text == "" || _loginId.text == null) {
          AppData.showInSnackBar(context, "Please enter mobile no");
        } else if (_loginId.text.length != 10) {
          AppData.showInSnackBar(context, "Please enter 10 digit mobile no");
        } else {*/
      
        // Navigator.pushNamed(context, "/otpView");
        //}
      },
    );
  }
 // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.red),),


}