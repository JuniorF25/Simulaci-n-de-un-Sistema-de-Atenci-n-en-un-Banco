import 'package:flutter/material.dart';
import '../../core/api/api_service_product.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final userIdController = TextEditingController();
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final apiService = ApiServiceProduct();

  void _submit() async {
    final postData = {
      'userId': int.parse(userIdController.text),
      'title': titleController.text,
      'body': bodyController.text,
    };

    try {
      final response = await apiService.createPost(postData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Post creado con ID: ${response['id']}")),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error al crear post")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nuevo Post")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: userIdController,
              decoration: const InputDecoration(labelText: "User ID"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Título"),
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(labelText: "Mensaje"),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _submit, child: const Text("Guardar")),
          ],
        ),
      ),
    );
  }
}
