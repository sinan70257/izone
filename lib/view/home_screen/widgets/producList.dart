import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:izone/constants/constant.dart';
import 'package:izone/view/edit_screen/edit_products.dart';
import 'package:izone/view/home_screen/home_screen.dart';
import 'package:izone/view/product_details_screen/product_details.dart';

class productList extends StatefulWidget {
  const productList({
    super.key,
  });

  @override
  State<productList> createState() => _productListState();
}

class _productListState extends State<productList> {
  late Stream stream;
  @override
  void initState() {
    stream = getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: sHeight! / 17,
                    // alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Kgrey,
                    ),
                    // ignore: prefer_const_constructors
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: IntrinsicWidth(
                          stepHeight: 1,
                          stepWidth: 1,
                          child: TextFormField(
                            textDirection: TextDirection.ltr, // maxLength: 1,

                            // textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: sHeight! / 80,
                                  right: sWidth! / 18,
                                  bottom: sHeight! / 80),
                              alignLabelWithHint: true,
                              prefixIcon: const Icon(
                                Icons.search,
                              ),
                              hintText: 'Search',
                              hintStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              StreamBuilder(
                  stream: stream,
                  builder: (context, snapshot) {
                    final data = snapshot.data;
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (snapshot.connectionState == ConnectionState.done ||
                        snapshot.connectionState == ConnectionState.active) {
                      if (snapshot.hasData) {
                        return snapshot.data!.isEmpty
                            ? Text('list empty')
                            : Expanded(
                                child: ListView(
                                  physics: BouncingScrollPhysics(),
                                  children: [
                                    ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: snapshot.data.length,
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final product = data[index];
                                          return Slidable(
                                            endActionPane: ActionPane(
                                                motion: const BehindMotion(),
                                                children: [
                                                  SlidableAction(
                                                    onPressed: (context) async {
                                                      await deleteProduct(
                                                          product['id']);
                                                      setState(() {
                                                        stream = getProducts();
                                                      });
                                                    },
                                                    backgroundColor: Colors.red,
                                                    icon: Icons.close_rounded,
                                                    label: 'Delete',
                                                  ),
                                                  SlidableAction(
                                                    onPressed: (context) async {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                editProduct(
                                                                    product:
                                                                        product),
                                                          ));
                                                    },
                                                    backgroundColor: Kblue,
                                                    icon: Icons.edit_rounded,
                                                    label: 'Edit',
                                                  ),
                                                ]),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: sWidth! / 30),
                                              height: sHeight! / 10,
                                              width: sWidth! / 1.01,
                                              child: Center(
                                                child: ListTile(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .push(
                                                              MaterialPageRoute(
                                                        builder: (context) =>
                                                            productDetails(
                                                                data: product),
                                                      ));
                                                    },
                                                    tileColor: Kgrey,
                                                    contentPadding:
                                                        EdgeInsets.all(10),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      //<-- SEE HERE
                                                      side: BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    leading: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.network(
                                                          product["images"][0]),
                                                    ),
                                                    trailing: Padding(
                                                      padding: EdgeInsets.only(
                                                          right: sWidth! / 20),
                                                      child: Text(
                                                        product["quantity"]
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    title:
                                                        Text(product["name"])),
                                              ),
                                            ),
                                          );
                                        }),
                                    SizedBox(
                                      height: 50,
                                    )
                                  ],
                                ),
                              );
                      }
                    }
                    return Text('Error');
                  }),
            ],
          ),
          floatingButton(ctx!)
        ],
      ),
    );
  }
}

Future<void> deleteProduct(String id) async {
  try {
    // Get a reference to the product document in the database
    final productRef =
        FirebaseFirestore.instance.collection('products').doc(id);

    // Delete the product document from the database
    await productRef.delete();
    print('Product with ID $id has been deleted successfully!');
  } catch (error) {
    print('Error deleting product with ID $id: $error');
  }
}
