import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx_dashboard/core/components/custom_appbar.dart';
import 'package:shopx_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:shopx_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:shopx_dashboard/core/services/get_it_service.dart';
import 'package:shopx_dashboard/features/add_product/cubit/add_product_cubit.dart';
import 'widgets/add_product_body_bloc_consumer.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(
        imagesRepo: getIt<ImagesRepo>(),
        productsRepo: getIt<ProductsRepo>(),
      ),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "Add New Product",
        ),
        body: AddProductBodyBlocConsumer(),
      ),
    );
  }
}