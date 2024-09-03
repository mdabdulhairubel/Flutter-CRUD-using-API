import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product List",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 2,
            color: Colors.grey,
          );
        },
        itemCount: 20,
        itemBuilder: (context, index) {
          return const ListTile(
            leading: CircleAvatar(),
            title: Text(
              "Product Name",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Wrap(
              spacing: 30,
              children: [
                Text("Product Code", style: TextStyle(color: Colors.green),),
                Text("Unit Price", style: TextStyle(color: Colors.red),),
                Text("Quantity", style: TextStyle(color: Colors.indigo),),
                Text("Total Price", style: TextStyle(color: Colors.amber),),
              ],
            ),
          );
        },
      ),
    );
  }
}
