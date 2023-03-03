import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<int> items = [];

  int item = 1;

  additem(context) {
    items.isEmpty ? items.add(item = 1) : items.add(item);
    item++;
  }

  deleteitem(context, item) {
    setState(() {});
    items.remove(items[item]);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 3, 21, 37),
        appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: Size(size.width, size.height / 60),
              child: const Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  "Flutter Mapp",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              )),
          toolbarHeight: 100,
          backgroundColor: const Color.fromARGB(255, 83, 81, 81),

          //centerTitle: true,
          leading: Container(),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        additem(context);
                        setState(() {});
                        print(items.toString());
                        // items.add(1);
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      ))
                ],
              ),
              AnimationLimiter(
                key: ValueKey(items.length),
                child: ListView.builder(
                  reverse: true,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (items.isEmpty) {
                      item == 0;
                      items.clear();
                    }
                    return AnimationConfiguration.staggeredList(
                      position: items.length,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        verticalOffset: -50,
                        key: ValueKey(items.length),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: Container(
                          height: size.height / 14,
                          width: size.width * 0.9,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 204, 38),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.7),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2))
                              ]),
                          child: ListTile(
                            title: Text(
                              "Item " + items[index].toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  deleteitem(context, index);
                                  print(item.toString() + " removed");
                                  print(items.toString());

                                  // items = 0;
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: items.length,
                ),
              ),
            ],
          ),
        ));
  }
}
