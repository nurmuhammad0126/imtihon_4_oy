import 'package:exam_4/core/extension/context_extensions.dart';
import 'package:exam_4/core/extension/size_extensions.dart';
import 'package:exam_4/core/widgets/w_rounded_container.dart';
import 'package:exam_4/feature/home/presentation/blocs/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDropdown extends StatefulWidget {
  const CategoryDropdown({super.key});

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  final List<String> categories = ["SALADS", "NATIONAL", "FAST_FOOD"];
  String selected = "SALADS";

  @override
  Widget build(BuildContext context) {
    return WRoundedContainer(
      color: context.colors.white,
      border: Border.all(color: context.colors.blueGray.withOpacity(0.5)),
      borderRadius: BorderRadius.circular(30.o),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          dropdownColor: context.colors.white,
          borderRadius: BorderRadius.circular(22.o),
          value: selected,
          icon: Icon(Icons.arrow_drop_down, color: Colors.orange),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 16,
          ),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                selected = value;
                context.read<ProductBloc>().add(
                  LoadProducts(value.toLowerCase()),
                );
              });
            }
          },
          items:
              categories.map((item) {
                return DropdownMenuItem<String>(value: item, child: Text(item));
              }).toList(),
        ),
      ),
    );
  }
}
