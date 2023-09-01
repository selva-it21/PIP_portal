
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schools_management/animation/FadeAnimation.dart';
import 'package:schools_management/helper/get_helper.dart';


class TaskPage extends StatefulWidget {
  final String schoolId;
  final String groupId;

  TaskPage({this.schoolId, this.groupId});

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // key for form

  TextEditingController subjectControl = new TextEditingController(); // input controller from users
  TextEditingController taskControl = new TextEditingController(); // input controller from users

  @override
  void initState() {
    super.initState();
    print(widget.schoolId);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
Color.fromRGBO(17, 171, 28, 1),
          Color.fromRGBO(169, 230, 157, 1),
            ])),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: FadeAnimation(
                            1.3,
                            Text(
                              "Insert Task",
                              style: GoogleFonts.asar(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                fontSize: 30,
                              ),
                            ))),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60))),
                      child: Padding(
                          padding: EdgeInsets.all(30),
                          child: SingleChildScrollView(
                              child: Column(children: <Widget>[
                            SizedBox(
                              height: 60,
                            ),
                            FadeAnimation(
                              1.4,
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromRGBO(27, 225, 30, 0.762),
                                          blurRadius: 20,
                                          offset: Offset(0, 10))
                                    ]),
                                child: Form(
                                  key: _formKey,
                                  child: Column(children: <Widget>[
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextFormField(
                                        controller: subjectControl,
                                        decoration: InputDecoration(
                                            hintText: "Write Title Of Task",
                                                    hintStyle: GoogleFonts.asar(
                              textStyle: TextStyle(
                                  color: Color.fromARGB(255, 187, 183, 183),
                                  fontWeight: FontWeight.bold),
                              fontSize: 15,
                            ),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 100,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[200]))),
                                      child: TextFormField(
                                        controller: taskControl,
                                        decoration: InputDecoration(
                                            hintText: "Write Task Here Please",
                                                 hintStyle: GoogleFonts.asar(
                              textStyle: TextStyle(
                                  color: Color.fromARGB(255, 187, 183, 183),
                                  fontWeight: FontWeight.bold),
                              fontSize: 15,
                            ),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value.length < 20) {
                                            return '$value length not long enough';
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    FadeAnimation(
                                        1.6,
                                        Container(
                                          height: 50,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 60),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Color.fromRGBO(32, 239, 94, 1)),
                                          child: Center(
                                            child: TextButton(
                                                child: Text(
                                                  "Send Task",
                                          style: GoogleFonts.asar(
                              textStyle: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold),
                              fontSize: 20,
                            ),
                                                ),
                                                onPressed: () {
                                                // when user press this button send task using GetHelper
                                                // if you do not understant go to GetHelper
                                                  GetHelper.sendTask(
                                                      _formKey,
                                                      context,
                                                      widget.schoolId,
                                                      widget.groupId,
                                                      subjectControl.text,
                                                      taskControl.text);
                                                }),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 50,
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                          ])))))
            ])));
  }
}
