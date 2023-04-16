import 'package:flutter/material.dart';
import 'package:izone/constants/constant.dart';
import 'package:izone/view/order_details_screen/order_details.dart';

class ordersList extends StatelessWidget {
  const ordersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          space10(),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) => space10(),
                itemCount: 0,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: sWidth! / 30),
                    height: sHeight! / 13,
                    width: sWidth! / 1.5,
                    child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => orderDetail(title: ""),
                          ));
                        },
                        tileColor: Kgrey,
                        // contentPadding: const EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          //<-- SEE HERE
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: const Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 10),
                          child: Text(
                            "",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        )),
                  );
                }),
          )
        ],
      ),
    );
  }
}
