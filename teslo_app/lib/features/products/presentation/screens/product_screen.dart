import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductScreen extends ConsumerStatefulWidget {
  final String productId;
  const ProductScreen({super.key, required this.productId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.productId);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit product'),
      ),
      body: Center(
        child: Text(widget.productId),
      ),
    );
  }
}
