import 'package:flutter/material.dart';
import '../../core/api/api_service_product.dart';
import 'product_detail_page.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final apiService = ApiServiceProduct();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Listado de Posts")),
      body: FutureBuilder(
        future: apiService.fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Error al cargar"));
          }

          final posts = snapshot.data as List;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return Card(
                child: ListTile(
                  title: Text(post['title']),
                  subtitle: Text(post['body']),
                  trailing: Text("User: ${post['userId']}"),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ProductDetailPage()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}