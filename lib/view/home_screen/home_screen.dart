import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:izone/view/add_producf_screen/add_products.dart';
import 'package:izone/view/add_producf_screen/controllers/controllers.dart';
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

Align floatingButton(BuildContext ctx) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: SizedBox(
      height: sHeight! / 20,
      width: sWidth! / 1.1,
      child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: customElevatedBotton(
              label: "Add new product", logo: Icons.add, ctx: ctx)),
    ),
  );
}

Widget customElevatedBotton(
    {required String label,
    required IconData logo,
    required BuildContext ctx}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      onPressed: () {
        log(variant.toString());
        Navigator.of(ctx).push(MaterialPageRoute(
          builder: (context) => addProduct(),
        ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(logo), Text(" $label")],
      ));
}

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

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
        body: Column(
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

Stream getProducts() async* {
  final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('products').get();
  final List<DocumentSnapshot> docs = querySnapshot.docs;
  yield docs;
}
