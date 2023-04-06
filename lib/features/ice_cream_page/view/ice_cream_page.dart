import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
//import '../ice_cream.dart';

class IceCreamPage extends StatefulWidget {
  const IceCreamPage({super.key});

  @override
  State<IceCreamPage> createState() => _IceCreamPageState();
}

class _IceCreamPageState extends State<IceCreamPage> {
  // final List<IceCream> iceCreams = [
  //   IceCream("Американец", Image.asset("assets/images/ice_cream_photo"), "85 руб."),
  //   IceCream("Американец", Image.asset("assets/images/ice_cream_photo"), "85 руб."),
  //   IceCream("Американец", Image.asset("assets/images/ice_cream_photo"), "85 руб."),
  //   IceCream("Американец", Image.asset("assets/images/ice_cream_photo"), "85 руб."),
  //   IceCream("Американец", Image.asset("assets/images/ice_cream_photo"), "85 руб."),
  //   IceCream("Американец", Image.asset("assets/images/ice_cream_photo"), "85 руб."),
  //   IceCream("Американец", Image.asset("assets/images/ice_cream_photo"), "85 руб."),
  //   IceCream("Американец", Image.asset("assets/images/ice_cream_photo"), "85 руб."),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(218, 230, 252, 1.0),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child:
          Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset("assets/images/decor.png",
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
                SvgPicture.asset("assets/images/item_vector.svg",
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(Icons.arrow_back_ios),
                            Text("Американец", style: TextStyle(fontSize: 20.0),),
                            Icon(Icons.favorite, color: Color.fromRGBO(108, 62, 126, 1.0),)
                          ]),
                      const SizedBox(height: 15.0,),
                      // Row(
                      //     children: [
                      //       DropdownButton<String>(
                      //         icon: const Icon(Icons.arrow_drop_down, color: Color.fromRGBO(59, 100, 228, 1.0),),
                      //         items: <String>['Славица', 'Инмарко', 'Мороженое', 'Ice Cream'].map((String value) {
                      //           return DropdownMenuItem<String>(
                      //             value: value,
                      //             child: Text(value),
                      //           );
                      //         }).toList(),
                      //         hint: const Text('Выбрать фирму', style: TextStyle(color: Color.fromRGBO(59, 100, 228, 1.0)),),
                      //         onChanged: (_) {},
                      //       )
                      //     ]),
                      // //const SizedBox(height: 15.0,),
                      // Container(
                      //   height: MediaQuery.of(context).size.height - 175,
                      //   width: MediaQuery.of(context).size.width,
                      //   child: GridView.count(
                      //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      //     crossAxisCount: 2,
                      //     childAspectRatio: 5/6,
                      //     shrinkWrap: true,
                      //     //physics: const NeverScrollableScrollPhysics(),
                      //     //direction: Axis.horizontal,
                      //     //spacing: 2,
                      //     //runSpacing: 25,
                      //     // alignment: WrapAlignment.spaceBetween,
                      //     // runAlignment: WrapAlignment.start,
                      //     children:
                      //     List.generate(iceCreams.length, (index) => Container(
                      //       decoration: const BoxDecoration(
                      //         color: Colors.white,
                      //         borderRadius: BorderRadius.all(Radius.circular(15)),
                      //       ),
                      //       //padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      //       margin: const EdgeInsets.all(5.0),
                      //       //width: 50,
                      //       height: 158,
                      //       //color: Colors.white,
                      //       child: Stack(
                      //         alignment: Alignment.center,
                      //         children: [
                      //           Image.asset("assets/images/ice_cream_photo.png",
                      //             alignment: Alignment.center,),
                      //           SvgPicture.asset("assets/images/iten_decor.svg",
                      //             alignment: Alignment.bottomCenter,
                      //             width: MediaQuery.of(context).size.width,
                      //             //height: MediaQuery.of(context).size.height,
                      //             //fit: BoxFit.cover,
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.all(16.0),
                      //             child: Column(
                      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 Row(
                      //                   mainAxisAlignment: MainAxisAlignment.start,
                      //                   children: [
                      //                     SvgPicture.asset("assets/images/availability_icon.svg",),
                      //                   ],
                      //                 ),
                      //                 Column(
                      //                   children: [
                      //                     Row(
                      //                       children: [
                      //                         Text(iceCreams[index].price,
                      //                           style: const TextStyle(fontSize: 20, color: Color.fromRGBO(108, 62, 126, 1.0)),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                     Row(
                      //                       children: [
                      //                         Text(iceCreams[index].name),
                      //                       ],
                      //                     ),
                      //                   ],
                      //                 ),
                      //
                      //
                      //               ],
                      //             ),
                      //
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //       // ListView.builder(
                      //       //     //scrollDirection: Axis.vertical,
                      //       //     shrinkWrap: true,
                      //       //     //padding: const EdgeInsets.all(10),
                      //       //     itemCount: iceCreams.length,
                      //       //     itemBuilder: (_, index) => Container(
                      //       //       margin: const EdgeInsets.all(5.0),
                      //       //       width: 50,
                      //       //       height: 158,
                      //       //       color: Colors.white,
                      //       //       // child: Stack(
                      //       //       //   children: [
                      //       //       //     SvgPicture.asset("assets/images/iten_decor.svg",
                      //       //       //       alignment: Alignment.topCenter,
                      //       //       //       width: MediaQuery.of(context).size.width,
                      //       //       //       height: MediaQuery.of(context).size.height,
                      //       //       //       fit: BoxFit.cover,
                      //       //       //     ),
                      //       //       //     SvgPicture.asset("assets/images/availability_icon.svg"),
                      //       //       //     Image.asset("assets/images/ice_cream_photo.png"),
                      //       //       //     Row(
                      //       //       //       mainAxisSize: MainAxisSize.max,
                      //       //       //       children: [
                      //       //       //         Text(iceCreams[index].price,
                      //       //       //           style: const TextStyle(fontSize: 20),),
                      //       //       //       ],
                      //       //       //     ),
                      //       //       //     Row(
                      //       //       //       children: [
                      //       //       //         Text(iceCreams[index].name),
                      //       //       //       ],
                      //       //       //     )
                      //       //       //   ],
                      //       //       // ),
                      //       //     )),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      boxShadow: [BoxShadow(
                        color: Colors.black26,
                        blurRadius: 20.0,
                        spreadRadius: 7.0,
                        offset: Offset(0, -5),
                      ),
                      ]),
                  child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SvgPicture.asset(
                          "assets/images/navbar_without_shadow.svg",
                          //color: Colors.cyan,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                          //height: MediaQuery.of(context).size.height,
                          //fit: BoxFit.fill,
                        ),
                        BottomNavigationBar(
                          elevation: 0,
                          backgroundColor: const Color.fromRGBO(255, 255, 255, 0.0),
                          items: [
                            BottomNavigationBarItem(
                              icon: IconButton(icon: SvgPicture.asset("assets/images/nav_menu.svg"), onPressed: (){
                                Navigator.of(context).pushNamed("/shop_page");
                              },),
                              label: '',
                            ),
                            BottomNavigationBarItem(
                              icon: IconButton(icon: SvgPicture.asset("assets/images/nav_map.svg"), onPressed: (){
                                Navigator.of(context).pushNamed("/map_page");
                              },),
                              label: '',
                            ),
                            BottomNavigationBarItem(
                              icon: IconButton(icon: SvgPicture.asset("assets/images/nav_ice_cream.svg"),
                                onPressed: (){
                                  Navigator.of(context).pushNamed("/ice_cream_list");
                                },),
                              label: '',
                            ),
                          ],
                        ),
                      ]),
                ),
              ]),
        ),
      ),
    );
  }
}