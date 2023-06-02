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
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: size.height / 1.8,
              color: Colors.red,
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
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.blue,
              ),
            ),
          ],
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
