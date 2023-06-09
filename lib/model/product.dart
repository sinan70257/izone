import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:izone/controller/controllers.dart';

class Product {
  String name;
  String? id;
  String category;
  String price;
  String color;
  String variant;
  String description;
  String quantity;
  List images;

  Product({
    required this.quantity,
    required this.name,
    required this.images,
    required this.category,
    required this.price,
    required this.color,
    required this.variant,
    required this.description,
    this.id,
  });

  Future<void> addToFirestore() async {
    final ref = FirebaseFirestore.instance.collection('products');
    final docRef = ref.doc();
    String id = docRef.id;
    Map<String, dynamic> toMap() {
      return {
        "id": id,
        'name': name,
        'category': category,
        'price': price,
        'color': color,
        'variant': variant,
        'description': description,
        'quantity': quantity,
        'images': images,
      };
    }

    await docRef.set(toMap());
  }

  Future<void> addToFirestoreFeature() async {
    final ref = FirebaseFirestore.instance.collection('');
    final docRef = ref.doc();
    String id = docRef.id;
    Map<String, dynamic> toMap() {
      return {
        // "id": id,
        // 'name': name,
        // 'category': category,
        // 'price': price,
        // 'color': color,
        // 'variant': variant,
        // 'description': description,
        // 'quantity': quantity,
        'images': images,
      };
    }

    await docRef.set(toMap());
  }

  Future<void> updateToFirestore(product) async {
    final ref =
        FirebaseFirestore.instance.collection('products').doc(product["id"]);
    await ref.update(updateData());
  }

  Map<String, dynamic> updateData() {
    return {
      'name': name,
      'category': category,
      'price': price,
      'color': color,
      'variant': variant,
      'description': description,
      'quantity': quantity,
      'images': images,
    };
  }
}

void clear() {
  name_controller.clear();
  name_controller.clear();
  size_controller.clear();
  description_controller.clear();
  color_controller.clear();
  qty_controller.clear();
  price_controller.clear();
  category_controller.clear();
  category = null;
  variant = null;
  imgurl.clear();
}

Stream getProducts() async* {
  final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('products').get();
  final List<DocumentSnapshot> docs = querySnapshot.docs;
  yield docs;
}

class f {
  List<String> fimg;
  f({required this.fimg});
  Future<void> addToFirestoreFeature() async {
    final ref = FirebaseFirestore.instance.collection('feature');
    final docRef = ref.doc("images");
    // String id = docRef.id;
    Map<String, dynamic> toMap() {
      return {
        // "id": id,
        // 'name': name,
        // 'category': category,
        // 'price': price,
        // 'color': color,
        // 'variant': variant,
        // 'description': description,
        // 'quantity': quantity,
        'images': fimg,
      };
    }

    await docRef.set(toMap());
  }
}
