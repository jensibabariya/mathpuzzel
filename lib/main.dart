import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathpuzzel/levellist.dart';

import 'package:mathpuzzel/gameleval.dart';
import 'package:mathpuzzel/puzzelthird.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: app(),
  ));
}

class app extends StatefulWidget {
  const app({Key? key}) : super(key: key);

  @override
  State<app> createState() => _appState();
}

String ff = "f1";
bool temp1 = false;
bool temp2 = false;
bool temp3 = false;
SharedPreferences? pref;
int cur_lvl = 0;
List list=[];

get_pref()
async {
  pref = await SharedPreferences.getInstance();
  cur_lvl=pref!.getInt("cur_lvl")??0;
  for(int i=0;i<cur_lvl;i++)
    {
      list[i]=pref!.getString("level$i");
    }
  print(list);
}

class _appState extends State<app> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_pref();
    list=List.filled(data.ans_list.length, "no");


    if(cur_lvl>data.level_que.length)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return app();
        },));
      }
  }
  Widget build(BuildContext context) {
    return SafeArea(child:  Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("image/back.jpg"), fit: BoxFit.fill)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            child: Text(
                              "math puzzels",
                              style: TextStyle(
                                  fontFamily: ff,
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("image/background.png"))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTapUp: (details) {
                              temp1 = false;
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return level(cur_lvl);
                                },
                              ));
                              setState(() {});
                            },
                            onTapDown: (details) {
                              temp1 = true;
                              setState(() {});
                            },
                            onTapCancel: () {
                              temp1=false;
                              setState(() {

                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              child: Text(
                                "CONTINUE",
                                style: TextStyle(
                                    fontFamily: ff,
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),

                              ),
                              decoration: BoxDecoration(border: (temp1)?Border.all(color: Colors.white):null),
                            ),
                          ),
                          GestureDetector(
                            onTapUp: (details) {
                              temp2 = false;
                              setState(() {});
                            },
                            onTapDown: (details) {
                              temp2 = true;
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return third(cur_lvl,list);
                                },
                              ));
                              setState(() {});
                            },
                            onTapCancel: () {
                              temp2 = false;
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: (temp2
                                      ? Border.all(color: Colors.white)
                                      : null)),
                              alignment: Alignment.center,
                              height: 50,
                              child: Text(
                                "PUZZELS",
                                style: TextStyle(
                                    fontFamily: ff,
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTapUp: (details) {
                              temp3= false;
                              setState(() {});
                            },
                            onTapDown: (details) {
                              temp3 = true;
                              setState(() {});
                            },
                            onTapCancel: () {
                              temp3 = false;
                              setState(() {});
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              child: Text(
                                "BUY PRO",
                                style: TextStyle(
                                    fontFamily: ff,
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),

                              ),
                              decoration: BoxDecoration(border: (temp3)?Border.all(color: Colors.white):null),
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(20),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("image/shareus.png")),
                              color: Colors.grey,
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(20),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("image/emailus.png")),
                              color: Colors.grey,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(8)),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          height: 30,
                          child: Text(
                            "privacy policy",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )));
  }
}
