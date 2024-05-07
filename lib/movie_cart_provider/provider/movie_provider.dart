import 'dart:math';
import 'package:advanced_flutter/movie_cart_provider/model/movie_model.dart';
import 'package:flutter/cupertino.dart';

final List<MovieModel> movielist = List.generate(
    100,
    (index) => MovieModel(
        title: "Movie$index", time: "${Random().nextInt(100) + 60}minutes"));

class MovieProvider extends ChangeNotifier {
  // A class representing a provider for managing movie data and wishlists, extending ChangeNotifier for notifying listeners of changes

  final List<MovieModel> _movies =
      movielist; // A private list of MovieModel objects representing the available movies

  List<MovieModel> get movies =>
      _movies; // Getter method to access the list of available movies

  final List<MovieModel> _wishList =
      []; // A private list of MovieModel objects representing the wishlist

  List<MovieModel> get wishList =>
      _wishList; // Getter method to access the wishlist

  // Method to add a movie to the wishlist
  void addWishList(MovieModel selectedMovie) {
    wishList.add(selectedMovie); // Add the selected movie to the wishlist
    notifyListeners(); // Notify any listeners that the state has changed
  }

  // Method to remove a movie from the wishlist
  void removeWishList(MovieModel selectedMovie) {
    wishList
        .remove(selectedMovie); // Remove the selected movie from the wishlist
    notifyListeners(); // Notify any listeners that the state has changed
  }
}

/*
class MovieProvider extends ChangeNotifier {
  final List<MovieModel> _movies = movielist;

  List<MovieModel> get movies => _movies; //getter to access list of movies

  final List<MovieModel> _wishList = [];

  List<MovieModel> get wishList => _wishList;

  void addWishList(MovieModel selectedMovie) {
    wishList.add(selectedMovie);
    notifyListeners();
  }

  void removeWishList(MovieModel selectedMovie) {
    wishList.remove(selectedMovie);
    notifyListeners();
  }
}


 */
