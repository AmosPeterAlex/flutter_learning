import 'package:advanced_flutter/movie_cart_provider/provider/movie_provider.dart';
import 'package:advanced_flutter/movie_cart_provider/view/movie_wishlist.dart';
import 'package:flutter/material.dart';

// import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<MovieProvider>(
      create: (context) => MovieProvider(),
      child: MaterialApp(
        home: MovieMain(),
      ),
    ),
  );
}

class MovieMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var moviess = context.watch<MovieProvider>().movies;
    var wishlistt = context.watch<MovieProvider>().wishList;
    /*
    var movieProvider = Provider.of<MovieProvider>(context);
    var moviess = movieProvider.movies;
    var wishlistt = movieProvider.wishList;

     */
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movies",
        ),
      ),
      body: Column(
        children: [
          ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Wishlist1()));
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              label: Text(
                "Wishlist ${wishlistt.length}",
              )),
          Expanded(
              child: ListView.builder(
                  itemCount: moviess.length,
                  itemBuilder: (context, index) => Card(
                        color: Colors.purple[200],
                        child: ListTile(
                          title: Text(
                            moviess[index].title,
                          ),
                          subtitle: Text(
                            moviess[index].time,
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                if (!wishlistt.contains(moviess[index])) {
                                  context
                                      .read<MovieProvider>()
                                      .addWishList(moviess[index]);
                                } else {
                                  context
                                      .read<MovieProvider>()
                                      .removeWishList(moviess[index]);
                                }
                              },
                              /*
                              onPressed: () {
                                        var movieProvider = Provider.of<MovieProvider>(context, listen: false);
                                         if (!wishlistt.contains(moviess[index])) {
                                             movieProvider.addWishList(moviess[index]);
                                               } else {
                                              movieProvider.removeWishList(moviess[index]);
                                               }
                                             },

                               */
                              icon: Icon(
                                Icons.favorite,
                                color: wishlistt.contains(moviess[index])
                                    ? Colors.red
                                    : Colors.black54,
                              )),
                        ),
                      )))
        ],
      ),
    );
  }
}
