import 'dart:math';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

// import '../utils/mycolor.dart';
// import '../utils/text-style.dart';

void main() {
  runApp(MaterialApp(home: PlantLogin()));
}

class PlantLogin extends StatelessWidget {
  var lists = [
    {
      "name": "Filodendro  Atom",
      "pic":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwmM7RdbJzSWl443wI9hqmuMhncWgXrNX42F3-XXcYOQ&s",
      "quantity": "250 ml"
    },
    {
      "name": "Monstera  Deliciosa",
      "pic":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwmM7RdbJzSWl443wI9hqmuMhncWgXrNX42F3-XXcYOQ&s",
      "quantity": "500 ml"
    },
    {
      "name": "Chrophythum ",
      "pic":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwmM7RdbJzSWl443wI9hqmuMhncWgXrNX42F3-XXcYOQ&s",
      "quantity": "500 ml"
    },
    {
      "name": "Kentiapalm",
      "pic":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwmM7RdbJzSWl443wI9hqmuMhncWgXrNX42F3-XXcYOQ&s",
      "quantity": "250 ml"
    },
    {
      "name": "Peperomia\n Obtusifula",
      "pic":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwmM7RdbJzSWl443wI9hqmuMhncWgXrNX42F3-XXcYOQ&s",
      "quantity": "250 ml"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 15),
          child: Icon(
            Icons.settings,
            size: 35,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: CircleAvatar(
              child: Icon(
                Icons.add,
                size: 35,
              ),
            ),
          )
        ],
      ),
      // Align(
      //   alignment: Alignment.bottomLeft,
      //   child: Text(
      //     "Water Today",
      //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
      //   ),
      // ),
      body: ListView.separated(
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    child: ListTile(
                      leading: Container(
                        // height: 400,width: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("${lists[index]['pic']}"))),
                        child: Image.network("${lists[index]['pic']}"),
                      ),
                      // leading:  CircleAvatar(
                      // backgroundColor: MyColors.iconColors,
                      // backgroundImage: NetworkImage("${lists[index]['pic']}"
                      //     ),
                      // ),
                      trailing: Icon(
                        Icons.water_drop,
                        color: Colors.white,
                        size: 50,
                      ),

                      title: Text("${lists[index]['name']}",
                          style: GoogleFonts.abel(fontSize: 40)),

                      subtitle: Row(
                        children: [
                          Icon(
                            Icons.water_drop,
                            color: Colors.white,
                          ),
                          Text(
                            "${lists[index]['quantity']}",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    )),
              ),
          separatorBuilder: (context, index) {
            if ((index + 1) % 4 == 0 && index != lists.length - 1) {
              return SizedBox(
                height: 20, child: Text("hi"),
                // Adjust this value according to your preference
              );
            } else {
              return Container();
            }
          },
          physics: BouncingScrollPhysics(),
          itemCount: lists.length),
    );
  }
}
