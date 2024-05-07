import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;
    var devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text(
        //     'Home',
        //     style: TextStyle(
        //         color: ColorConstants.blackColor, fontWeight: FontWeight.bold),
        //   ),
        // ),
        // body: Center(
        //   child: Text("Home screen"),
        // ),
        appBar: AppBar(
          title: Text('Title'),
          centerTitle: true,
          toolbarHeight: devHeight * .1,
          actions: [
            IconButton(
                onPressed: () {}, icon: Icon(CupertinoIcons.cart_badge_plus))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(devHeight * 0.01),
          child: GridView.builder(
              itemCount: 12,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: .58,
                  crossAxisCount: 2,
                  crossAxisSpacing: devHeight * .008,
                  mainAxisSpacing: devWidth * 0.02),
              itemBuilder: (context, index) {
                return InkWell(child: Text('Wrapped with Inkwell'));
              }),
        ));
  }
}
