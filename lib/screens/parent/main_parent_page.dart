import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:schools_management/animation/FadeAnimation.dart';
import 'package:schools_management/provider/parent.dart';
import 'package:schools_management/provider/student.dart';
import 'package:schools_management/screens/parent/activities_page.dart';
import 'package:schools_management/screens/parent/attendance.dart';
import 'package:schools_management/screens/parent/classes_page.dart';
import 'package:schools_management/screens/parent/complant_page.dart';
import 'package:schools_management/screens/parent/discipline.dart';
import 'package:schools_management/screens/parent/emergency_page.dart';
import 'package:schools_management/screens/parent/fees_page.dart';
import 'package:schools_management/screens/login_page.dart';
import 'package:schools_management/screens/parent/medication_page.dart';
import 'package:schools_management/screens/parent/student_feedback_page.dart';
import 'package:schools_management/screens/parent/table_page.dart';
import 'package:schools_management/widgets/card_item.dart';

class MainParentPage extends StatefulWidget {
  static const routeName = '/main-parent-page';

  @override
  _MainParentPageState createState() => _MainParentPageState();
}

class _MainParentPageState extends State<MainParentPage> {
  ParentInf getParentInfo;
  StudentInf getStudentInfo;
  String parentName;
  String parentAddress;
  String parentNumber;
  String studentId;
  String schoolId;

  showStudentInfDialog(
      String name, String grade, String address, String dateOfBirth) {
    showDialog(
        context: context,
        builder: (_) => FadeAnimation(
              0.5,
              AlertDialog(
                backgroundColor: Color.fromARGB(255, 215, 243, 210),
                title: Center(
                    child: Text(
                  "Student's Information",
                  style: GoogleFonts.asar(
                    textStyle: TextStyle(
                        color: Color.fromARGB(255, 15, 225, 53),
                        fontWeight: FontWeight.bold),
                    fontSize: 20,
                  ),
                )),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        'Name : $name',
                        style: GoogleFonts.antic(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        'Department : $grade',
                        style: GoogleFonts.antic(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        'Mentor name : $dateOfBirth',
                        style: GoogleFonts.antic(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        'Mentor phone : $address',
                        style: GoogleFonts.antic(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1.5,
                  ),
                ],
              ),
            ));
  }

  @override
  void initState() {
    super.initState();

    // we use this method to avoid crashing
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Student>(context,listen: false).getInfWithID(studentId).then((state) {
        // if we get the data properly
        if (state) {
          // if true get the student data
          getStudentInfo = Provider.of<Student>(context,listen: false).getStudentInf();
        } else {
          print('Something wrong just happened');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // get parent data
    getParentInfo = Provider.of<Parent>(context,listen: false).getParentInf();
    parentName = getParentInfo.name;
    parentAddress = getParentInfo.address;
    parentNumber = getParentInfo.number;
    studentId = getParentInfo.studentID;
    schoolId = getParentInfo.schoolID;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Color.fromRGBO(17, 171, 28, 1),
            Color.fromRGBO(169, 230, 157, 1),
          ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 35,
                    ),
                    Center(
                        child: FadeAnimation(
                            1.3,
                            Text(
                              "Parent Name : $parentName",
                              style: GoogleFonts.asar(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                fontSize: 21,
                              ),
                            ))),
                    Center(
                        child: FadeAnimation(
                            1.3,
                            Text(
                              "Phone Number : $parentNumber",
                              style: GoogleFonts.asar(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                fontSize: 20,
                              ),
                            ))),
                    Center(
                        child: FadeAnimation(
                            1.3,
                            Text(
                              "Address : $parentAddress",
                              style: GoogleFonts.asar(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                fontSize: 20,
                              ),
                            ))),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  padding: EdgeInsets.all(5),
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(12.0),
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      CardItem(
                          desc: 'Student Info',
                          img: 'assets/images/student-icon.png',
                          color: Color.fromRGBO(51, 180, 60, 1),
                          function: () => showStudentInfDialog(
                              getStudentInfo.name,
                              getStudentInfo.grade,
                              getStudentInfo.address,
                              getStudentInfo.dateOfBirth)),
                      CardItem(
                        desc: 'Feedback',
                        img: 'assets/images/child-feedback-icon.png',
                        color: Color.fromRGBO(51, 180, 60, 1),
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentFeedback(
                                      studentId: studentId,
                                    )),
                          );
                        },
                      ),
                      CardItem(
                          desc: 'Classes',
                          img: 'assets/images/class-icon.png',
                          color: Color.fromRGBO(51, 180, 60, 1),
                          function: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Classes(
                                        studentId: studentId,
                                      )),
                            );
                          }),
                      CardItem(
                        desc: 'Time Table',
                        img: 'assets/images/time-table-icon.png',
                        color: Color.fromRGBO(51, 180, 60, 1),
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TablePage(
                                      studentGrade: getStudentInfo.grade,
                                    )),
                          );
                        },
                      ),
                      CardItem(
                        desc: 'Achievements',
                        img: 'assets/images/activites-icon.png',
                        color: Color.fromRGBO(51, 180, 60, 1),
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Activities(
                                      studentId: studentId,
                                    )),
                          );
                        },
                      ),
                      CardItem(
                        desc: 'Indisciplinary',
                        img: 'assets/images/discipline_image.png',
                        color: Color.fromRGBO(51, 180, 60, 1),
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => displine(
                                      studentId: studentId,
                                    )),
                          );
                        },
                      ),
                      CardItem(
                        desc: 'Attendance',
                        img: 'assets/images/attendance.png',
                        color: Color.fromRGBO(51, 180, 60, 1),
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Attendance(
                                      studentId: studentId,
                                    )),
                          );
                        },
                      ),
                      CardItem(
                        desc: 'Medication',
                        img: 'assets/images/medication-icon.png',
                        color: Color.fromRGBO(51, 180, 60, 1),
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Medication(
                                      studentId: studentId,
                                    )),
                          );
                        },
                      ),
                      CardItem(
                        desc: 'Emergency',
                        img: 'assets/images/emergency-people-icon.png',
                        color: Color.fromRGBO(51, 180, 60, 1),
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Emergency(
                                      studentId: studentId,
                                    )),
                          );
                        },
                      ),
                      CardItem(
                          desc: 'Fees',
                          img: 'assets/images/fees-icon.png',
                          color: Color.fromRGBO(51, 180, 60, 1),
                          function: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Fees(
                                        studentId: studentId,
                                      )),
                            );
                          }),
                      CardItem(
                        desc: 'Grievences',
                        img: 'assets/images/complaint-icon.png',
                        color: Color.fromRGBO(51, 180, 60, 1),
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComplantPage(
                                      schoolId: schoolId,
                                    )),
                          );
                        },
                      ),
                      CardItem(
                          desc: 'log Out',
                          img: 'assets/images/logout-icon.png',
                          color: Color.fromRGBO(51, 180, 60, 1),
                          function: () {
                            Provider.of<Parent>(context,listen: false).logOut();
                            Provider.of<Student>(context,listen: false).logOut();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
