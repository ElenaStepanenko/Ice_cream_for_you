import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color.fromRGBO(248, 230, 255, 1.0),
      width: double.infinity,
      height: double.infinity,
      child: Stack(children: [
        SvgPicture.asset(
          "assets/images/vec_fill.svg",
          alignment: Alignment.topCenter,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Column(
          children: [
            const SizedBox(
              height: 70.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Ice Cream",
                  style: TextStyle(
                      letterSpacing: 3.0,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w200,
                      color: Color.fromRGBO(22, 33, 61, 1.0),
                      fontFamily: "Notable"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "for you",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w200,
                      color: Color.fromRGBO(22, 33, 61, 1.0),
                      fontFamily: "Notable"),
                ),
              ],
            )
          ],
        ),
        // Container(
        //   alignment: Alignment.center,
        //   child: Image.asset("assets/images/fon.png"),
        // ),
        // Container(
        //   width: double.infinity,
        //   padding: const EdgeInsets.only(top: 635),
        //   //padding: EdgeInsets.symmetric(horizontal: -40),
        //   child: Image.asset("assets/images/")
        //
        //   ),
        Container(
          alignment: Alignment.bottomCenter,
          child: Image.asset("assets/images/rez_fill.png", scale: 0.85),
        ),
        SvgPicture.asset(
          "assets/images/vec_fill_down.svg",
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ]),
    ));
  }
}
