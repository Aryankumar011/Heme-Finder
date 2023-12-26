import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> createOrderMessage() async {
  var order = await fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder() =>
    // Imagine that this function is
    // more complex and slow.
    Future.delayed(
      const Duration(seconds: 2),
      () => 'Large Latte',
    );

Future<void> main() async {
  // print('Fetching user order...');
  // print(await createOrderMessage());
  try {
    getData();
  } catch (e) {
    print(e);
  }
}

Future<dynamic> getData() async {
  final DocumentReference document =
      FirebaseFirestore.instance.collection("Categories").doc();

  await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
    print(document.toString());
  });
}
