import 'package:cloud_firestore/cloud_firestore.dart';

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
