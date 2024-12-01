import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_app/features/products/presentation/providers/providers.dart';

class ProductScreen extends ConsumerWidget {
  final String productId;
  const ProductScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productProvider(productId));
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Edit Product')),
        actions: [
          IconButton(
              icon: const Icon(Icons.camera_alt_outlined), onPressed: () {}),
        ],
      ),
      body: Center(child: Text(productState.product?.title ?? 'Loading...')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save_as_outlined),
      ),
    );
  }
}
