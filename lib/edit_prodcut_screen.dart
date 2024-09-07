import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final TextEditingController _titleTEC = TextEditingController();
  final TextEditingController _quantityTEC = TextEditingController();
  final TextEditingController _productCodeTEC = TextEditingController();
  final TextEditingController _unitePriceTEC = TextEditingController();
  final TextEditingController _totalPriceTEC = TextEditingController();
  final TextEditingController _imageTEC = TextEditingController();
  final GlobalKey<FormState> _formKEY = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKEY,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleTEC,
                  decoration: const InputDecoration(
                    hintText: 'Enter Your Title',
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value!.trim().isEmpty) {
                      return "Enter Product Title";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _productCodeTEC,
                  decoration: const InputDecoration(
                    hintText: 'Enter Product Code',
                    labelText: 'Code',
                    border: OutlineInputBorder(),

                  ),
                  validator: (String? value) {
                    if (value!.trim().isEmpty) {
                      return "Enter Product Title";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _quantityTEC,
                  decoration: const InputDecoration(
                    hintText: 'Enter Product Quantity',
                    labelText: 'Quantity',
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value!.trim().isEmpty) {
                      return "Enter Product Title";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _unitePriceTEC,
                  decoration: const InputDecoration(
                    hintText: 'Enter Unit Price',
                    labelText: 'Unit Price',
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value!.trim().isEmpty) {
                      return "Enter Product Title";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _totalPriceTEC,
                  decoration: const InputDecoration(
                    hintText: 'Enter Total Price',
                    labelText: 'Total Price',
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value!.trim().isEmpty) {
                      return "Enter Product Title";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _imageTEC,
                  decoration: const InputDecoration(
                    hintText: 'Enter Image URL',
                    labelText: 'Image',
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value!.trim().isEmpty) {
                      return "Enter Product Title";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                      ),
                        onPressed: () {
                          if (_formKEY.currentState!.validate()) {

                          }
                        }, child: const Text("Add"),),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
