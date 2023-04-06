// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import '../ice_cream.dart';
//
// class IceCreamsPage extends StatefulWidget {
//   const IceCreamsPage({super.key});
//
//   @override
//   State<IceCreamsPage> createState() => _IceCreamsPageState();
// }
//
// class _IceCreamsPageState extends State<IceCreamsPage> {
//   List<IceCream> iceCreams = [
//     IceCream("Американец", Image.asset("assets/images/ice_cream_photo.png"), "85 руб."),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(218, 230, 252, 1.0),
//       body: SafeArea(
//         child: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("assets/images/decor.png"),
//                 fit: BoxFit.fill,
//               )
//           ),
//           child:
//           Padding(
//             padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         padding:
//                         const EdgeInsets.symmetric(horizontal: 15.0),
//                         width: 270,
//                         //color: Colors.white,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(30.0),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.4),
//                               spreadRadius: 5,
//                               blurRadius: 30,
//                               offset: const Offset(
//                                   0, 10), // changes position of shadow
//                             ),
//                           ],
//                         ),
//
//                         child: const TextField(
//                           decoration: InputDecoration(
//                             icon: Icon(
//                               Icons.search_rounded,
//                               size: 30.0,
//                             ),
//                             hintText: "Поиск",
//                             //fillColor: Colors.white,
//                             //filled: true,
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30.0),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               spreadRadius: 5,
//                               blurRadius: 16,
//                               offset: const Offset(
//                                   0, 10), // changes position of shadow
//                             ),
//                           ],
//                         ),
//                         child: const CircleAvatar(
//                           radius: 30.0,
//                           backgroundColor:
//                           Color.fromRGBO(108, 62, 126, 1.0),
//                           child: IconButton(
//                             icon: Icon(
//                               Icons.favorite,
//                               size: 30.0,
//                               color: Color.fromRGBO(255, 255, 255, 1.0),
//                             ),
//                             onPressed: null,
//                           ),
//                         ),
//                       )
//                     ]),
//                 const SizedBox(height: 40.0,),
//                 Row(
//                     children: [
//                       DropdownButton<String>(
//                         items: <String>['Славица', 'Инмарко', 'Мороженое', 'Ice Cream'].map((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(value),
//                           );
//                         }).toList(),
//                         onChanged: (_) {},
//                       )
//                     ]),
//                 const SizedBox(height: 40.0,),
//                 ListView.builder(
//                     padding: const EdgeInsets.all(20),
//                     itemCount: shops.length,
//                     itemBuilder: (_, index) => Card(
//                       color: const Color.fromRGBO(255, 255, 255, 0.0),
//                       elevation: 0,
//                       margin: const EdgeInsets.only(top: 40),
//                       child: ListTile(
//                         title: Text(shops[index].name,
//                           style: const TextStyle(fontSize: 20),),
//                         subtitle: Text(shops[index].address),
//                         leading: IconButton(
//                           icon: SvgPicture.asset("assets/images/icon.svg", width: 50,),
//                           onPressed: null,
//                         ),
//                         onTap: () => print("${shops[index].name} - tap"),
//                       ),
//                     )),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar:
//       Container(
//         decoration: const BoxDecoration(
//             boxShadow: [BoxShadow(
//               color: Colors.black26,
//               blurRadius: 20.0,
//               spreadRadius: 7.0,
//               offset: Offset(0, -5),
//             ),
//             ]),
//         child: Stack(
//             alignment: Alignment.bottomCenter,
//             children: [
//               SvgPicture.asset(
//                 "assets/images/navbar_without_shadow.svg",
//                 //color: Colors.cyan,
//                 width: MediaQuery.of(context).size.width,
//                 fit: BoxFit.cover,
//                 //height: MediaQuery.of(context).size.height,
//                 //fit: BoxFit.fill,
//               ),
//               BottomNavigationBar(
//                 elevation: 0,
//                 backgroundColor: const Color.fromRGBO(255, 255, 255, 0.0),
//                 items: [
//                   BottomNavigationBarItem(
//                     icon: SvgPicture.asset("assets/images/nav_menu.svg"),
//                     label: '',
//                   ),
//                   BottomNavigationBarItem(
//                     icon: SvgPicture.asset("assets/images/nav_ice_cream.svg"),
//                     label: '',
//                   ),
//                   BottomNavigationBarItem(
//                     icon: SvgPicture.asset("assets/images/nav_menu.svg"),
//                     label: '',
//                   ),
//                 ],
//               ),
//             ]),
//       ),
//     );
//   }
// }