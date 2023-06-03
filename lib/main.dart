import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_flutter/model/travel_model.dart';
import 'package:travel_flutter/util/app_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  double imageSized = AppLayout.getHeight(70);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: size.height / 1.8,
                color: Colors.white,
                child: Stack(
                  children: [
                    // Background Image
                    Container(
                      width: double.infinity,
                      height: size.height / 2.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                            AppLayout.getHeight(55),
                          ),
                          bottomRight: Radius.circular(
                            AppLayout.getHeight(55),
                          ),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                            travelList[_selectedIndex].img,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Head Icons
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          AppLayout.getWidth(16),
                          AppLayout.getHeight(20),
                          AppLayout.getWidth(16),
                          0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: AppLayout.getWidth(50),
                              height: AppLayout.getHeight(50),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0x68FFFFFF),
                              ),
                              child: const Icon(CupertinoIcons.arrow_left),
                            ),
                            Container(
                              width: AppLayout.getWidth(50),
                              height: AppLayout.getHeight(50),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0x68FFFFFF),
                              ),
                              child: const Icon(CupertinoIcons.heart),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // List Image
                    Positioned(
                      right: 0,
                      top: 80,
                      child: SizedBox(
                        width: AppLayout.getWidth(100),
                        height: double.maxFinite,
                        child: ListView.builder(
                          itemCount: travelList.length,
                          itemBuilder: (context, index) {
                            return imageItem(index);
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: AppLayout.getHeight(80),
                      left: AppLayout.getWidth(40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            travelList[_selectedIndex].name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: AppLayout.getHeight(8),
                          ),
                          Row(
                            children: [
                              const Icon(
                                CupertinoIcons.placemark_fill,
                                color: Colors.white,
                              ),
                              Text(
                                travelList[_selectedIndex].location,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side:
                                const BorderSide(color: Colors.grey, width: 1),
                          ),
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text("Temp"),
                                Text(
                                  '${travelList[_selectedIndex].temp} \u00b0 C',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blue.shade600),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side:
                                const BorderSide(color: Colors.grey, width: 1),
                          ),
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text("Distance"),
                                Text(
                                  '${travelList[_selectedIndex].distance} Km',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blue.shade600),
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side:
                                const BorderSide(color: Colors.grey, width: 1),
                          ),
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text("Rating"),
                                Text(
                                  travelList[_selectedIndex].rating,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blue.shade600),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Description"),
                          const SizedBox(
                            height: 8,
                          ),
                          ExpandableText(
                            travelList[_selectedIndex].description,
                            expandText: 'read more',
                            collapseText: 'less',
                            maxLines: 3,
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Total Price"),
                              SizedBox(
                                height: 8,
                              ),
                              Text('${travelList[_selectedIndex].price} \$')
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageItem(int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: AnimatedContainer(
              decoration: BoxDecoration(
                border: Border.all(
                  color: _selectedIndex == index
                      ? Colors.blue.shade600
                      : Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(travelList[index].img),
                ),
              ),
              width: _selectedIndex == index
                  ? imageSized + AppLayout.getWidth(15)
                  : imageSized,
              height: _selectedIndex == index
                  ? imageSized + AppLayout.getHeight(15)
                  : imageSized,
              duration: const Duration(milliseconds: 500),
            ),
          ),
        ),
      ],
    );
  }
}
