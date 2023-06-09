import 'package:flutter/material.dart';
import 'package:mathpuzzel/levellist.dart';

class next extends StatefulWidget {
  int cur_lvl;
  List list;


  next(this.cur_lvl, this.list);


  @override
  State<next> createState() => _nextState();
}

String ff = "f1";



class _nextState extends State<next> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/back.jpg"), fit: BoxFit.cover)),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,
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
                  itemCount: data.ans_list.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      child: (widget.cur_lvl >index)
                          ? Text(
                        "${index+1}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontFamily: ff),
                      )
                          : null,
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        image: (widget.cur_lvl > index)
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
                    );
                  },
                ),
              ),
            ),


          ],
        ),
      ),
    ));
  }
}
