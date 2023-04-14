import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../repositories/ice_cream/models/ice_cream_repository.dart';

class IceCreamsPage extends StatefulWidget {
  const IceCreamsPage({super.key});

  @override
  State<IceCreamsPage> createState() => _IceCreamsPageState();
}

class _IceCreamsPageState extends State<IceCreamsPage> {
  final List<String> filter = ['', 'Славица', 'Инмарко', 'Мороженое', 'Сладко'];
  List<IceCream> filtredIceCream = iceCreams;
  String filterText = 'Выбрать фирму';

  void onFilterChange(String value) {
    setState(() {
      if (value == '') {
        filtredIceCream = iceCreams;
        filterText = 'Выбрать фирму';
      } else {
        filtredIceCream =
            iceCreams.where((iceCream) => iceCream.shop == value).toList();
        filterText = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(218, 230, 252, 1.0),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(alignment: Alignment.bottomCenter, children: [
            Image.asset(
              "assets/images/decor.png",
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          width: 270,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 5,
                                blurRadius: 30,
                                offset: const Offset(
                                    0, 10), // changes position of shadow
                              ),
                            ],
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.search_rounded,
                                size: 30.0,
                              ),
                              hintText: "Поиск",
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 16,
                                offset: const Offset(
                                    0, 10), // changes position of shadow
                              ),
                            ],
                          ),
                          child: const CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Color.fromRGBO(108, 62, 126, 1.0),
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite,
                                size: 30.0,
                                color: Color.fromRGBO(255, 255, 255, 1.0),
                              ),
                              onPressed: null,
                            ),
                          ),
                        )
                      ]),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(children: [
                    DropdownButton<String>(
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Color.fromRGBO(59, 100, 228, 1.0),
                      ),
                      items: filter.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text(
                        filterText,
                        style: const TextStyle(
                            color: Color.fromRGBO(59, 100, 228, 1.0)),
                      ),
                      onChanged: (String? selectedValue) {
                        if (selectedValue != null) {
                          onFilterChange(selectedValue);
                        }
                      },
                    )
                  ]),
                  //const SizedBox(height: 15.0,),
                  // ignore: sized_box_for_whitespace
                  Container(
                    height: MediaQuery.of(context).size.height - 175,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.count(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      crossAxisCount: 2,
                      childAspectRatio: 4 / 5,
                      shrinkWrap: true,
                      children: List.generate(
                        filtredIceCream.length,
                        (index) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              "/ice_cream_page",
                              arguments: filtredIceCream[index],
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.zero,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            //padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            margin: const EdgeInsets.all(5.0),
                            //width: 50,
                            height: 158,
                            //color: Colors.white,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(20.0),
                                  child: filtredIceCream[index].photo,
                                ),
                                SvgPicture.asset(
                                  "assets/images/iten_decor.svg",
                                  alignment: Alignment.bottomCenter,
                                  width: MediaQuery.of(context).size.width,
                                  //height: MediaQuery.of(context).size.height,
                                  //fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/images/availability_icon.svg",
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                filtredIceCream[index].price,
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Color.fromRGBO(
                                                        108, 62, 126, 1.0)),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(filtredIceCream[index].name),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // ListView.builder(
                        //     //scrollDirection: Axis.vertical,
                        //     shrinkWrap: true,
                        //     //padding: const EdgeInsets.all(10),
                        //     itemCount: iceCreams.length,
                        //     itemBuilder: (_, index) => Container(
                        //       margin: const EdgeInsets.all(5.0),
                        //       width: 50,
                        //       height: 158,
                        //       color: Colors.white,
                        //       // child: Stack(
                        //       //   children: [
                        //       //     SvgPicture.asset("assets/images/iten_decor.svg",
                        //       //       alignment: Alignment.topCenter,
                        //       //       width: MediaQuery.of(context).size.width,
                        //       //       height: MediaQuery.of(context).size.height,
                        //       //       fit: BoxFit.cover,
                        //       //     ),
                        //       //     SvgPicture.asset("assets/images/availability_icon.svg"),
                        //       //     Image.asset("assets/images/ice_cream_photo.png"),
                        //       //     Row(
                        //       //       mainAxisSize: MainAxisSize.max,
                        //       //       children: [
                        //       //         Text(iceCreams[index].price,
                        //       //           style: const TextStyle(fontSize: 20),),
                        //       //       ],
                        //       //     ),
                        //       //     Row(
                        //       //       children: [
                        //       //         Text(iceCreams[index].name),
                        //       //       ],
                        //       //     )
                        //       //   ],
                        //       // ),
                        //     )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 20.0,
                  spreadRadius: 7.0,
                  offset: Offset(0, -5),
                ),
              ]),
              child: Stack(alignment: Alignment.bottomCenter, children: [
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
                      icon: IconButton(
                        icon: SvgPicture.asset("assets/images/nav_menu.svg"),
                        onPressed: () {
                          Navigator.of(context).pushNamed("/shop_page");
                        },
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: IconButton(
                        icon: SvgPicture.asset("assets/images/nav_map.svg"),
                        onPressed: () {
                          Navigator.of(context).pushNamed("/map_page");
                        },
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: IconButton(
                        icon:
                            SvgPicture.asset("assets/images/nav_ice_cream.svg"),
                        onPressed: () {
                          Navigator.of(context).pushNamed("/ice_cream_list");
                        },
                      ),
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
