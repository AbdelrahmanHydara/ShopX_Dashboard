import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx_dashboard/core/components/custom_text_form_field.dart';
import 'package:shopx_dashboard/core/helpers/product_validators.dart';
import 'package:shopx_dashboard/core/helpers/spacing.dart';
import 'package:shopx_dashboard/features/add_product/cubit/add_product_cubit.dart';

class FormFieldAddProducts extends StatelessWidget {
  const FormFieldAddProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddProductCubit>();
    return Form(
      key: cubit.formKey,
      autovalidateMode: cubit.autoValidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Product Name',
            labelText: 'Product Name',
            validator: (value) => ProductValidators.validateRequired(value, 'Product name'),
            onSaved: (value) => cubit.name = value ?? "",
            keyboardType: TextInputType.text,
          ),
          verticalSpace(16),
          CustomTextFormField(
            hintText: 'Product Code / SKU',
            labelText: 'Product Code / SKU',
            validator: (value) => ProductValidators.validateRequired(value, 'Product code/SKU'),
            onSaved: (value) => cubit.code = value!.toLowerCase(),
            keyboardType: TextInputType.text,
          ),
          verticalSpace(16),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: 'Price (EGP)',
                  labelText: 'Price (EGP)',
                  validator: ProductValidators.validatePrice,
                  onSaved: (value) => cubit.price = double.tryParse(value ?? '0') ?? 0.0,
                  keyboardType: TextInputType.number,
                ),
              ),
              horizontalSpace(16),
              Expanded(
                child: CustomTextFormField(
                  hintText: 'Old Price (Optional)',
                  labelText: 'Old Price (Optional)',
                  validator: ProductValidators.validateOptionalOldPrice,
                  onSaved: (value) => cubit.oldPrice = value != null && value.isNotEmpty ? int.tryParse(value) : null,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          verticalSpace(16),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: 'Quantity',
                  labelText: 'Quantity',
                  validator: ProductValidators.validateQuantity,
                  onSaved: (value) => cubit.quantity = int.tryParse(value ?? '0') ?? 0,
                  keyboardType: TextInputType.number,
                ),
              ),
              horizontalSpace(16),
              Expanded(
                child: CustomTextFormField(
                  hintText: 'Discount (%)',
                  labelText: 'Discount (%)',
                  validator: ProductValidators.validateDiscount,
                  onSaved: (value) => cubit.discount = int.tryParse(value ?? '0') ?? 0,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          verticalSpace(16),
          CustomTextFormField(
            hintText: 'Product Description (Max 250 words)',
            labelText: 'Product Description (Max 250 words)',
            validator: (value) => ProductValidators.validateRequired(value, 'Product description'),
            onSaved: (value) => cubit.description = value ?? '',
            keyboardType: TextInputType.text,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
