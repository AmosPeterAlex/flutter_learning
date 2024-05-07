import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/movie_provider.dart';

class Wishlist1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var wishlistt = context.watch<MovieProvider>().wishList;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Wishlist",

        ),
      ),
      body: ListView.builder(
          itemCount: wishlistt.length,
          itemBuilder: (context, index) => Card(
            color: Colors.pink[100],
            child: ListTile(
              title: Text(wishlistt[index].title,),
              subtitle: Text(wishlistt[index].time,),
              trailing: IconButton(
                  onPressed: () {
                    context
                        .read<MovieProvider>()
                        .removeWishList(wishlistt[index]);
                  },
                  icon: Icon(
                    Icons.delete_outline,color: Colors.red[900],
                  )),
            ),
          )),
    );
  }
}