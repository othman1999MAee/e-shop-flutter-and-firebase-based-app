import 'package:eshop/screen/search_screen.dart';
import 'package:eshop/screen/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/color_utils.dart';
import 'Item.dart';
import 'Item1.dart';
import 'Item2.dart';
import 'Item3.dart';
import 'cart_screen.dart';
import 'data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("15ed4f"),
            hexStringToColor("2ab2e8")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
                child: Row(
                  children: [
                    Text(
                      'Eshop',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                    ),
                    Expanded(
                      child: Container(),
                    ),

                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Search()),
                          );
                        },
                        icon: FaIcon(FontAwesomeIcons.search)),
                    //if the user not sign in then take him to the sign in page else take him to the shopping cart page
                    IconButton(
                      onPressed: () {
                        if (FirebaseAuth.instance.currentUser == null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Cart()),
                          );
                        }
                      },
                      icon: FaIcon(FontAwesomeIcons.shoppingCart),
                    ),
                    IconButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("You have been logged out")));
                      },
                      icon: FaIcon(FontAwesomeIcons.signOutAlt),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trending',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                    ),
                    Text(
                      'See All',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 20,
                          childAspectRatio: 0.73),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        //if index==0 then go to the item page
                        return GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Item()),
                              );
                            } else if (index == 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Item1()),
                              );
                            } else if (index == 2) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Item2()),
                              );
                            } else if (index == 3) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Item3()),
                              );
                            }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: Color(products[index]['color']),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            radius: 55,
                                            backgroundColor: Colors.white,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            radius: 55,
                                            backgroundColor:
                                                Color(products[index]['color'])
                                                    .withOpacity(0.5),
                                          ),
                                        ),
                                        Image.network(
                                          products[index]['image'],
                                          height: 160,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Text(products[index]['name'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400)),
                              Text(
                                r'$' + products[index]['price'],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
