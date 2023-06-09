import 'package:flutter/material.dart';
import 'package:mathpuzzel/gameleval.dart';
import 'package:mathpuzzel/levellist.dart';
import 'package:mathpuzzel/main.dart';


class winner extends StatefulWidget {
  int cur_lvl;
  winner(this.cur_lvl);

  @override
  State<winner> createState() => _winnerState();
}

class _winnerState extends State<winner> {
  String ff = "f1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/back.jpg"), fit: BoxFit.cover)),
        alignment: Alignment.topCenter,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "PUZZLE ${widget.cur_lvl} COMPLITIED",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                )
              ],
            ),
            SizedBox(height: 50,),
            Container(
              height: 200,
              width: 200,
              margin: EdgeInsets.all(10),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  image:
                  DecorationImage(image: AssetImage("image/trophy.jpeg"))),
            ),
            InkWell(onTap: () {
              if(widget.cur_lvl<data.level_que.length-1)
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return level(widget.cur_lvl);
                  },));
                }
              else
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return level(widget.cur_lvl);
                  },));
                }

            },
              child: Container(
                height: 40,
                width: 200,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "CONTINUE",
                  style: TextStyle(
                    fontSize: 20,  fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,),
                ),
              ),
            ),
            InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return app();
              },));
            },
              child: Container(
                height: 40,
                width: 200,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "MAIN MANU",
                  style: TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,),
                ),
              ),
            ),
            Container(
              height: 40,
              width: 200,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                "BUY PRO",
                style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,),
              ),
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: Text(
                "SHARE THIS PUZZLE",
                style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("image/shareus.png"),
                ),
                color: Colors.grey,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}