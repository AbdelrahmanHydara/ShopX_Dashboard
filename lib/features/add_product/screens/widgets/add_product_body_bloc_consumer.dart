import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx_dashboard/core/helpers/show_app_toast.dart';
import 'package:shopx_dashboard/features/add_product/cubit/add_product_cubit.dart';
import 'package:shopx_dashboard/features/add_product/screens/widgets/add_product_body_screen.dart';

class AddProductBodyBlocConsumer extends StatelessWidget {
  const AddProductBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit,AddProductState>(
        listener: (BuildContext context, state) {
          if (state is AddProductSuccess) {
            showAppToast(
              message: "Product added successfully",
              bgColor: Colors.green,
            );
          }
          else if (state is AddProductFailure) {
            showAppToast(
              message: state.errorMessage,
              bgColor: Colors.red,
            );
          }
        },
        builder: (BuildContext context, state) {
          return const AddProductBodyScreen();
        }
    );
  }
}
