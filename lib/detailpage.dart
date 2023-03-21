import 'package:flutter/material.dart';
import 'package:kuis_prakmobile/coffee_menu.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final CoffeeMenu coffeeReceive;
  const DetailPage({Key? key, required this.coffeeReceive}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Detail Page"),
          ),
          body: Center(
            child: Column(
              children: [
                Text("Detail Page ${widget.coffeeReceive.name}"),
                Text(widget.coffeeReceive.description),
                Image.network(widget.coffeeReceive.imageUrls[0]),
                Text(widget.coffeeReceive.price),
                Text(widget.coffeeReceive.nutrition),
                Text('ingredients'),
                Text(widget.coffeeReceive.ingredients[0]),
                Text(widget.coffeeReceive.reviewAverage),
                Text(widget.coffeeReceive.reviewCount),
                // OutlinedButton(
                //   child: Text('Kembali'),
                //   onPressed: () {
                //     Navigator.pop(context);
                //   },
                // ),
                // ElevatedButton(
                //   child: Text('Pindah Screen tanpa Stack'),
                //   onPressed: () {
                //     Navigator.pushReplacement(context,
                //         MaterialPageRoute(builder: (context) {
                //       return HomePage();
                //     }));
                //   },
                // ),
                ElevatedButton(
                  onPressed: () {
                    _launchURL(widget.coffeeReceive.linkStore);
                  },
                  child: Text("Go to Store"),
                ),
              ],
            ),
          )),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
