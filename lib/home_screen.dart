import 'package:flutter/material.dart';
import 'add_product_screen.dart';
import 'edit_prodcut_screen.dart';

enum PopoupMenuType { edit, delete }

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
            color: Colors.black12,
          );
        },
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
              leading: const CircleAvatar(),
              title: const Text(
                "Product Name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Wrap(
                spacing: 30,
                children: [
                  Text(
                    "Product Code",
                    style: TextStyle(color: Colors.green),
                  ),
                  Text(
                    "Unit Price",
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(
                    "Quantity",
                    style: TextStyle(color: Colors.indigo),
                  ),
                  Text(
                    "Total Price",
                    style: TextStyle(color: Colors.amber),
                  ),
                ],
              ),
              trailing: PopupMenuButton<PopoupMenuType>(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: PopoupMenuType.edit,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EditProductScreen()),
                      );
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Edit"),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: PopoupMenuType.delete,
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                        SizedBox(width: 10),
                        Text("Delete"),
                      ],
                    ),
                  )
                ],
              ));
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddProductScreen()));
        },
        icon: const Icon(Icons.add),
        label: const Text("Add"),
      ),
    );
  }
}
