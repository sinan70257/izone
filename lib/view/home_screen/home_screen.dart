import 'dart:async';
import 'package:flutter/material.dart';
import 'package:izone/model/product.dart';
import 'package:izone/view/feature_imge_screen/feature_screen.dart';
import 'package:izone/view/home_screen/widgets/orders_list.dart';
import 'package:izone/view/home_screen/widgets/appbar.dart';
import 'package:izone/view/home_screen/widgets/producList.dart';
import 'package:izone/view/splash_screen/splash_screen.dart';
import 'package:izone/constants/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

BuildContext? ctx;
final List<Tab> myTabs = <Tab>[
  const Tab(text: ' Products '),
  const Tab(text: ' Orders '),
];
final List<Widget> myTabContents = <Widget>[productList(), ordersList()];

// ignore: camel_case_types
class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

// ignore: camel_case_types
class _homeScreenState extends State<homeScreen> {
  StreamSubscription? _subscription;
  @override
  void initState() {
    _subscription = getProducts().listen((event) {});
    super.initState();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ctx = context;
    sHeight = MediaQuery.of(context).size.height;
    sWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: customAppbar(context),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 40,
                  color: Colors.white,
                  child: TabBar(
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: sWidth! / 19),
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Colors.black,
                    tabs: myTabs,
                    indicatorColor: Colors.black,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: myTabContents,
                  ),
                ),
              ],
            ),
            Positioned(
              left: sWidth! / 1.25,
              top: sHeight! / 1.48,
              child: SizedBox(
                height: 60,
                width: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => featureImage(),
                        ));
                  },
                  child: Icon(Icons.add_photo_alternate_rounded),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    setState(() {
      isloggedIn1 = false;
    });
  }
}
