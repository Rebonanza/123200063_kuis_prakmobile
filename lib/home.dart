import 'package:flutter/material.dart';
import 'package:kuis_prakmobile/coffee_menu.dart';
import 'package:kuis_prakmobile/detailpage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Main Page"),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              final dataCoffee = coffeeList[index];
              return Card(
                  child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailPage(coffeeReceive: dataCoffee);
                  }));
                },
                child: Row(
                  children: [
                    Column(
                      children: [
                        Image.network(dataCoffee.imageUrls[0],
                            width: 80, height: 80),
                      ],
                    ),
                    Text(dataCoffee.name),
                  ],
                ),
              ));
            },
            itemCount: coffeeList.length,
          )),
    );
  }
}
