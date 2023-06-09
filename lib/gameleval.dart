import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mathpuzzel/levellist.dart';
import 'package:mathpuzzel/main.dart';
import 'package:mathpuzzel/winpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class level extends StatefulWidget {
  int cur_lvl;

  level(this.cur_lvl);

  @override
  State<level> createState() => _levelState();
}

class _levelState extends State<level> {
  TextEditingController t1 = TextEditingController();
  String ans = "";
  int cur_lvl = 0;
  SharedPreferences? pref;

  Widget my_btn(int a) {
    return Expanded(
      child: InkWell(
        onTap: () {
          ans = ans + a.toString();
          setState(() {});
        },
        child: Container(
          margin: EdgeInsets.all(3),
          alignment: Alignment.center,
          height: 40,
          width: 30,
          child: Text(
            "$a",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (cur_lvl > data.level_que.length) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return winner(cur_lvl);
        },
      ));
    } else {
      pref?.clear();
    }
    cur_lvl=widget.cur_lvl;
    get_pref();
    DateTime t1 = DateTime.now();
    print(t1);
  }

  get_pref() async {
    pref = await SharedPreferences.getInstance();


    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
      child: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("image/gameplaybackground.jpg"),
                      fit: BoxFit.fill)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () async {
                          if (pref!.getInt("Time") == 1) {
                            int second;
                            DateTime t2 = DateTime.now();

                            Duration diff = t2.difference(
                                DateTime.parse(pref!.getString("Date") ?? ""));
                            second = 30 - diff.inSeconds;

                            showDialog(
                              context: context,
                              builder: (context) {
                                return (diff.inSeconds > 30)
                                    ? AlertDialog(
                                  title: Text(
                                    "Skip",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  buttonPadding: EdgeInsets.only(left: 30),
                                  content: Text(
                                      "Are you sure you want to skip this level ?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Cancel",
                                          style:
                                          TextStyle(color: Colors.pink),
                                        )),
                                    TextButton(
                                        onPressed: () async {
                                          SharedPreferences pref =
                                          await SharedPreferences
                                              .getInstance();

                                          DateTime t1 = DateTime.now();
                                          pref.setString(
                                              "Date", t1.toString());
                                          cur_lvl++;
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return level(cur_lvl);
                                                },
                                              ));
                                          setState(() {});
                                        },
                                        child: Text(
                                          "Ok",
                                          style:
                                          TextStyle(color: Colors.pink),
                                        )),
                                  ],
                                )
                                    : AlertDialog(
                                  title: Text("Wait"),
                                  content:
                                  Text("Wait For ${second} Second"),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Ok"))
                                  ],
                                );
                              },
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    "Skip",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  buttonPadding: EdgeInsets.only(left: 30),
                                  content: Text(
                                      "Are you sure you want to skip this level?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(color: Colors.pink),
                                        )),
                                    TextButton(
                                        onPressed: () async {
                                          DateTime t1 = DateTime.now();
                                          pref!.setString("Date", t1.toString());
                                          cur_lvl++;
                                          pref!.setInt("Time", 1);
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return level(cur_lvl);
                                                },
                                              ));
                                          setState(() {});
                                        },
                                        child: Text(
                                          "Ok",
                                          style: TextStyle(color: Colors.pink),
                                        )),
                                  ],
                                );
                              },
                            );
                          }
                        },

                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          height: 40,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("image/skip.png"))),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          "puzzel ${cur_lvl + 1}",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: ff,
                              fontWeight: FontWeight.bold),
                        ),
                        height: 40,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("image/level_board.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 40,
                        width: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("image/hint.png"))),
                      )
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 250,
                        width: 250,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("${data.level_que[cur_lvl]}"))),
                      )
                    ],
                  ),
                  Spacer(),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            color: Colors.black,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text("$ans",
                                          style: TextStyle(fontSize: 20)),
                                      height: 30,
                                      width: 200,
                                      margin: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (ans.length > 0) {
                                          ans =
                                              ans.substring(0, ans.length - 1);
                                          setState(() {});
                                        }
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "image/delete.png")),
                                            border: Border.all(
                                                color: Colors.white)),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (int.parse(ans) ==
                                            data.ans_list[cur_lvl]) {
                                          pref!.setString(
                                              "level${cur_lvl}", "win");
                                          if (cur_lvl <
                                              data.ans_list.length - 1) {
                                            cur_lvl++;
                                            int t =
                                                pref!.getInt("cur_lvl") ?? 0;
                                            print("T:$t");
                                            print("$cur_lvl");
                                            if (cur_lvl > t) {
                                              pref!.setInt("cur_lvl", cur_lvl);
                                            }
                                          }
                                          ans = "";
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return winner(cur_lvl);
                                            },
                                          ));
                                          setState(() {});
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "wrong ans",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        }
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 30,
                                        width: 100,
                                        child: Text(
                                          "SUBMIT",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white)),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    my_btn(1),
                                    my_btn(2),
                                    my_btn(3),
                                    my_btn(4),
                                    my_btn(5),
                                    my_btn(6),
                                    my_btn(7),
                                    my_btn(8),
                                    my_btn(9),
                                    my_btn(0)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ))),
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("are you sure you want to exit?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return app();
                        },
                      ));
                    },
                    child: Text("yes"))
              ],
            );
          },
        );
        return true;
      },
    ));
  }
}
