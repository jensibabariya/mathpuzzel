import 'package:flutter/material.dart';
import 'package:mathpuzzel/gameleval.dart';
import 'package:mathpuzzel/levellist.dart';
import 'package:mathpuzzel/nextpage.dart';

class third extends StatefulWidget {
  int cur_lvl;
  List list;

  third(this.cur_lvl, this.list);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  String ff = "f1";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/back.jpg"), fit: BoxFit.cover)),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Select Puzzle",
                    style: TextStyle(
                        fontFamily: ff,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                )
              ],
            ),

            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                child: GridView.builder(
                  itemCount: 20,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return InkWell(onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) {
                       return level(index);
                     },));
                    },
                      child: Container(
                        alignment: Alignment.center,
                        child: (widget.cur_lvl >=index)
                            ? Text(
                                "${index + 1}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 40,
                                    fontFamily: ff),
                              )
                            : null,
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          image: (widget.cur_lvl >= index)
                              ? (widget.list[index] == "win")
                                  ? DecorationImage(
                                      image: AssetImage("image/tick2.jpeg"))
                                  : null
                              : DecorationImage(
                                  image: AssetImage("image/lock.jpg.jpeg")),
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                          //  border: Border.all(color: Colors.black),
                          //  borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return next(widget.cur_lvl,widget.list);
                  },));
                },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 30,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("image/next.png"))),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    )));
  }
}
