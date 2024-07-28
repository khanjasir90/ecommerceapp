import 'package:ecommerceapp/features/feed/data/dto/product_dto.dart';
import 'package:ecommerceapp/features/feed/data/product_feed_repo_impl.dart';
import 'package:ecommerceapp/features/feed/data/source/product_feed_client.dart';
import 'package:ecommerceapp/features/feed/domain/repository/product_feed_repo.dart';
import 'package:ecommerceapp/features/feed/presentation/change_notifier/product_feed_change_notifier.dart';
import 'package:ecommerceapp/features/feed/presentation/view/product_feed_view.dart';
import 'package:ecommerceapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductFeedPage extends StatefulWidget {
  const ProductFeedPage({super.key});

  @override
  State<ProductFeedPage> createState() => _ProductFeedPageState();
}

class _ProductFeedPageState extends State<ProductFeedPage> {
  late Future<ProductDto> _futureProductFeed;

  @override
  void initState() {
    super.initState();
    _futureProductFeed = loadData();
  }

  Future<ProductDto> loadData() async {
    final ProductFeedRepo productFeedRepo =
        ProductFeedRepoImpl(productFeedClient: ProductFeedClientImpl());
    return await productFeedRepo.getAllProductFeed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: _futureProductFeed,
            builder: (context, snapshot) {
              Widget widget = const SizedBox.shrink();
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return ChangeNotifierProvider<ProductFeedChangeNotifier>(
                    create: (context) => ProductFeedChangeNotifier(
                        productFeed: snapshot.data as ProductDto),
                    child: const ProductFeedView(),
                  );
                } else if (snapshot.hasError) {
                  widget = const Text(Strings.somethingWentWrong);
                } else {
                  widget = const Text(Strings.noDataFound);
                }
              } else {
                widget = const CircularProgressIndicator();
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Center(child: widget),
                ],
              );
            }),
      ),
    );
  }
}
