import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_crud_api/product.dart';
import 'add_product_screen.dart';
import 'edit_prodcut_screen.dart';
import 'package:http/http.dart';

enum PopoupMenuType { edit, delete }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> productList = [];
  bool _getInProgress = false;

  @override
  void initState() {
    super.initState();
    getProductListFromAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product List",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Visibility(
        visible: _getInProgress==false,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 2,
              color: Colors.black12,
            );
          },
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(productList[index].Img ?? ""),
                ),
                title: Text(
                  productList[index].ProductName ?? "",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Wrap(
                  spacing: 30,
                  children: [
                    Text(
                      "Product Code: ${productList[index].ProductCode ?? ""}",
                      style: const TextStyle(color: Colors.green),
                    ),
                    Text(
                      "Unit Price: ${productList[index].UnitPrice ?? ""}",
                      style: const TextStyle(color: Colors.red),
                    ),
                    Text(
                      "QTY: ${productList[index].Qty ?? ""}",
                      style: const TextStyle(color: Colors.indigo),
                    ),
                    Text(
                      "Total Price: ${productList[index].TotalPrice ?? ""}",
                      style: const TextStyle(color: Colors.amber),
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
                          MaterialPageRoute(
                              builder: (context) => const EditProductScreen()),
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
                    PopupMenuItem(
                      value: PopoupMenuType.delete,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Delete Product"),
                                content: const Text(
                                    "Are you sure want to delete this product?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Yes, Delete",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: const Row(
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

  Future<void> getProductListFromAPI() async {
    _getInProgress =true;
    setState(() {});
    // Make URI
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');
    // call Api
    Response response = await get(uri);

    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      if (decodedResponse['status'] == 'success') {
        var list = decodedResponse['data'];
        for (var item in list) {
          Product product = Product(
            id: item['_id'],
            ProductName: item['ProductName'],
            ProductCode: item['ProductCode'],
            Img: item['Img'],
            UnitPrice: item['UnitPrice'],
            Qty: item['Qty'],
            TotalPrice: item['TotalPrice'],
            CreatedDate: item['CreatedDate'],
          );
          productList.add(product);
        }
      }
      setState(() {});
    }
    _getInProgress=false;
    setState(() {});
  }
}
