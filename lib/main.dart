import 'package:flutter/material.dart';
import 'package:grocery_shop_app/titles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeRoot(),
    );
  }
}

class HomeRoot extends StatefulWidget {

  @override
  State<HomeRoot> createState() => _HomeRootState();
}

class _HomeRootState extends State<HomeRoot> {

  int currentIndex=0;
  List pages=[
    Home(),
    Center(child: Text("card")),
    Center(child: Text("account")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },

        selectedItemColor: Color(0xff006400),
        currentIndex: currentIndex,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",tooltip:"Home" , ),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Card", tooltip: "Card"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account", tooltip: "Account"),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}


class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownvalue = 'Kochi';

  // List of items in our dropdown menu
  var items = [
    'Kochi',
    'Calicut',
    'Bangalore',
    'kollam',
    'Malappuram',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.location_on),
        DropdownButton(
            value: dropdownvalue,
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white,),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items, style: TextStyle(fontSize: 15, color: Colors.white),),
              );
            }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownvalue = newValue!;
            });
          },
        ),
          SizedBox(
            width: 3,
          )
        ],
        backgroundColor: Colors.green,
        title: const Text("Farmers Fresh zone"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search for Vegetables, Fruits",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  filled: true,
                  fillColor: Colors.white),
            ),
          ),
        ),
      ),
      body: ListView(
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                  itemCount: titles.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: headerTitles(index),
                    );
                  }),
            ),
            Stack(
                children: [
              Container(
                  height: 160,
                  width: double.infinity,
                  // color: Colors.red,
                  child: Image.asset("assets/home3.jpg", fit: BoxFit.cover,)),
                  Positioned(
                    left: 15,
                    top: 40,
                    child: RichText(
                      text: TextSpan(
                        text: 'Begin your Healthy Lifestyle\n',
                        style: TextStyle(fontSize: 17, letterSpacing: .6, fontWeight: FontWeight.w500),
                        children: const <TextSpan>[
                          TextSpan(text: 'At Best Prices!',
                              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30)),
                        ],
                      ),
                    ),
                  ),

            ]),
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width*0.9,
                height: 90,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.green),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/clock.png",width: 40,),
                        SizedBox(height: 10,),
                        Text('30 Minute Policy', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/pngwing.com (3).png",width: 50, height: 40,),
                        SizedBox(height: 10,),
                        Text('30 Minute Policy', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/pngwing.com (2).png",width: 50,),
                        SizedBox(height: 10,),
                        Text('30 Minute Policy', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Shop By Category", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
            ),
            // GridView.builder(
            //   shrinkWrap: true,
            //     physics: NeverScrollableScrollPhysics(),
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            //     itemBuilder: (context, index){
            //       return Container(
            //         width: 200,
            //         height: 200,
            //         color: Colors.red,
            //       );
            //     }
            // )
            GridView(
              padding: EdgeInsets.all(10),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3),
              children: [
                Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                    boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(
                        0,
                        3
                      )
                    )
                  ]
                ),
                child: Column(
                  children: [
                    Container(
                       width:double.infinity,
                        height: 80,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(image[0],fit: BoxFit.cover,))
                    ),
                    SizedBox(height: 10,),
                    Center(child: Text(titles[0]))
                  ],
                ),
              ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(
                                0,
                                3
                            )
                        )
                      ]
                  ),
                  child: Column(
                    children: [
                      Container(
                          width:double.infinity,
                          height: 80,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(image[1],fit: BoxFit.cover,))
                      ),
                      SizedBox(height: 10,),
                      Center(child: Text(titles[1]))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(
                                0,
                                3
                            )
                        )
                      ]
                  ),
                  child: Column(
                    children: [
                      Container(
                          width:double.infinity,
                          height: 80,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(image[2],fit: BoxFit.cover,))
                      ),
                      SizedBox(height: 10,),
                      Center(child: Text(titles[2]))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(
                                0,
                                3
                            )
                        )
                      ]
                  ),
                  child: Column(
                    children: [
                      Container(
                          width:double.infinity,
                          height: 80,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(image[3],fit: BoxFit.cover,))
                      ),
                      SizedBox(height: 10,),
                      Center(child: Text(titles[3]))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(
                                0,
                                3
                            )
                        )
                      ]
                  ),
                  child: Column(
                    children: [
                      Container(
                          width:double.infinity,
                          height: 80,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(image[4],fit: BoxFit.cover,))
                      ),
                      SizedBox(height: 10,),
                      Center(child: Text(titles[4]))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(
                                0,
                                3
                            )
                        )
                      ]
                  ),
                  child: Column(
                    children: [
                      Container(
                          width:double.infinity,
                          height: 80,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(image[5],fit: BoxFit.cover,))
                      ),
                      SizedBox(height: 10,),
                      Center(child: Text(titles[5]))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(
                                0,
                                3
                            )
                        )
                      ]
                  ),
                  child: Column(
                    children: [
                      Container(
                          width:double.infinity,
                          height: 80,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(image[6],fit: BoxFit.cover,))
                      ),
                      SizedBox(height: 10,),
                      Center(child: Text(titles[6]))
                    ],
                  ),
                ),

              ],)
         ]
        ),
    );
  }

  Widget headerTitles(int index) {
    return GestureDetector(
      onTap: () {},
      child: Chip(
        backgroundColor: Colors.grey[200],
        padding: EdgeInsets.all(7),
        label: Text(
          titles[index],
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}

