import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/features/shops/view/seacrh_bar_for_shops.dart';
import '../../../repositories/shop/models/shops_repository.dart';

class ShopsPage extends StatefulWidget {
  const ShopsPage({super.key});

  @override
  State<ShopsPage> createState() => _ShopsPageState();
}

class _ShopsPageState extends State<ShopsPage> {
  final List<String> filter = ['', 'Славица', 'Инмарко', 'Мороженое', 'Сладко'];
  List<Shop> filtredShops = shops;
  String filterText = 'Выбрать фирму';

  void onFilterChange(String value) {
    setState(() {
      if (value == '') {
        filtredShops = shops;
        filterText = 'Выбрать фирму';
      } else {
        filtredShops = shops.where((shops) => shops.name == value).toList();
        filterText = value;
      }
    });
  }

  void updateShopsList(List<Shop> updatedShops) {
    setState(() {
      filtredShops = updatedShops;
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
                          child: SearchBarShops(
                            shops: filtredShops,
                            onShopsListChanged: updateShopsList,
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
                    child: ListView.builder(
                        //padding: const EdgeInsets.all(20),
                        itemCount: filtredShops.length,
                        itemBuilder: (_, index) => Card(
                              color: const Color.fromRGBO(255, 255, 255, 0.0),
                              elevation: 0,
                              margin: const EdgeInsets.only(top: 20),
                              child: ListTile(
                                title: Text(
                                  filtredShops[index].name,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                subtitle: Text(filtredShops[index].address),
                                leading: IconButton(
                                  icon: filtredShops[index].photo,
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
                  "assets/images/1_nav_page.svg",
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
                        onPressed: () {},
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
