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
          title: Text(widget.coffeeReceive.name),
        ),
        body: Column(
          children: [
            Text(
              "Detail Page ${widget.coffeeReceive.name}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              itemBuilder: (context, index) {
                final dataCoffee = coffeeList[index];
                return Card(
                  child: Row(
                    children: [
                      Image.network(dataCoffee.imageUrls[index],
                          width: 80, height: 80),
                    ],
                  ),
                );
              },
              itemCount: widget.coffeeReceive.imageUrls.length,
            ),
            Text(
              "Coffee Name:  ${widget.coffeeReceive.name}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Description : ${widget.coffeeReceive.description}"),
            Text(
              'ingredients',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              itemBuilder: (context, index) {
                final dataCoffee = coffeeList[index];
                return Card(
                  child: Row(
                    children: [
                      Text(widget.coffeeReceive.ingredients[index]),
                    ],
                  ),
                );
              },
              itemCount: widget.coffeeReceive.imageUrls.length,
            ),
            Text("Nutrition : ${widget.coffeeReceive.nutrition}"),
            Text(
                "Review : ${widget.coffeeReceive.reviewAverage} of ${widget.coffeeReceive.reviewCount}"),
            Text(
              "Price ${widget.coffeeReceive.price}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
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
      ),
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
