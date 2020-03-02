import 'package:flutter/material.dart';

class CardPrestador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              ),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("https://i.ytimg.com/vi/nX2mWiJUW30/maxresdefault.jpg"),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Henrique",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  )
                ],
              ),
            );
  }
}