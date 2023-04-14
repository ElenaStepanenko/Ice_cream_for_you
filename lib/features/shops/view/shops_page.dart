import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../repositories/shop/models/shops_repository.dart';

class ShopsPage extends StatefulWidget {
  const ShopsPage({super.key});

  @override
  State<ShopsPage> createState() => _ShopsPageState();
}

class _ShopsPageState extends State<ShopsPage> {
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
              padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
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
                      items: <String>[
                        'Славица',
                        'Инмарко',
                        'Мороженое',
                        'Ice Cream'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: const Text(
                        'Выбрать фирму',
                        style:
                            TextStyle(color: Color.fromRGBO(59, 100, 228, 1.0)),
                      ),
                      onChanged: (_) {},
                    )
                  ]),
                  //const SizedBox(height: 15.0,),
                  Container(
                    height: MediaQuery.of(context).size.height - 175,
                    child: ListView.builder(

                        //padding: const EdgeInsets.all(20),
                        itemCount: shops.length,
                        itemBuilder: (_, index) => Card(
                              color: const Color.fromRGBO(255, 255, 255, 0.0),
                              elevation: 0,
                              margin: const EdgeInsets.only(top: 20),
                              child: ListTile(
                                title: Text(
                                  shops[index].name,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                subtitle: Text(shops[index].address),
                                leading: IconButton(
                                  icon: shops[index].photo,
                                  onPressed: null,
                                ),
                                //onTap: () => print("${shops[index].name} - tap"),
                              ),
                            )),
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
